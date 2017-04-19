package cn.attackme.escort.Controller.User;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by IntelliJ IDEA.
 * User: StevenJack
 * Date: ${DATA}
 * Time: 15:58
 * To change this template use File | Settings | File Templates.
 * 评价详情
 */
@RequestMapping("/User/EvaluationDetail")
@Controller
public class EvaluationDetailController {
    @GetMapping("/")
    public String index(){
        return "User/EvaluationDetail/index";
    }
}
