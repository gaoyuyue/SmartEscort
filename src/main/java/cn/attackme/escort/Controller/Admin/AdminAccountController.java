package cn.attackme.escort.Controller.Admin;

import cn.attackme.escort.Model.User;
import cn.attackme.escort.Service.UserInfoService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import static cn.attackme.escort.Service.UserInfoService.makeSHA256PasswordWithSalt;
import static cn.attackme.escort.Utils.SHAUtils.getSHA_256;
import static org.apache.shiro.SecurityUtils.getSubject;

/**
 * Created by Administrator on 2017/7/12.
 */
@Controller
@RequestMapping("/AdminAccount")
public class AdminAccountController {

    @Autowired
    private UserInfoService userInfoService;

//    修改个人信息
    @RequiresRoles("admin")
    @PutMapping("/changeInfo/name/{name}/nickName/{nickName}/phoneNumber/{phoneNumber}/email/{email}")
    public ResponseEntity<Void> changeInfo(@PathVariable String name,
                                     @PathVariable String nickName,
                                     @PathVariable String phoneNumber,
                                     @PathVariable String email){
        String userName = getSubject().getPrincipal().toString();
        User user=userInfoService.getById(userName);
        if(user==null){
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }else {
            user.setName(name);
            user.setNickName(nickName);
            user.setPhoneNumber(phoneNumber);
            user.setStudentId(email);
            userInfoService.saveOrUpdate(user);
            return new ResponseEntity<Void>(HttpStatus.OK);
        }

    }

//    修改密码
    @RequiresRoles("admin")
    @PutMapping("/changePassWord/origin/{origin}/passWord/{passWord}")
    public ResponseEntity<Void> changePassWord(@PathVariable String origin,
                                               @PathVariable String passWord){
        String userName = getSubject().getPrincipal().toString();
        User user=userInfoService.getById(userName);
        if(user==null){
            return new ResponseEntity<Void>(HttpStatus.NOT_FOUND);
        }else {
             if(user.getPassWord().equals(getSHA_256(getSHA_256(userName+origin)))){
                 user.setPassWord(passWord);
                 userInfoService.saveOrUpdate(makeSHA256PasswordWithSalt(user));
                 UsernamePasswordToken token = new UsernamePasswordToken(user.getUserName(), user.getPassWord());
                 Subject subject = SecurityUtils.getSubject();
                 subject.login(token);
                 return new ResponseEntity<Void>(HttpStatus.OK);
             }else {
                 return new ResponseEntity<Void>(HttpStatus.FORBIDDEN);
             }
        }
    }
}
