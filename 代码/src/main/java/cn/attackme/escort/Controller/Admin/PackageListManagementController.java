package cn.attackme.escort.Controller.Admin;

import cn.attackme.escort.Model.Package;
import cn.attackme.escort.Model.PackageStatus;
import cn.attackme.escort.Model.School;
import cn.attackme.escort.Service.PackageService;
import cn.attackme.escort.Service.SchoolService;
import cn.attackme.escort.Utils.PageResults;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;

import static cn.attackme.escort.Model.PackageStatus.待领取;


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
    @RequiresRoles("admin")
    @GetMapping("/")
    public String index(){
        return "Admin/PackageListManagement/index";
    }

    //获取全部订单
    @RequiresRoles("admin")
    @ResponseBody
    @GetMapping("/PackageList/packageStatus/{packageStatus}/schoolId/{schoolId}/pageNumber/{pageNumber}/pageSize/{pageSize}")
    public PageResults<Package> PackageList(@PathVariable PackageStatus packageStatus ,@PathVariable int schoolId,@PathVariable int pageNumber,
                                             @PathVariable int pageSize){
       School schoolName=schoolService.getById(schoolId);
       return packageService.getPackageByStatusAndSchool(packageStatus,schoolName,pageNumber,pageSize);

    }

//    删除订单
    @RequiresRoles("admin")
    @DeleteMapping("/deletePackage/id/{id}")
    public ResponseEntity<Void> deletePackage(@PathVariable int id) {
        if (packageService.getById(id) == null) {
            return new ResponseEntity<Void>(HttpStatus.NOT_FOUND);
        } else {
            packageService.deleteById(id);
            return new ResponseEntity<Void>(HttpStatus.OK);
        }
    }
}
