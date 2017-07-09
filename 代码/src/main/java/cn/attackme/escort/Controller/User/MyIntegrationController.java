package cn.attackme.escort.Controller.User;

import cn.attackme.Wechat.Util.SecurityUtil;
import cn.attackme.escort.Model.User;
import cn.attackme.escort.Service.UserInfoService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Created by IntelliJ IDEA.
 * User: StevenJack
 * Date: ${DATA}
 * Time: 12:28
 * To change this template use File | Settings | File Templates.
 */
@RequestMapping("/User/MyIntegration")
@Controller
public class MyIntegrationController {
    @GetMapping("/")
    public String index(){
        return "/User/MyIntegration/index";
    }

    @Autowired
    private UserInfoService userInfoService;

    @RequiresRoles("user")
    @ResponseBody
    @GetMapping("/information")
    public User information(){
        final String userName = SecurityUtils.getSubject().getPrincipal().toString();
        return userInfoService.getById(userName);
    }

}
