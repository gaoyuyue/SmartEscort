package cn.attackme.escort.Controller.User;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by IntelliJ IDEA.
 * User: StevenJack
 * Date: ${DATA}
 * Time: 19:09
 * To change this template use File | Settings | File Templates.
 */
@RequestMapping("/User")
@Controller
public class UserInfomationController {
    @GetMapping("/UserInfomation")
    public String index(){
        return "/User/userInfomation";
    }
}
