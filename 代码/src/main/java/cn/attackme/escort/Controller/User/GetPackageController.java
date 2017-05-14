package cn.attackme.escort.Controller.User;

import cn.attackme.escort.Model.Area;
import cn.attackme.escort.Model.CourierCompany;
import cn.attackme.escort.Model.Standard;
import cn.attackme.escort.Service.AreaService;
import cn.attackme.escort.Service.CourierCompanyService;
import cn.attackme.escort.Service.StandardService;
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

}
