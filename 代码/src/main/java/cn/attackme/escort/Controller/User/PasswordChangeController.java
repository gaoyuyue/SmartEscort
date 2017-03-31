package cn.attackme.escort.Controller.User;

import cn.attackme.escort.Utils.ValidateCode;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.IOException;

/**
 * Created by IntelliJ IDEA.
 * User: StevenJack
 * Date: ${DATA}
 * Time: 19:02
 * To change this template use File | Settings | File Templates.
 */
@RequestMapping("/User/PasswordChange")
@Controller
public class PasswordChangeController {
    @GetMapping("/")
    public String index(){
        return "User/PasswordChange/index";
    }




}
