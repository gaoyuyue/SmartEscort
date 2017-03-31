package cn.attackme.escort.Controller.User;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by arthurme on 2017/3/31.
 */
@RequestMapping("/User/GetPackage")
@Controller
public class GetPackageController {
    @GetMapping("/")
    public String index(){
        return "User/GetPackage/index";
    }
}
