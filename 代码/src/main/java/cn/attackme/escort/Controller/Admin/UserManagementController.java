package cn.attackme.escort.Controller.Admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by hujian on 2017/3/21.
 */
@Controller
@RequestMapping("/UserManagement")
public class UserManagementController {
    @GetMapping("/")
    public String index(){
        return "index";
    }
}
