package cn.attackme.escort.Controller.Admin;

import cn.attackme.escort.Model.CourierCompany;
import cn.attackme.escort.Service.CourierCompanyService;
import cn.attackme.escort.Utils.PageResults;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Created by hujian on 2017/3/25.
 */
@Controller
@RequestMapping("/CourierCompanyManagement")
public class CourierCompanyManagementController {

    @Autowired
    private CourierCompanyService courierCompanyService;

    @GetMapping("/")
    public String index(){
        return "Admin/CourierCompanyManagement/index";
    }

    @RequiresRoles("admin")
    @ResponseBody
    @GetMapping("/getCourierCompanyList/pageNumber/{pageNumber}/pageSize/{pageSize}")
    public PageResults<CourierCompany> getCourierCompanyList(@PathVariable int pageNumber,
                                                             @PathVariable int pageSize){
        return courierCompanyService.getListByPage(pageNumber,pageSize);
    }
}
