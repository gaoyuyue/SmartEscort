package cn.attackme.escort.Controller.UMITeam;

import cn.attackme.escort.Model.Area;
import cn.attackme.escort.Model.School;
import cn.attackme.escort.Model.UMIPackage;
import cn.attackme.escort.Service.AreaService;
import cn.attackme.escort.Service.SchoolService;
import cn.attackme.escort.Service.UMIPackageService;
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
    private AreaService areaService;

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
                         Model model){
        try {
            School school = schoolService.getByName(schoolName);
            Area area = areaService.getByNameAndSchool(areaName, school);
            String orderNo = genOrderNo();
            UMIPackage umiPackage = new UMIPackage(orderNo,name,phoneNumber,message,school,area,detailAddress,new Date());
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
}
