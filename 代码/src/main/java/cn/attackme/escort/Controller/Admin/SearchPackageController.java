package cn.attackme.escort.Controller.Admin;

import cn.attackme.escort.Model.Package;
import cn.attackme.escort.Model.School;
import cn.attackme.escort.Model.UMIPackage;
import cn.attackme.escort.Model.User;
import cn.attackme.escort.Service.PackageService;
import cn.attackme.escort.Service.SchoolService;
import cn.attackme.escort.Service.UMIPackageService;
import cn.attackme.escort.Service.UserInfoService;
import cn.attackme.escort.Utils.PageResults;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Created by Administrator on 2017/7/13.
 */
@Controller
@RequestMapping("/SearchPackage")
public class SearchPackageController {

    @Autowired
    private UserInfoService userInfoService;
    @Autowired
    private PackageService packageService;
    @Autowired
    private UMIPackageService umiPackageService;
    @Autowired
    private SchoolService schoolService;

    @RequiresRoles("admin")
    @GetMapping("/")
    public String index(){
        return "Admin/SearchPackage/index";
    }

    //查找订单
    @RequiresRoles("admin")
    @ResponseBody
    @GetMapping("/SearchPackage/packageId/{packageId}/schoolId/{schoolId}/pageNumber/{pageNumber}/pageSize/{pageSize}")
    public PageResults<Package> SearchPackage(@PathVariable String packageId,
                                              @PathVariable int schoolId, @PathVariable int pageNumber,
                                              @PathVariable int pageSize){
        School school = schoolService.getById(schoolId);
        return packageService.getListBySearch(school,packageId,pageNumber,pageSize);
    }
    //查找UMI订单
    @RequiresRoles("admin")
    @ResponseBody
    @GetMapping("/SearchUMIPackage/packageId/{packageId}/schoolId/{schoolId}/pageNumber/{pageNumber}/pageSize/{pageSize}")
    public PageResults<UMIPackage> SearchUMIPackage(@PathVariable String packageId,
                                                    @PathVariable int schoolId, @PathVariable int pageNumber,
                                                    @PathVariable int pageSize){
        School school = schoolService.getById(schoolId);
        return umiPackageService.getListBySearch(school,packageId,pageNumber,pageSize);
    }
}
