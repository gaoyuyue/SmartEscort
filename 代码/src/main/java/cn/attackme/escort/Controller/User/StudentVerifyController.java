package cn.attackme.escort.Controller.User;

import cn.attackme.escort.Model.User;
import cn.attackme.escort.Service.MailService;
import cn.attackme.escort.Service.UserInfoService;
import cn.attackme.escort.Utils.LogUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.mail.MessagingException;

import static cn.attackme.escort.Utils.ImageUtils.decodeBase64ToImage;
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

    @RequestMapping("/upLoad")
    public String upLoad(@RequestParam("dataUrl") String dataUrl) throws MessagingException {
        try {
            String userName = getSubject().getPrincipal().toString();
            User user = userInfoService.getById(userName);
            String userHome = System.getProperty("user.home");
            String fileSeparator = System.getProperty("file.separator");
            user.setStuCardUrl(decodeBase64ToImage(dataUrl, userHome+fileSeparator+"Images"+fileSeparator));
            userInfoService.saveOrUpdate(user);
        } catch (Exception e) {
            LogUtils.LogToDB(e);
            return "/User/StudentVerify/failure";
        }
        mailService.sendMail("1519035296@qq.com","gaoyuyue@outlook.com","有新用户认证!","请前往管理:http://escort.attackme.cn");
        return "/User/StudentVerify/success";
    }
}


