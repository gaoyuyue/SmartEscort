package cn.attackme.escort.Controller.Admin;

import cn.attackme.escort.Model.Package;
import cn.attackme.escort.Model.PackageStatus;
import cn.attackme.escort.Service.PackageService;
import cn.attackme.escort.Utils.PageResults;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import static cn.attackme.escort.Model.PackageStatus.待领取;


/**
 * Created by hujian on 2017/3/24.
 */
@Controller
@RequestMapping("/PackageListManagement")
public class PackageListManagementController {

    @Autowired
    private PackageService packageService;

    @GetMapping("/")
    public String index(){
        return "Admin/PackageListManagement/index";
    }

    @RequiresRoles("admin")
    @ResponseBody
    @GetMapping("/getPackageList/pageNumber/{pageNumber}/pageSize/{pageSize}")
    public PageResults<Package> getPackageListByPage(@PathVariable int pageNumber,
                                                     @PathVariable int pageSize){
        return packageService.getPackageByStatus(待领取,pageNumber,pageSize);
    }


}
