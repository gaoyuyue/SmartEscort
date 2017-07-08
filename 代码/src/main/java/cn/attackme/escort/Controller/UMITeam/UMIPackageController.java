package cn.attackme.escort.Controller.UMITeam;

import cn.attackme.escort.Model.Area;
import cn.attackme.escort.Model.School;
import cn.attackme.escort.Model.UMIPackage;
import cn.attackme.escort.Service.SchoolService;
import cn.attackme.escort.Service.UMIPackageService;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;

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

    @GetMapping("/")
    public String index(){
        return "UMITeam/index";
    }

    @RequiresRoles("admin")
    @GetMapping("/admin")
    public String admin(){
        return "UMITeam/admin";
    }

    @PostMapping("/")
    @ResponseBody
    public ResponseEntity<Void> create(@RequestBody UMIPackage umiPackage){
        umiPackageService.save(umiPackage);
        return new ResponseEntity<Void>(HttpStatus.CREATED);
    }

    @GetMapping("/areaNameList/schoolName/{schoolName}")
    @ResponseBody
    public ResponseEntity<List<String>> areaList(@PathVariable String schoolName){
        School school = schoolService.getByName(schoolName);
        List<String> areaNameList = school.getAreaList().stream().map(Area::getAreaName).collect(toList());
        return new ResponseEntity<List<String>>(areaNameList,HttpStatus.OK);
    }
}
