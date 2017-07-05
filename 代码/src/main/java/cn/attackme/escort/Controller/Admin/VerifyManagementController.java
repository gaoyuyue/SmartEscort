package cn.attackme.escort.Controller.Admin;


import cn.attackme.escort.Model.User;
import cn.attackme.escort.Service.UserInfoService;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by Administrator on 2017/5/23.
 */
@Controller
@RequestMapping("/VerifyManagement")
public class VerifyManagementController {

    @Autowired
    private UserInfoService userInfoService;

    @RequiresRoles("admin")
    @GetMapping("/")
    public String index(){
        return "Admin/VerifyManagement/index";
    }

    @RequiresRoles("admin")
    @PutMapping("/Authored/userName/{userName}")
    public ResponseEntity<Void> Authored(@PathVariable String userName){
        User user = userInfoService.getById(userName);
        if(user!=null){
            user.setAuthed(true);
            userInfoService.save(user);
            return new ResponseEntity<Void>( HttpStatus.OK);
        }else {
            return new ResponseEntity<Void>(HttpStatus.NOT_FOUND);
        }
    }

}


