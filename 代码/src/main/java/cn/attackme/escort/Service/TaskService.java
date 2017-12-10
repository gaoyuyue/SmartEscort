package cn.attackme.escort.Service;

import cn.attackme.Wechat.Message.RowMessage;
import cn.attackme.escort.Model.*;
import cn.attackme.escort.Model.Package;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import java.util.*;

import static cn.attackme.Wechat.Util.MessageUtil.postTemplate;

/**
 * Created by arthurme on 2017/7/11.
 */
@Service
public class TaskService {
    @Autowired
    private PackageService packageService;
    @Autowired
    private CreditRecordService creditRecordService;

    @Scheduled(cron = "0 */2 * * * ? ")
    public void timeoutDetection(){
        List<Package> packageList = packageService.getListByStatusList(Arrays.asList(PackageStatus.待领取,PackageStatus.待送达,PackageStatus.待签收));
        Date date = new Date();
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(date);
        calendar.add(Calendar.HOUR, -2);
        Date publishTime = calendar.getTime();
        calendar.setTime(date);
        calendar.add(Calendar.HOUR, -1);
        Date receiveTime = calendar.getTime();
        calendar.setTime(date);
        calendar.add(Calendar.HOUR, -1);
        Date deliveryTime = calendar.getTime();
        packageList.stream().forEach(p->{
            if(p.getPackageStatus().equals(PackageStatus.待领取) && publishTime.after(p.getPublishTime())){
                p.setEndTime(date);
                p.setOrderResult(OrderResult.待领取超时);
                p.setPackageStatus(PackageStatus.已撤销);
                Map<String,RowMessage> messageMap = new HashMap<>();
                messageMap.put("orderId",new RowMessage(p.getId(),"red"));
                messageMap.put("orderResult",new RowMessage("领取超时以被自动撤销","red"));
                postTemplate(p.getDelegation().getOpenid(),"YwTcTGHWjnuegP1VE5I_CpD98QJGtwbWnmMjHIUGNEs","/User/AllDart/",messageMap);
            }
            if(p.getPackageStatus().equals(PackageStatus.待送达) && receiveTime.after(p.getReceiveTime())){
                p.setEndTime(date);
                p.setOrderResult(OrderResult.待送达超时);
                p.setPackageStatus(PackageStatus.已撤销);
                User agency = p.getAgency();
                int score = agency.getIntegration() - 20;
                if (score<=0){
                    agency.setDeleted(true);
                }else {
                    agency.setIntegration(score);
                }
                p.setAgency(agency);
                CreditRecord creditRecord = new CreditRecord(null, agency, -20, CreditRecordDescription.送达超时);
                creditRecordService.save(creditRecord);
                Map<String,RowMessage> messageMap = new HashMap<>();
                messageMap.put("orderId",new RowMessage(p.getId(),"red"));
                messageMap.put("orderResult",new RowMessage("送达超时以被自动撤销","red"));
                postTemplate(p.getDelegation().getOpenid(),"YwTcTGHWjnuegP1VE5I_CpD98QJGtwbWnmMjHIUGNEs","/User/AllDart/",messageMap);
            }
            if(p.getPackageStatus().equals(PackageStatus.待签收) && deliveryTime.after(p.getDeliveryTime())){
                p.setEndTime(date);
                p.setOrderResult(OrderResult.待签收超时);
                p.setPackageStatus(PackageStatus.已完成);
                Map<String,RowMessage> messageMap = new HashMap<>();
                messageMap.put("orderId",new RowMessage(p.getId(),"red"));
                messageMap.put("orderResult",new RowMessage("签收超时以被自动签收","red"));
                postTemplate(p.getDelegation().getOpenid(),"YwTcTGHWjnuegP1VE5I_CpD98QJGtwbWnmMjHIUGNEs","/User/AllDart/",messageMap);
            }
        });
        packageService.saveOrUpdateAll(packageList);
    }
}
