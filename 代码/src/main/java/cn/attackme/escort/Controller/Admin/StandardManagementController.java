package cn.attackme.escort.Controller.Admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by hujian on 2017/4/25.
 */
@Controller
@RequestMapping("/StandardManagement")
public class StandardManagementController {
    @GetMapping("/")
    public String index(){
        return "Admin/StandardManagement/index";
    }
}
