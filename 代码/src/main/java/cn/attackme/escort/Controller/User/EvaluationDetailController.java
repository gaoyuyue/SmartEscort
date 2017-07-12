package cn.attackme.escort.Controller.User;

import cn.attackme.escort.Model.Package;
import cn.attackme.escort.Model.User;
import cn.attackme.escort.Service.PackageService;
import cn.attackme.escort.Service.UserInfoService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Created by IntelliJ IDEA.
 * User: StevenJack
 * Date: ${DATA}
 * Time: 15:58
 * To change this template use File | Settings | File Templates.
 * 评价详情
 */
@RequestMapping("/User/EvaluationDetail")
@Controller
public class EvaluationDetailController {
    @GetMapping("/")
    public String index(){
        return "User/EvaluationDetail/index";
    }

    @Autowired
    private UserInfoService userInfoService;

    @Autowired
    private PackageService packageService;

    //获取用户
    @RequiresRoles("user")
    @ResponseBody
    @GetMapping("/userInformation")
    public User getInfo(){
        final String userName = SecurityUtils.getSubject().getPrincipal().toString();
        return userInfoService.getById(userName);
    }


    /**
     * 获取当前人包裹信息
     * @param publishDartId
     * @return
     */
    @RequiresRoles("user")
    @ResponseBody
    @GetMapping("/dartDetail/publishDartId/{publishDartId}")
    public ResponseEntity<Package> getDartDetail(@PathVariable String publishDartId){
        Package aPackage = packageService.getById(publishDartId);
        return new ResponseEntity<>(aPackage,HttpStatus.OK);
    }
}
