package cn.attackme.escort.Controller.User;

import cn.attackme.escort.Model.AuthStatus;
import cn.attackme.escort.Model.Role;
import cn.attackme.escort.Model.User;
import cn.attackme.escort.Service.MailService;
import cn.attackme.escort.Service.UserInfoService;
import cn.attackme.escort.Utils.LogUtils;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.mail.MessagingException;
import java.util.List;
import java.util.Random;

import static cn.attackme.escort.Utils.Base64ImageUtil.decodeToImage;
import static org.apache.shiro.SecurityUtils.getSubject;

/**
 * Created by Administrator on 2017/5/23.
 */
@Controller
@RequestMapping("/User/StudentVerify")
public class StudentVerifyController {
    @Autowired
    private UserInfoService userInfoService;
    @Autowired
    private MailService mailService;

    @RequiresRoles(value = "noAuth")
    @GetMapping("/")
    public String index(){return "User/StudentVerify/index" ;}

    @GetMapping("/success")
    public String success(){
        return "User/StudentVerify/success";
    }

    @GetMapping("/failure")
    public String failure(){
        return "User/StudentVerify/failure";
    }

    @RequiresRoles(value = "noAuth")
    @RequestMapping("/upLoad")
    public String upLoad(@RequestParam("dataUrl") String dataUrl) throws MessagingException {
        try {
            String userName = getSubject().getPrincipal().toString();
            User user = userInfoService.getById(userName);
            String userHome = System.getProperty("user.home");
            String fileSeparator = System.getProperty("file.separator");
            user.setStuCardUrl(decodeToImage(dataUrl, userHome+fileSeparator+"Images"+fileSeparator));
            user.setAuthStatus(AuthStatus.审核中);
            userInfoService.saveOrUpdate(user);
        } catch (Exception e) {
            LogUtils.LogToDB(e);
            return "/User/StudentVerify/failure";
        }
        List<User> userList = userInfoService.getListByRole(Role.admin);
        int nextInt = (userList.size() == 1) ? 0 : new Random().nextInt(userList.size());
        User u = userList.get(nextInt);
        mailService.sendMail(u.getStudentId(),"有新用户认证!","请前往管理:"+u.getStuCardUrl());
        return "/User/StudentVerify/success";
    }
}


