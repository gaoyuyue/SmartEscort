package cn.attackme.escort.Controller.Admin;

import cn.attackme.escort.Model.*;
import cn.attackme.escort.Model.Package;
import cn.attackme.escort.Service.*;
import cn.attackme.escort.Utils.PageResults;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Created by hujian on 2017/3/24.
 */
@Controller
@RequestMapping("/PackageListManagement")
public class PackageListManagementController {

    @Autowired
    private PackageService packageService;
    @Autowired
    private SchoolService schoolService;
    @Autowired
    private UserService userService;
    @Autowired
    private UserInfoService userInfoService;
    @Autowired
    private UMIPackageService umiPackageService;
    @RequiresRoles("admin")
    @GetMapping("/")
    public String index(){
        return "Admin/PackageListManagement/index";
    }


    //获取微信端全部订单
    @RequiresRoles("admin")
    @ResponseBody
    @GetMapping("/PackageList/packageStatus/{packageStatus}/schoolId/{schoolId}/pageNumber/{pageNumber}/pageSize/{pageSize}")
    public PageResults<Package> PackageList(@PathVariable PackageStatus packageStatus , @PathVariable int schoolId, @PathVariable int pageNumber,
                                            @PathVariable int pageSize){
       School school=schoolService.getById(schoolId);
       return packageService.getPackageByStatusAndSchool(packageStatus,school,pageNumber,pageSize);

    }
    //获取UMI订单
    @RequiresRoles("admin")
    @ResponseBody
    @GetMapping("/UMLPackageList/packageStatus/{packageStatus}/schoolId/{schoolId}/pageNumber/{pageNumber}/pageSize/{pageSize}")
    public PageResults<UMIPackage> UMLPackageList(@PathVariable PackageStatus packageStatus ,@PathVariable int schoolId,@PathVariable int pageNumber,
                                                  @PathVariable int pageSize){
        School school=schoolService.getById(schoolId);
        return umiPackageService.getPackageByStatusAndSchool(school,packageStatus,pageNumber,pageSize);
    }


}
