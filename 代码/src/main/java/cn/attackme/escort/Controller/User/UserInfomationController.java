package cn.attackme.escort.Controller.User;

import cn.attackme.Wechat.Util.SecurityUtil;
import cn.attackme.escort.Model.User;
import cn.attackme.escort.Service.UserInfoService;
import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Created by IntelliJ IDEA.
 * User: StevenJack
 * Date: ${DATA}
 * Time: 19:09
 * To change this template use File | Settings | File Templates.
 */
@RequestMapping("/User/UserInfomation")
@Controller
public class UserInfomationController {
    @GetMapping("/")
    public String index(){
        return "User/UserInfomation/index";
    }

    @Autowired
    private UserInfoService userInfoService;


    /**
     * 获取当前用户信息
     * @return
     */
    @ResponseBody
    @RequestMapping("/current")
    public User getInfo(){
        final String userName = SecurityUtils.getSubject().getPrincipal().toString();
        return userInfoService.getById(userName);
    }
}
