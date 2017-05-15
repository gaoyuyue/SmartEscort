package cn.attackme.escort.Controller.User;

import cn.attackme.escort.Model.*;
import cn.attackme.escort.Model.Package;
import cn.attackme.escort.Service.*;
import cn.attackme.escort.Utils.PageResults;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

import static java.util.stream.Collectors.toList;
import static org.apache.shiro.SecurityUtils.getSubject;

/**
 * Created by arthurme on 2017/3/31.
 * 接取包裹
 */
@RequestMapping("/User/GetPackage")
@Controller
public class GetPackageController {
    @Autowired
    private AreaService areaService;
    @Autowired
    private CourierCompanyService courierCompanyService;
    @Autowired
    private StandardService standardService;
    @Autowired
    private PackageService packageService;
    @Autowired
    private UserService userService;

    @GetMapping("/")
    public String index(){
        return "User/GetPackage/index";
    }

    //获取区域列表
    @RequiresRoles("user")
    @ResponseBody
    @GetMapping("/areaList")
    public ResponseEntity<List<String>> areaList(){
        List<String> stringList = areaService.getAll().stream().map(Area::getAreaName).collect(toList());
        return new ResponseEntity<List<String>>(stringList, HttpStatus.OK);
    }

    //获取标准列表
    @RequiresRoles("user")
    @ResponseBody
    @GetMapping("/standardList")
    public ResponseEntity<List<String>> standardList(){
        List<String> stringList = standardService.getAll().stream().map(Standard::getDescription).collect(toList());
        return new ResponseEntity<List<String>>(stringList,HttpStatus.OK);
    }

    //获取快递类型
    @RequiresRoles("user")
    @ResponseBody
    @GetMapping("/courierList")
    public ResponseEntity<List<String>> courierList(){
        List<String> stringList = courierCompanyService.getAll().stream().map(CourierCompany::getCompanyName).collect(toList());
        return new ResponseEntity<List<String>>(stringList,HttpStatus.OK);
    }

    //获取所有包裹
    @RequiresRoles("user")
    @ResponseBody
    @GetMapping("/allList/pageNumber/{pageNumber}/pageSize/{pageSize}")
    public ResponseEntity<PageResults<Package>> allList(@PathVariable int pageNumber,
                                                        @PathVariable int pageSize){
        String userName = getSubject().getPrincipal().toString();
        User user = userService.getById(userName);
        PageResults<Package> results = packageService.getPackageByStatusAndSchool(PackageStatus.待领取, user.getSchool(), pageNumber, pageSize);
        return new ResponseEntity<PageResults<Package>>(results,HttpStatus.OK);
    }

    //筛选
    @RequiresRoles("user")
    @ResponseBody
    @GetMapping("/sortList/areaId/{areaId}" +
            "/courierCompanyId/{courierCompanyId}" +
            "/standardId/{standardId}" +
            "/pageNumber/{pageNumber}" +
            "/pageSize/{pageSize}")
    public ResponseEntity<PageResults<Package>> filterList(@PathVariable String areaId,
                                                         @PathVariable String courierCompanyId,
                                                         @PathVariable String standardId,
                                                         @PathVariable int pageNumber,
                                                         @PathVariable int pageSize){
        Area area = areaService.getByName(areaId);
        CourierCompany courierCompany = courierCompanyService.getByName(courierCompanyId);
        Standard standard = standardService.getByDescription(standardId);
        String userName = getSubject().getPrincipal().toString();
        User user = userService.getById(userName);
        PageResults<Package> results = packageService.getPackageByFilter(area, courierCompany, standard,
                PackageStatus.待领取, user.getSchool(), pageNumber, pageSize);
        return new ResponseEntity<PageResults<Package>>(results,HttpStatus.OK);
    }

    //领取包裹
    @RequiresRoles("user")
    @ResponseBody
    @GetMapping("/receive/packageId/{packageId}")
    public ResponseEntity<Void> receive(@PathVariable int packageId){
        String userName = getSubject().getPrincipal().toString();
        User user = userService.getById(userName);
        Package thePackage = packageService.getById(packageId);
        thePackage.setAgency(user);
        thePackage.setPackageStatus(PackageStatus.已领取);
        packageService.saveOrUpdate(thePackage);
        return new ResponseEntity<Void>(HttpStatus.OK);
    }
}
