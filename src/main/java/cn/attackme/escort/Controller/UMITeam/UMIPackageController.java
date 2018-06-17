package cn.attackme.escort.Controller.UMITeam;

import cn.attackme.Wechat.Message.RowMessage;
import cn.attackme.Wechat.Util.MessageUtil;
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
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static cn.attackme.escort.Utils.LogUtils.LogToDB;
import static cn.attackme.escort.Utils.OrderUtil.genOrderNo;
import static java.util.stream.Collectors.toList;
import static org.apache.shiro.SecurityUtils.getSubject;

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
    @Autowired
    private UserInfoService userInfoService;

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
        if (name.trim().equals("")||phoneNumber.trim().equals("")
                ||detailAddress.trim().equals("")||message.trim().equals("")
                ||schoolName.trim().equals("")||areaName.trim().equals("")
                ||courierCompany.trim().equals(""))
            return "UMITeam/failure";
        try {
            CourierCompany company = courierCompanyService.getByName(courierCompany);
            School school = schoolService.getByName(schoolName);
            Area area = areaService.getByNameAndSchool(areaName, school);
            String orderNo = genOrderNo();
            UMIPackage umiPackage = new UMIPackage(orderNo,name,phoneNumber,message,PackageStatus.待领取,school,area,company,detailAddress,new Date(),null,null);
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
        String userName = getSubject().getPrincipal().toString();
        User user = userInfoService.getById(userName);
        PageResults<Package> pageResults;
        if(packageStatus.equals(PackageStatus.待领取)){
            pageResults = packageService.getListPageByAreaAndStatusAndType(area, packageStatus, courierCompany, pageNumber, pageSize);
        }else {
            pageResults = packageService.getListPageByAreaAndStatusAndTypeAndUser(user, area, packageStatus, courierCompany, pageNumber, pageSize);
        }
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
        umiPackage.setReceiveDate(new Date());
        umiPackage.setPackageStatus(PackageStatus.待送达);
        umiPackageService.saveOrUpdate(umiPackage);
        return new ResponseEntity<Void>(HttpStatus.OK);
    }

    @RequiresRoles("admin")
    @PutMapping("/accomplishUMIPackage/packageId/{packageId}")
    public ResponseEntity<Void> accomplishUMIPackage(@PathVariable String packageId){
        UMIPackage umiPackage = umiPackageService.getById(packageId);
        umiPackage.setEndDate(new Date());
        umiPackage.setPackageStatus(PackageStatus.已完成);
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

    @RequiresRoles("admin")
    @PutMapping("/getPackage/packageId/{packageId}")
    public ResponseEntity<Void> getPackage(@PathVariable String packageId){
        Package umiPackage = packageService.getById(packageId);
        String userName = getSubject().getPrincipal().toString();
        User user = userInfoService.getById(userName);
        umiPackage.setReceiveTime(new Date());
        umiPackage.setAgency(user);
        umiPackage.setPackageStatus(PackageStatus.待送达);
        packageService.saveOrUpdate(umiPackage);

        RowMessage receiverName = new RowMessage(user.getName()+"\n","red");
        RowMessage receiverPhone = new RowMessage(user.getPhoneNumber(),"red");
        Map<String,RowMessage> delegateMessageMap = new HashMap<>();
        delegateMessageMap.put("receiverName",receiverName);
        delegateMessageMap.put("receiverPhone",receiverPhone);
//        delegateMessage.setData(delegateMessageMap);

        MessageUtil.postTemplate(umiPackage.getDelegation().getOpenid(),"1r7zCe-2-qakpyNVNL-8-6SFvBJPtDop4bm6zWTgZlI","/User/MyPublish/",delegateMessageMap);
        return new ResponseEntity<Void>(HttpStatus.OK);
    }

    @RequiresRoles("admin")
    @PutMapping("/accomplishPackage/packageId/{packageId}")
    public ResponseEntity<Void> accomplishPackage(@PathVariable String packageId){
        Package umiPackage = packageService.getById(packageId);
        umiPackage.setEndTime(new Date());
        umiPackage.setPackageStatus(PackageStatus.待签收);
        packageService.saveOrUpdate(umiPackage);
        return new ResponseEntity<Void>(HttpStatus.OK);
    }
}
