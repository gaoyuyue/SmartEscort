package cn.attackme.escort.Controller.System;


import cn.attackme.escort.Model.Role;
import cn.attackme.escort.Model.User;
import cn.attackme.escort.Service.UserInfoService;
import cn.attackme.escort.Service.UserService;
import cn.attackme.escort.Utils.LogUtils;
import cn.attackme.escort.Utils.SHAUtils;
import cn.attackme.escort.Utils.ValidateCode;
import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.awt.*;
import java.awt.List;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.*;
import java.util.stream.Collectors;
import java.util.stream.Stream;

import static cn.attackme.escort.Utils.SHAUtils.getSHA_256;
import static org.apache.shiro.SecurityUtils.getSubject;

@SuppressWarnings({"JavaDoc", "unused"})
@Controller
public class AccountController {

    @Autowired
    private UserService userService;

    @Autowired
    private UserInfoService userInfoService;

    @Autowired
    public void setUserService(UserService userService) {
        this.userService = userService;
    }

    /**
     * 转向登录界面
     *
     * @return 登录界面
     */
    @GetMapping("/Account/Login")
    public String LoginPage() {
        return "/Account/login";
    }

    /**
     * 转向注册界面
     * @return
     */
    @GetMapping("/Account/Register")
        public String RegisterPage(){ return "/Account/register";}

//    @ResponseBody
//    @PostMapping("/name/{name}")

    /**
     * 检查用户名是否重复
     * @param userName
     * @return
     */
    @ResponseBody
    @GetMapping("/Account/userName/{UuserName}")
    public ResponseEntity<Void> userSearch(@PathVariable String userName) {
        if (userInfoService.isExist(userName)) {
            return new ResponseEntity<>(HttpStatus.CONFLICT);
        } else {
            return new ResponseEntity<>(HttpStatus.OK);
        }
    }

    /**
     * 注册用户
     * @param user
     * @return
     */
    @ResponseBody
    @PostMapping("/Account/user")
    public ResponseEntity<Void> createUser(@RequestBody User user) {
        user.setPassWord(getSHA_256(user.getPassWord()));
        userInfoService.save(user);
        return new ResponseEntity<>(HttpStatus.CREATED);
    }




    /**
     * 接收用户登录传参，判断是否登陆成功
     *
     * @param UserName
     * @param Password
     * @param validateCode
     * @param RememberMe
     * @param session
     * @return
     */
    @SuppressWarnings("ConstantConditions")
    @PostMapping("/Account/Login")
    public String Login(@RequestParam("UserName") String UserName,
                        @RequestParam("Password") String Password,
                        @RequestParam("validateCode") String validateCode,
                        @RequestParam(value = "RememberMe", required = false) String RememberMe,
                        HttpSession session) {
        String code = (String) session.getAttribute("validateCode");
        if (code == null || StringUtils.isEmpty(validateCode) || !StringUtils.equals(code.toLowerCase(), validateCode.toLowerCase())) {
            //登陆失败清除session的验证码，以防暴力破解
            session.removeAttribute("validateCode");
            return "redirect:/Account/Login";
        }

        UsernamePasswordToken token = null;
        try {
            Subject user = SecurityUtils.getSubject();
            token = new UsernamePasswordToken(UserName.trim(), getSHA_256(Password));
            if (RememberMe != null && RememberMe.equals("on"))
                token.setRememberMe(true);
            user.login(token);
            //得到所有Role
            Role role = userService.getById(UserName).getRole();
            System.out.println(role);
            if (Role.admin == role || Role.user == role) {
                return "redirect:/";
            } else {
                return "redirect:/Account/Login";
            }
        } catch (Exception e) {
            LogUtils.LogToDB(e);
            if (token != null) {
                token.clear();
            }
            return "redirect:/Account/Login";
        } finally {
            session.removeAttribute("validateCode");
        }
    }

    /**
     * 生成验证码
     *
     * @param request
     * @param response
     * @throws IOException
     */
    @GetMapping("/Account/validateCode")
    public void validateCode(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setHeader("Cache-Control", "no-cache");
        response.setContentType("image/jpeg");
        String verifyCode = ValidateCode.generateTextCode(ValidateCode.TYPE_ALL_MIXED, 4, null);
        request.getSession().setAttribute("validateCode", verifyCode);
        BufferedImage bim = ValidateCode.generateImageCode(verifyCode, 90, 30, 3, true, Color.WHITE, Color.BLACK, null);
        ImageIO.write(bim, "JPEG", response.getOutputStream());
    }

    /**
     * 退出登录
     *
     * @return
     */
    @GetMapping("/Account/LogOut")
    public String LogOut() {
        SecurityUtils.getSubject().logout();
        return "redirect:/Account/Login";
    }

}
