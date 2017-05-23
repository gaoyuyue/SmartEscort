package cn.attackme.escort.Controller.User;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by Administrator on 2017/5/23.
 */
@Controller
@RequestMapping("/User/StudentVerify")
public class StudentVerifyController {
    @GetMapping("/")
    public String index(){return "User/StudentVerify/index" ;}

}
