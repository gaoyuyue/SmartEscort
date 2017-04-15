package cn.attackme.escort.Controller.User;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by arthurme on 2017/3/25.
 */
@RequestMapping("/User/ManageAddress")
@Controller
public class ManageAddressController {
    @GetMapping("/")
    public String index(){
        return "User/ManageAddress/index";
    }

    @GetMapping("/add")
    public String add(){
        return "User/ManageAddress/add";
    }

    @GetMapping("/edit")
    public String edit(){
        return "User/ManageAddress/edit";
    }
}
