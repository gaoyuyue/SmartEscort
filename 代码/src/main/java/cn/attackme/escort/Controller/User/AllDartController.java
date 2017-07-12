package cn.attackme.escort.Controller.User;

import cn.attackme.escort.Model.OrderResult;
import cn.attackme.escort.Model.Package;
import cn.attackme.escort.Model.PackageStatus;
import cn.attackme.escort.Model.User;
import cn.attackme.escort.Service.PackageService;
import cn.attackme.escort.Service.UserInfoService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.Date;
import java.util.List;

import static java.util.stream.Collectors.toList;
import static org.apache.shiro.SecurityUtils.getSubject;

/**
 * Created by IntelliJ IDEA.
 * User: StevenJack
 * Date: ${DATA}
 * Time: 19:09
 * To change this template use File | Settings | File Templates.
 * 所有订单
 */
@RequestMapping("/User/AllDart")
@Controller
public class AllDartController {
    @GetMapping("/")
    public String index(){
        return "User/AllDart/index";
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
    public List<Package> packageList(){
        String userName = getSubject().getPrincipal().toString();
        User user = userInfoService.getById(userName);
        List<Package> receivelist = user.getReceiveList();
        List<Package> publishList = user.getPublishList();
        publishList.addAll(receivelist);
        List<Package> publishList1 = publishList.stream().collect(toList());
        return publishList1;
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

    /**
     * 删除订单
     * @param publishDartId
     * @return
     */
    @RequiresRoles("user")
    @ResponseBody
    @PutMapping("/delete/publishDartId/{publishDartId}")
    public ResponseEntity<Void> deleteDart(@PathVariable String publishDartId){
        Package aPackage = packageService.getById(publishDartId);
        if(aPackage.getPackageStatus() == PackageStatus.已撤销){
            aPackage.setCancel(true);
        }else if(aPackage.getPackageStatus() == PackageStatus.已完成){
            aPackage.setCancel(true);
        }
        packageService.saveOrUpdate(aPackage);
        return new ResponseEntity<>(HttpStatus.OK);
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
        if(aPackage.getPackageStatus() == PackageStatus.待领取){
            aPackage.setEndTime(new Date());
            aPackage.setPackageStatus(PackageStatus.已撤销);
        }else if(aPackage.getPackageStatus() == PackageStatus.待送达){
            aPackage.setDeliveryTime(new Date());
            aPackage.setPackageStatus(PackageStatus.待签收);
        } else if(aPackage.getPackageStatus() == PackageStatus.待签收){
            aPackage.setEndTime(new Date());
            aPackage.setPackageStatus(PackageStatus.已完成);
            aPackage.setOrderResult(OrderResult.交易成功);
        }
        packageService.saveOrUpdate(aPackage);
        return new ResponseEntity<>(HttpStatus.OK);
    }

    @RequiresRoles("user")
    @ResponseBody
    @GetMapping("/userInformation")
    public User getInfo(){
        final String userName = SecurityUtils.getSubject().getPrincipal().toString();
        return userInfoService.getById(userName);
    }

}
