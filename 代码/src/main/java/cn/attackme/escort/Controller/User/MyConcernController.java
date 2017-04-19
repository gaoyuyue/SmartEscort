package cn.attackme.escort.Controller.User;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by IntelliJ IDEA.
 * User: StevenJack
 * Date: ${DATA}
 * Time: 19:08
 * To change this template use File | Settings | File Templates.
 * 我的关注
 */
@RequestMapping("/User/MyConcern")
@Controller
public class MyConcernController {
    @GetMapping("/")
    public String index(){
        return "User/MyConcern/index";
    }
}
