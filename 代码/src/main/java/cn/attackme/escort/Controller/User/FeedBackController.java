package cn.attackme.escort.Controller.User;

import cn.attackme.escort.Model.Feedback;
import cn.attackme.escort.Model.User;
import cn.attackme.escort.Service.FeedBackService;
import cn.attackme.escort.Service.UserInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import static org.apache.shiro.SecurityUtils.getSubject;


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
    @Autowired
    private FeedBackService feedBackService;
    @Autowired
    private UserInfoService userInfoService;

    @GetMapping("/")
    public String index() {
        return "User/FeedBack/index";
    }

    @ResponseBody
    @PostMapping("/content/{content}")
    public ResponseEntity<Feedback> feedbackResponseEntity(@PathVariable String content) {
        String userName = getSubject().getPrincipal().toString();
        User user = userInfoService.getById(userName);
        Feedback feedback = new Feedback();
        feedback.setUser(user);
        feedback.setContent(content);
        feedBackService.save(feedback);
        return new ResponseEntity<>(HttpStatus.OK);

    }
}
