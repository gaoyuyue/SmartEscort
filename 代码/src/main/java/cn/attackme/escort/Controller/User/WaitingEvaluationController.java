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
 * Time: 19:28
 * To change this template use File | Settings | File Templates.
 * 待评价
 */
@RequestMapping("/User/WaitingEvaluation")
@Controller
public class WaitingEvaluationController {
    @GetMapping("/")
    public String index(){
        return "User/WaitingEvaluation/index";
    }

    @Autowired
    private UserInfoService userInfoService;

    @Autowired
    private PackageService packageService;

    /**
     * 获取当前人所有的包裹
     * @return
     */
    @ResponseBody
    @GetMapping("packageList")
    public List<Package> packageList(){
        String userName = getSubject().getPrincipal().toString();
        User user = userInfoService.getById(userName);
        List<Package> receivelist = user.getReceiveList();
        List<Package> publishList = user.getPublishList();
        publishList.addAll(receivelist);
        List<Package> publishList1 = publishList.stream().filter(p -> (p.getPackageStatus() == PackageStatus.已完成)).collect(toList());
        return publishList1;
    }

    /**
     * 获取当前人包裹信息
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
    @DeleteMapping("/delete/publishDartId/{publishDartId}")
    public ResponseEntity<Void> deleteDart(@PathVariable int publishDartId){
        packageService.deleteById(publishDartId);
        return new ResponseEntity<Void>(HttpStatus.OK);
    }

}
