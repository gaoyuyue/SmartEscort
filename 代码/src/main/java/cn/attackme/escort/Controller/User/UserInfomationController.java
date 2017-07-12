package cn.attackme.escort.Controller.User;

import cn.attackme.escort.Model.User;
import cn.attackme.escort.Service.UserInfoService;
import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;

import static cn.attackme.escort.Utils.SHAUtils.getSHA_256;

/**
 * Created by IntelliJ IDEA.
 * User: StevenJack
 * Date: ${DATA}
 * Time: 19:09
 * To change this template use File | Settings | File Templates.
 *个人信息
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
    public User getInfo() throws UnsupportedEncodingException {
        final String userName = SecurityUtils.getSubject().getPrincipal().toString();
        User user = userInfoService.getById(userName);
        user.setNickName(URLDecoder.decode(user.getNickName(), "utf-8"));
        return user;
    }

    /**
     * 修改用户信息
     * @param name
     * @param phoneNumber
     * @return
     */
    @ResponseBody
    @PutMapping("/name/{name}/phoneNumber/{phoneNumber}")
    public ResponseEntity<Void> updateUser(@PathVariable String name,
                                           @PathVariable String phoneNumber){
        final String userName = SecurityUtils.getSubject().getPrincipal().toString();
        User currentUser = userInfoService.getById(userName);

        if(currentUser==null){
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }else{
            currentUser.setName(name);
            currentUser.setPhoneNumber(phoneNumber);
            userInfoService.save(currentUser);
            return new ResponseEntity<>(HttpStatus.OK);
        }
    }

    /**
     * 修改密码
     * @param userName
     * @param password
     * @return
     */
    @ResponseBody
    @PutMapping("/userName/{userName}/password/{password}")
    public ResponseEntity<User> userResponseEntity(@PathVariable String userName,
                                                   @PathVariable String password){
        User user = userInfoService.getById(userName);
        user.setPassWord(getSHA_256(password));
        userInfoService.save(user);
        return new ResponseEntity<>(HttpStatus.OK);
    }
}
