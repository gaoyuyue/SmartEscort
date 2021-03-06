package cn.attackme.escort.Controller.User;

import cn.attackme.Wechat.Message.RowMessage;
import cn.attackme.escort.Model.*;
import cn.attackme.escort.Model.Package;
import cn.attackme.escort.Service.CreditRecordService;
import cn.attackme.escort.Service.PackageService;
import cn.attackme.escort.Service.UserInfoService;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static cn.attackme.Wechat.Util.MessageUtil.postTemplate;
import static java.util.stream.Collectors.toList;
import static org.apache.shiro.SecurityUtils.getSubject;

/**
 * Created by IntelliJ IDEA.
 * User: StevenJack
 * Date: ${DATA}
 * Time: 19:25
 * To change this template use File | Settings | File Templates.
 * 我的发布
 */
@RequestMapping("/User/MyPublish")
@Controller
public class MyPublishController {
    @GetMapping("/")
    public String index(){
        return "User/MyPublish/index";
    }

    @Autowired
    private UserInfoService userInfoService;

    @Autowired
    private PackageService packageService;

    @Autowired
    private CreditRecordService creditRecordService;

    /**
     * 获取包裹信息
     * @return
     */
    @RequiresRoles("user")
    @ResponseBody
    @GetMapping("/packageList")
    public ResponseEntity<List<Package>> packageList(){
        String userName = getSubject().getPrincipal().toString();
        User delegation = userInfoService.getById(userName);
        List<Package> list = delegation.getPublishList();
        List<Package> publishList = list
                                    .stream()
                                    .filter(p -> (p.getPackageStatus() == PackageStatus.待领取 || p.getPackageStatus() == PackageStatus.待签收 || p.getPackageStatus() == PackageStatus.待送达))
                                    .collect(toList());
        return new ResponseEntity<>(publishList,HttpStatus.OK);
    }

    /**
     * 撤销订单与确认收货
     * @param publishDartId
     * @return
     */
    @RequiresRoles("user")
    @ResponseBody
    @PutMapping("/cancel/publishDartId/{publishDartId}")
    public ResponseEntity<Void> cancleDart(@PathVariable String publishDartId){
        Package aPackage = packageService.getById(publishDartId);
        Date date = new Date();
        User delegation = aPackage.getDelegation();
        CreditRecord creditRecord = null;
        if(aPackage.getPackageStatus() == PackageStatus.待领取){
            aPackage.setPackageStatus(PackageStatus.已撤销);
            aPackage.setOrderResult(OrderResult.发布人撤销任务);
            delegation.setIntegration(delegation.getIntegration()-1);
            creditRecord = new CreditRecord(null, delegation, -1,CreditRecordDescription.取消订单);
            Map<String,RowMessage> messageMap = new HashMap<>();
            messageMap.put("orderId",new RowMessage(aPackage.getId(),"red"));
            postTemplate(delegation.getOpenid(), "6kCKxbS91lnmC_uTL6LFfmqZ0C1xDR6C0RL_NDHqOlQ", "/User/AllDart/", messageMap);
        }
        if(aPackage.getPackageStatus() == PackageStatus.待签收){
            aPackage.setPackageStatus(PackageStatus.已完成);
            aPackage.setOrderResult(OrderResult.交易成功);
            delegation.setIntegration(delegation.getIntegration()+1);
            creditRecord = new CreditRecord(null, delegation, 1, CreditRecordDescription.确认签收);
            Map<String,RowMessage> messageMap = new HashMap<>();
            messageMap.put("orderId",new RowMessage(aPackage.getId(),"red"));
            postTemplate(delegation.getOpenid(), "4HOfR0ngnVxL_3FZ3wMdbHY9pR6H5_wgyIPWX8GOiK0", "/User/WaitingEvaluation/", messageMap);
            postTemplate(aPackage.getAgency().getOpenid(), "4HOfR0ngnVxL_3FZ3wMdbHY9pR6H5_wgyIPWX8GOiK0", "/User/WaitingEvaluation/", messageMap);
        }
        aPackage.setEndTime(date);
        packageService.saveOrUpdate(aPackage);
        creditRecordService.save(creditRecord);
        return new ResponseEntity<>(HttpStatus.OK);
    }


    /**
     * 通过id获取包裹详情
     * @param publishDartId
     * @return
     */
    @ResponseBody
    @GetMapping("/dartDetail/publishDartId/{publishDartId}")
    public ResponseEntity<Package> getDartDetail(@PathVariable String publishDartId){
        Package aPackage = packageService.getById(publishDartId);
        return new ResponseEntity<>(aPackage,HttpStatus.OK);
    }
}
