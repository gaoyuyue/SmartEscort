package cn.attackme.escort.Controller.User;

import cn.attackme.escort.Model.Package;
import cn.attackme.escort.Model.PackageStatus;
import cn.attackme.escort.Model.User;
import cn.attackme.escort.Service.PackageService;
import cn.attackme.escort.Service.UserInfoService;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;

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
        List<Package> publishList = list.stream().filter(p -> (p.getPackageStatus() == PackageStatus.待领取 || p.getPackageStatus() == PackageStatus.待签收)).collect(toList());
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
    public ResponseEntity<Void> cancleDart(@PathVariable int publishDartId){
        Package aPackage = packageService.getById(publishDartId);
        if(aPackage.getPackageStatus() == PackageStatus.待领取){
            aPackage.setPackageStatus(PackageStatus.已撤销);
        }else if(aPackage.getPackageStatus() == PackageStatus.待签收){
            aPackage.setPackageStatus(PackageStatus.待评价);
        }
        packageService.saveOrUpdate(aPackage);
        return new ResponseEntity<>(HttpStatus.OK);
    }


    /**
     * 通过id获取包裹详情
     * @param publishDartId
     * @return
     */
    @ResponseBody
    @GetMapping("/dartDetail/publishDartId/{publishDartId}")
    public ResponseEntity<Package> getDartDetail(@PathVariable int publishDartId){
        Package aPackage = packageService.getById(publishDartId);
        return new ResponseEntity<>(aPackage,HttpStatus.OK);
    }


}
