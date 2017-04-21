package cn.attackme.escort.Controller.User;

import cn.attackme.Wechat.Util.SecurityUtil;
import cn.attackme.escort.Model.User;
import cn.attackme.escort.Service.UserInfoService;
import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

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
    public User getInfo(){
        final String userName = SecurityUtils.getSubject().getPrincipal().toString();
        return userInfoService.getById(userName);
    }

    /**
     * 修改用户信息
     * @param user
     * @return
     */
    @ResponseBody
    @PutMapping("/updateUser")
    public ResponseEntity<Void> updateUser(@RequestBody User user){
        final String userName = SecurityUtils.getSubject().getPrincipal().toString();
        User currentUser = userInfoService.getById(userName);

        if(currentUser==null){
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }else{
            currentUser.setName(user.getName());
            currentUser.setPhoneNumber(user.getPhoneNumber());
            userInfoService.save(currentUser);
            return new ResponseEntity<>(HttpStatus.OK);
        }
    }
}
