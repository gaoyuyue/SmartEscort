package cn.attackme.escort.Controller.Admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 地址管理
 * Created by hujian on 2017/3/25.
 */
@Controller
@RequestMapping("/AddressManagement")
public class AddressManagementController {
    @GetMapping("/")
    public String index(){
        return "Admin/AddressManagement/index";
    }
}
