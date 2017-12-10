package cn.attackme.escort.Controller.User;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by IntelliJ IDEA.
 * User: StevenJack
 * Date: ${DATA}
 * Time: 17:24
 * To change this template use File | Settings | File Templates.
 */
@Controller
@RequestMapping("/User/AboutUs")
public class AboutUsController {
    @GetMapping("/")
    public String index(){
        return "User/AboutUs/index";
    }
}
