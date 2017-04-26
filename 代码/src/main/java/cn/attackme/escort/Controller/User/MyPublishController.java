package cn.attackme.escort.Controller.User;

import cn.attackme.escort.Model.Package;
import cn.attackme.escort.Model.User;
import cn.attackme.escort.Service.UserInfoService;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

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
        return new ResponseEntity<>(list,HttpStatus.OK);
    }
}
