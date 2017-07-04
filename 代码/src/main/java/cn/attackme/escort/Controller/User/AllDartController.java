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
    public ResponseEntity<List<Package>> packageList(){
        String userName = getSubject().getPrincipal().toString();
        User delegation = userInfoService.getById(userName);
        List<Package> list = delegation.getPublishList();
        List<Package> publishList = list.stream().filter(p -> (p.getPackageStatus() == PackageStatus.已评价 || p.getPackageStatus() == PackageStatus.已撤销)).collect(toList());
        return new ResponseEntity<>(publishList, HttpStatus.OK);
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

    /**
     * 删除订单
     * @param publishDartId
     * @return
     */
    @RequiresRoles("user")
    @ResponseBody
    @PutMapping("/delete/publishDartId/{publishDartId}")
    public ResponseEntity<Void> deleteDart(@PathVariable int publishDartId){
        Package aPackage = packageService.getById(publishDartId);
        if(aPackage.getPackageStatus() == PackageStatus.已撤销){
            aPackage.setPackageStatus(PackageStatus.已删除);
        }else if(aPackage.getPackageStatus() == PackageStatus.已评价){
            aPackage.setPackageStatus(PackageStatus.已删除);
        }
        packageService.saveOrUpdate(aPackage);
        return new ResponseEntity<>(HttpStatus.OK);
    }


}
