package cn.attackme.escort.Controller.Admin;


import cn.attackme.escort.Service.UserInfoService;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by Administrator on 2017/5/23.
 */
@Controller
@RequestMapping("/StudentVerifyManagement")
public class StudentVerifyManagementController {

    @Autowired
    private UserInfoService userInfoService;

    @RequiresRoles("admin")
    @GetMapping("/")
    public String index(){
        return "Admin/StudentVerifyManagement/index";
    }


}


