package cn.attackme.escort.Controller.Admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by Administrator on 2017/4/26.
 */
@Controller
@RequestMapping("/FeedBackManagement")
public class FeedBackManagementController {
@GetMapping("/")
    public String index(){return "Admin/FeedBackManagement/index";}
}
