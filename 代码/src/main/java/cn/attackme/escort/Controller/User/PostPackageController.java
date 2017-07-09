package cn.attackme.escort.Controller.User;


import cn.attackme.escort.Model.*;
import cn.attackme.escort.Model.Package;
import cn.attackme.escort.Service.*;
import org.apache.shiro.authz.annotation.Logical;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static java.util.stream.Collectors.toList;
import static org.apache.shiro.SecurityUtils.getSubject;

/**
 * Created by arthurme on 2017/3/21.
 * 发布包裹
 */
@RequestMapping("/User/PostPackage")
@Controller
public class PostPackageController {

    @Autowired
    private UserInfoService userInfoService;
    @Autowired
    private PackageService packageService;
    @Autowired
    private StandardService standardService;
    @Autowired
    private CourierCompanyService courierCompanyService;
    @Autowired
    private AddressService addressService;
    @Autowired
    private AreaService areaService;

    @RequiresRoles("user")
    @GetMapping("/")
    public String index(){
        return "User/PostPackage/index";
    }

    @RequiresRoles("user")
    @GetMapping("/success")
    public String success(){
        return "User/PostPackage/success";
    }

    @RequiresRoles("user")
    @GetMapping("/failure")
    public String failure(){
        return "User/PostPackage/failure";
    }

    @RequiresRoles("user")
    @GetMapping("/selectAddress")
    public String selectPage(){
        return "/User/PostPackage/selectAddress";
    }

    @RequiresRoles("user")
    @GetMapping("/addAddress")
    public String addAddressPage(){
        return "/User/PostPackage/addAddress";
    }

    //获取缓存
    @RequiresRoles("user")
    @GetMapping("/addressAndCache")
    public ResponseEntity<Map<String,Object>> address(HttpSession httpSession){
        boolean hasCache = (httpSession.getAttribute("hasCache") != null) ? true : false;
        Map<String,Object> map = new HashMap<>();
        if (hasCache){
            Map<String,Object> httpMap = (Map<String, Object>) httpSession.getAttribute("cache");
            Address address = (Address) httpSession.getAttribute("address");
            map.put("hasCache",true);
            map.put("address",address);
            map.putAll(httpMap);
        }else {
            String userName = getSubject().getPrincipal().toString();
            User user = userInfoService.getById(userName);
            Address address = user.getAddressList().stream().filter(Address::isDefault).findFirst().orElse(null);
            map.put("address",address);
            map.put("hasCache",false);
        }
        httpSession.removeAttribute("hasCache");
        return new ResponseEntity<>(map,HttpStatus.OK);
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
    @ResponseBody
    @GetMapping("/courierList")
    public ResponseEntity<List<String>> courierList(){
        List<String> stringList = courierCompanyService.getAll().stream().map(CourierCompany::getCompanyName).collect(toList());
        return new ResponseEntity<List<String>>(stringList,HttpStatus.OK);
    }

    //创建缓存
    @RequiresRoles("user")
    @ResponseBody
    @PostMapping("/cache")
    public ResponseEntity<Void> cache(@RequestBody Map<String,Object> map,
                                      HttpSession httpSession){
        httpSession.setAttribute("cache",map);
        return new ResponseEntity<Void>(HttpStatus.OK);
    }

    //选择快递地址
    @RequiresRoles("user")
    @GetMapping("/select/addressId/{addressId}")
    public String select(@PathVariable int addressId,
                           HttpSession httpSession){
        Address address = addressService.getById(addressId);
        httpSession.setAttribute("address",address);
        httpSession.setAttribute("hasCache",true);
        return "redirect:/User/PostPackage/";
    }

    //获取已选择的收货地址
    @RequiresRoles("user")
    @GetMapping("/selected")
    @ResponseBody
    public ResponseEntity<Integer> selected(HttpSession httpSession){
        Object object = httpSession.getAttribute("address");
        Address address;
        if (object == null){
            String userName = getSubject().getPrincipal().toString();
            User user = userInfoService.getById(userName);
            address = user.getAddressList().stream().filter(Address::isDefault).findFirst().get();
        }else {
            address = (Address) object;
        }
        return new ResponseEntity<Integer>(address.getId(),HttpStatus.OK);
    }

    //添加快递地址
    @RequiresRoles("user")
    @PostMapping("/addAddress")
    @ResponseBody
    public ResponseEntity<Void> addAddress(@RequestBody Address address,
                                           HttpSession httpSession){
        String userName = getSubject().getPrincipal().toString();
        User user = userInfoService.getById(userName);
        List<Address> addressList = user.getAddressList();
        if (addressList==null || addressList.size()==0){
            address.setDefault(true);
        }
        address.setUser(user);
        String areaName = address.getArea().getAreaName();
        Area area = areaService.getByNameAndSchool(areaName,user.getSchool());
        address.setArea(area);
        httpSession.setAttribute("address",address);
        httpSession.setAttribute("hasCache",true);
        addressService.save(address);
        return new ResponseEntity<Void>(HttpStatus.CREATED);
    }

    //创建包裹
    @RequiresRoles(value = {"user","authed"},logical = Logical.AND)
    @PostMapping("/")
    @ResponseBody
    public ResponseEntity<Void> create(@RequestBody Package p){
        String userName = getSubject().getPrincipal().toString();
        User user = userInfoService.getById(userName);
        p.setSchool(user.getSchool());
        p.setDelegation(user);
        Area area = areaService.getById(p.getArea().getId());
        p.setArea(area);
        String companyName = p.getCourierCompany().getCompanyName();
        CourierCompany courierCompany = courierCompanyService.getByName(companyName);
        p.setCourierCompany(courierCompany);
        String description = p.getStandard().getDescription();
        Standard standard = standardService.getByDescription(description);
        p.setStandard(standard);
        p.setPublishTime(new Date());
        p.setPackageStatus(PackageStatus.待领取);
        packageService.save(p);
        return new ResponseEntity<Void>(HttpStatus.CREATED);
    }
}
