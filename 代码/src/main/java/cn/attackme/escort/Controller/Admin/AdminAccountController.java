package cn.attackme.escort.Controller.Admin;

import cn.attackme.escort.Model.User;
import cn.attackme.escort.Service.UserInfoService;
import org.apache.http.HttpStatus;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Required;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseStatus;

/**
 * Created by Administrator on 2017/7/12.
 */
@Controller
@RequestMapping("/AdminAccount")
public class AdminAccountController {

    @Autowired
    private UserInfoService userInfoService;

    @RequiresRoles("admin")
    @PutMapping("/changeInfo/userName/{userName}/name/{name}/nickName/{nickName}/phoneNumber/{phoneNumber}/email/{email}")
    public ResponseEntity<Void> changeInfo(@PathVariable String userName,
                                     @PathVariable String name,
                                     @PathVariable String nickName,
                                     @PathVariable String phoneNumber,
                                     @PathVariable String email){
        User user=userInfoService.getById(userName);
        if(user==null){
            return new ResponseEntity<>(org.springframework.http.HttpStatus.NOT_FOUND);
        }else {
            user.setName(name);
            user.setNickName(nickName);
            user.setPhoneNumber(phoneNumber);
            user.setStudentId(email);
            userInfoService.saveOrUpdate(user);
            return new ResponseEntity<Void>(org.springframework.http.HttpStatus.OK);
        }

    }

}
