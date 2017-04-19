package cn.attackme.escort.Controller.User;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by IntelliJ IDEA.
 * User: StevenJack
 * Date: ${DATA}
 * Time: 19:07
 * To change this template use File | Settings | File Templates.
 * 意见反馈
 */
@RequestMapping("/User/FeedBack")
@Controller
public class FeedBackController {
    @GetMapping("/")
    public String index(){
        return "User/FeedBack/index";
    }
}
