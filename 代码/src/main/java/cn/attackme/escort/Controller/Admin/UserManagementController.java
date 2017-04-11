package cn.attackme.escort.Controller.Admin;

import cn.attackme.Wechat.Util.SecurityUtil;
import cn.attackme.escort.Model.User;
import cn.attackme.escort.Service.UserInfoService;
import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Created by hujian on 2017/3/21.
 */
@Controller
@RequestMapping("/UserManagement")
public class UserManagementController {

    @Autowired
    private UserInfoService userInfoService;

    @GetMapping("/")
    public String index(){
        return "Admin/UserManagement/index";
    }

    /*
    返回
     */
    @ResponseBody
    @GetMapping("/UserInfo")
    public User getUserInfo(){
        final String userName= SecurityUtils.getSubject().getPrincipal().toString();
        return userInfoService.getById(userName);
    }
}
