package cn.attackme.escort.Controller.User;

import cn.attackme.escort.Model.Package;
import cn.attackme.escort.Model.PackageStatus;
import cn.attackme.escort.Model.User;
import cn.attackme.escort.Service.PackageService;
import cn.attackme.escort.Service.UserInfoService;
import com.sun.xml.internal.bind.v2.runtime.reflect.Lister;
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
        List<Package> publishList = list.stream().filter(p -> (p.getPackageStatus() == PackageStatus.待领取 || p.getPackageStatus() == PackageStatus.已领取)).collect(toList());
        return new ResponseEntity<>(publishList,HttpStatus.OK);
    }

    /**
     * 取消订单
     * @param publishDartId
     * @return
     */
    @RequiresRoles("user")
    @ResponseBody
    @DeleteMapping("/delete/publishDartId/{publishDartId}")
    public ResponseEntity<Void> deleteDart(@PathVariable int publishDartId){
        packageService.deleteById(publishDartId);
        return new ResponseEntity<Void>(HttpStatus.OK);
    }


    @ResponseBody
    @GetMapping("/dartDetail/publishDartId/{publishDartId}")
    public ResponseEntity<Package> getDartDetail(@PathVariable int publishDartId){
        Package aPackage = packageService.getById(publishDartId);
        return new ResponseEntity<>(aPackage,HttpStatus.OK);
    }


}
