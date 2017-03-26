package cn.attackme.escort.Controller.User;

import cn.attackme.escort.Model.User;
import cn.attackme.escort.Service.UserInfoService;
import org.apache.shiro.authz.annotation.Logical;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import static cn.attackme.escort.Utils.SHAUtils.getSHA_256;

/**
 * Created by IntelliJ IDEA.
 * User: StevenJack
 * Date: ${DATA}
 * Time: 17:09
 * To change this template use File | Settings | File Templates.
 */
@RequestMapping("/User")
@Controller
public class PersonalCenterController {
    @GetMapping("/PersonalCenter")
    public String index(){
        return "/User/personalCenter";
    }

    @Autowired
    private UserInfoService userInfoService;

    //修改密码
    @RequiresRoles(value = {"user"}, logical = Logical.OR)
    @ResponseBody
    @PutMapping("/userName/{userName}/password/{password}")
    public ResponseEntity<User> userPassword(@PathVariable String userName,
                                                   @PathVariable String password) {
        User user = userInfoService.getById(userName);
        user.setPassWord(getSHA_256(password));
        userInfoService.save(user);
        return new ResponseEntity<>(HttpStatus.OK);
    }

}
