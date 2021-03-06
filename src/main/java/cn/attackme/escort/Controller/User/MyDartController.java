package cn.attackme.escort.Controller.User;

import cn.attackme.Wechat.Message.RowMessage;
import cn.attackme.escort.Model.Package;
import cn.attackme.escort.Model.PackageStatus;
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
 * Time: 19:27
 * To change this template use File | Settings | File Templates.
 * 我的接单
 */
@RequestMapping("/User/MyDart")
@Controller
public class MyDartController {
    @GetMapping("/")
    public String index(){
        return "/User/MyDart/index";
    }

    @Autowired
    private UserInfoService userInfoService;
    @Autowired
    private PackageService packageService;

    /**
     * 获取包裹信息
     * @return
     */
    @RequiresRoles("user")
    @ResponseBody
    @GetMapping("/packageList")
    public ResponseEntity<List<Package>> packageList(){
        String userName = getSubject().getPrincipal().toString();
        List<Package> receiveList = userInfoService.getById(userName).getReceiveList()
                                    .stream()
                                    .filter(p -> (p.getPackageStatus() == PackageStatus.待签收 || p.getPackageStatus() == PackageStatus.待送达))
                                    .collect(toList());
        return new ResponseEntity<>(receiveList, HttpStatus.OK);
    }

    /**
     * 获取委托人包裹信息
     * @param publishDartId
     * @return
     */
    @ResponseBody
    @GetMapping("/dartDetail/publishDartId/{publishDartId}")
    public ResponseEntity<Package> getDartDetail(@PathVariable String publishDartId){
        Package aPackage = packageService.getById(publishDartId);
        return new ResponseEntity<>(aPackage,HttpStatus.OK);
    }

    /**
     * 确认送达
     * @param publishDartId
     * @return
     */
    @RequiresRoles("user")
    @ResponseBody
    @PutMapping("/cancel/publishDartId/{publishDartId}")
    public ResponseEntity<Void> cancleDart(@PathVariable String publishDartId){
        Package aPackage = packageService.getById(publishDartId);
        if(aPackage.getPackageStatus() == PackageStatus.待送达){
            aPackage.setPackageStatus(PackageStatus.待签收);
            aPackage.setDeliveryTime(new Date());
        }
        packageService.saveOrUpdate(aPackage);
        Map<String,RowMessage> messageMap = new HashMap<>();
        messageMap.put("orderId",new RowMessage(aPackage.getId(),"red"));
        postTemplate(aPackage.getAgency().getOpenid(), "hDDNb6128FhXd5u9yvDZDcHbcWdlP1idzs0YvfZ16E8", "/User/WaitingEvaluation/", messageMap);
        postTemplate(aPackage.getDelegation().getOpenid(), "5HE9fDpls0Unxo5YVECRA0iupoIY6UDJcDXzN4xhxGU", "/User/MyPublish/", messageMap);
        return new ResponseEntity<>(HttpStatus.OK);
    }

}
