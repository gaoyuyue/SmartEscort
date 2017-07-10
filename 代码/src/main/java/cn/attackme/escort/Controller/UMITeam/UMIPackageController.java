package cn.attackme.escort.Controller.UMITeam;

import cn.attackme.escort.Model.*;
import cn.attackme.escort.Model.Package;
import cn.attackme.escort.Service.*;
import cn.attackme.escort.Utils.PageResults;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.Date;
import java.util.List;

import static cn.attackme.escort.Utils.LogUtils.LogToDB;
import static cn.attackme.escort.Utils.OrderUtil.genOrderNo;
import static java.util.stream.Collectors.toList;

/**
 * Created by arthurme on 2017/7/8.
 */
@Controller
@RequestMapping("/UMITeam")
public class UMIPackageController {
    @Autowired
    private SchoolService schoolService;
    @Autowired
    private UMIPackageService umiPackageService;
    @Autowired
    private PackageService packageService;
    @Autowired
    private AreaService areaService;
    @Autowired
    private CourierCompanyService courierCompanyService;

    @GetMapping("/")
    public String index(){
        return "UMITeam/index";
    }

    @RequiresRoles("admin")
    @GetMapping("/admin")
    public String admin(){
        return "UMITeam/admin";
    }

    @GetMapping("/success")
    public String success(){
        return "UMITeam/success";
    }

    @PostMapping("/")
    public String create(@RequestParam String name,
                         @RequestParam String phoneNumber,
                         @RequestParam String detailAddress,
                         @RequestParam String message,
                         @RequestParam String schoolName,
                         @RequestParam String areaName,
                         @RequestParam String courierCompany,
                         Model model){
        try {
            CourierCompany company = courierCompanyService.getByName(courierCompany);
            School school = schoolService.getByName(schoolName);
            Area area = areaService.getByNameAndSchool(areaName, school);
            String orderNo = genOrderNo();
            UMIPackage umiPackage = new UMIPackage(orderNo,name,phoneNumber,message,PackageStatus.待领取,school,area,company,detailAddress,new Date());
            umiPackageService.save(umiPackage);
            model.addAttribute("orderNumber",orderNo);
            return "UMITeam/success";
        }catch (Exception e){
            LogToDB(e);
            return "UMITeam/failure";
        }
    }

    @GetMapping("/areaNameList/schoolName/{schoolName}")
    @ResponseBody
    public ResponseEntity<List<String>> areaList(@PathVariable String schoolName){
        School school = schoolService.getByName(schoolName);
        List<String> areaNameList = school.getAreaList().stream().map(Area::getAreaName).collect(toList());
        return new ResponseEntity<List<String>>(areaNameList,HttpStatus.OK);
    }

    @RequiresRoles("admin")
    @GetMapping("/packageList/packageType/{packageType}/areaId/{areaId}/packageStatus/{packageStatus}/pageNumber/{pageNumber}/pageSize/{pageSize}")
    public ResponseEntity<PageResults<Package>> packageList(
                                                            @PathVariable int packageType,
                                                            @PathVariable int areaId,
                                                            @PathVariable PackageStatus packageStatus,
                                                            @PathVariable int pageNumber,
                                                            @PathVariable int pageSize){
        Area area = areaService.getById(areaId);
        CourierCompany courierCompany = courierCompanyService.getById(packageType);
        PageResults<Package> pageResults = packageService.getListPageByAreaAndStatusAndType(area, packageStatus, courierCompany, pageNumber, pageSize);
        return new ResponseEntity<PageResults<Package>>(pageResults,HttpStatus.OK);
    }

    @RequiresRoles("admin")
    @GetMapping("/umiPackageList/packageType/{packageType}/areaId/{areaId}/packageStatus/{packageStatus}/pageNumber/{pageNumber}/pageSize/{pageSize}")
    public ResponseEntity<PageResults<UMIPackage>> umiPackageList(
                                                                  @PathVariable int packageType,
                                                                  @PathVariable int areaId,
                                                                  @PathVariable PackageStatus packageStatus,
                                                                  @PathVariable int pageNumber,
                                                                  @PathVariable int pageSize){
        Area area = areaService.getById(areaId);
        CourierCompany courierCompany = courierCompanyService.getById(packageType);
        PageResults<UMIPackage> pageResults = umiPackageService.getListPageByAreaAndStatusAndType(area, packageStatus, courierCompany, pageNumber, pageSize);
        return new ResponseEntity<PageResults<UMIPackage>>(pageResults,HttpStatus.OK);
    }

    @RequiresRoles("admin")
    @PutMapping("/getUMIPackage/packageId/{packageId}")
    public ResponseEntity<Void> getUMIPackage(@PathVariable String packageId){
        UMIPackage umiPackage = umiPackageService.getById(packageId);
        umiPackage.setPackageStatus(PackageStatus.待签收);
        umiPackageService.saveOrUpdate(umiPackage);
        return new ResponseEntity<Void>(HttpStatus.OK);
    }

    @RequiresRoles("admin")
    @PutMapping("/accomplishUMIPackage/packageId/{packageId}")
    public ResponseEntity<Void> accomplishUMIPackage(@PathVariable String packageId){
        UMIPackage umiPackage = umiPackageService.getById(packageId);
        umiPackage.setPackageStatus(PackageStatus.待评价);
        umiPackageService.saveOrUpdate(umiPackage);
        return new ResponseEntity<Void>(HttpStatus.OK);
    }

    @RequiresRoles("admin")
    @PutMapping("/deleteUMIPackage/packageId/{packageId}")
    public ResponseEntity<Void> deleteUMIPackage(@PathVariable String packageId){
        UMIPackage umiPackage = umiPackageService.getById(packageId);
        umiPackage.setPackageStatus(PackageStatus.已撤销);
        umiPackageService.saveOrUpdate(umiPackage);
        return new ResponseEntity<Void>(HttpStatus.OK);
    }
}
