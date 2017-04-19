package cn.attackme.escort.Controller.User;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by IntelliJ IDEA.
 * User: StevenJack
 * Date: ${DATA}
 * Time: 19:27
 * To change this template use File | Settings | File Templates.
 * 我的接单
 */
@RequestMapping("/User/MyDart")
@Controller
public class MyDartController {
    @GetMapping("/")
    public String index(){
        return "/User/MyDart/index";
    }

}
