package cn.attackme.escort.Controller.User;

import cn.attackme.escort.Model.Address;
import cn.attackme.escort.Model.Area;
import cn.attackme.escort.Model.School;
import cn.attackme.escort.Model.User;
import cn.attackme.escort.Service.AddressService;
import cn.attackme.escort.Service.AreaService;
import cn.attackme.escort.Service.SchoolService;
import cn.attackme.escort.Service.UserInfoService;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.FlashMap;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Optional;

import static java.util.stream.Collectors.toList;
import static org.apache.shiro.SecurityUtils.getSubject;

/**
 * Created by arthurme on 2017/3/25.
 * 地址管理
 */
@RequestMapping("/User/ManageAddress")
@Controller
public class ManageAddressController {
    @Autowired
    private UserInfoService userInfoService;
    @Autowired
    private AddressService addressService;
    @Autowired
    private SchoolService schoolService;
    @Autowired
    private AreaService areaService;

    @RequiresRoles("user")
    @GetMapping("/")
    public String index(){
        return "User/ManageAddress/index";
    }

    @RequiresRoles("user")
    @GetMapping("/add")
    public String addPage(){
        return "User/ManageAddress/add";
    }

    @RequiresRoles("user")
    @GetMapping("/select")
    public String selectPage(){
        return "/User/ManageAddress/select";
    }

    @RequiresRoles("user")
    @GetMapping("/edit/addressId/{addressId}")
    public String editPage(@PathVariable int addressId,
                           HttpSession httpSession){
        httpSession.setAttribute("addressId",addressId);
        return "User/ManageAddress/edit";
    }

    //增加收货地址
    @RequiresRoles("user")
    @ResponseBody
    @PostMapping("/add")
    public ResponseEntity<Void> add(@RequestBody Address address){
        String userName = getSubject().getPrincipal().toString();
        User user = userInfoService.getById(userName);
        List<Address> addressList = user.getAddressList();
        if (addressList==null || addressList.size()==0){
            address.setDefault(true);
        }
        address.setUser(user);
        String areaName = address.getArea().getAreaName();
        Area area = areaService.getByName(areaName);
        address.setArea(area);
        addressService.save(address);
        return new ResponseEntity<Void>(HttpStatus.CREATED);
    }

    //获取被点击的收货地址信息
    @RequiresRoles("user")
    @ResponseBody
    @GetMapping("/edit")
    public ResponseEntity<Address> editData(HttpSession httpSession){
        int addressId = (int) httpSession.getAttribute("addressId");
        httpSession.removeAttribute("addressId");
        Address address = addressService.getById(addressId);
        return new ResponseEntity<Address>(address,HttpStatus.OK);
    }

    //更新收货地址
    @RequiresRoles("user")
    @ResponseBody
    @PutMapping("/edit")
    public ResponseEntity<Void> editUpdate(@RequestBody Address address){
        Address oldAddress = addressService.getById(address.getId());
        Area area = areaService.getByName(address.getArea().getAreaName());
        address.setArea(area);
        address.setDefault(oldAddress.isDefault());
        address.setUser(oldAddress.getUser());
        addressService.saveOrUpdate(address);
        return new ResponseEntity<Void>(HttpStatus.OK);
    }

    //删除收获地址
    @RequiresRoles("user")
    @ResponseBody
    @DeleteMapping("delete/addressId/{addressId}")
    public ResponseEntity<Void> delete(@PathVariable int addressId){
        Address address = addressService.getById(addressId);
        addressService.deleteById(addressId);
        if (address.isDefault()){
            String userName = getSubject().getPrincipal().toString();
            List<Address> addressList = userInfoService.getById(userName).getAddressList();
            if (addressList.size()>0){
                Address defaultAddress = addressList.stream().findFirst().get();
                defaultAddress.setDefault(true);
                addressService.saveOrUpdate(defaultAddress);
            }
        }
        return new ResponseEntity<Void>(HttpStatus.OK);
    }

    //获取学校列表，不需权限访问
    @ResponseBody
    @GetMapping("/schoolNameList")
    public ResponseEntity<List<String>> schoolNameList(){
        List<School> schoolList = schoolService.getAll();
        List<String> stringList = schoolList.stream().map(School::getSchoolName).collect(toList());
        return new ResponseEntity<List<String>>(stringList,HttpStatus.OK);
    }

    //获取当前用户所属学校的区域
    @RequiresRoles("user")
    @ResponseBody
    @GetMapping("/areaNameList")
    public ResponseEntity<List<String>> areaNameList(){
        String userName = getSubject().getPrincipal().toString();
        User user = userInfoService.getById(userName);
        List<Area> areaList = user.getSchool().getAreaList();
        List<String> stringList = areaList.stream().map(Area::getAreaName).collect(toList());
        return new ResponseEntity<List<String>>(stringList,HttpStatus.OK);
    }

    //获取当前用户的收货地址列表
    @RequiresRoles("user")
    @ResponseBody
    @GetMapping("/addressList")
    public ResponseEntity<List<Address>> addressList(){
        String userName = getSubject().getPrincipal().toString();
        User user = userInfoService.getById(userName);
        return new ResponseEntity<>(user.getAddressList(),HttpStatus.OK);
    }

    //获取当前用户的默认收获地址
    @RequiresRoles("user")
    @ResponseBody
    @PutMapping("/default")
    public ResponseEntity<Void> setDefault(@RequestBody int addressId){
        String userName = getSubject().getPrincipal().toString();
        User user = userInfoService.getById(userName);
        List<Address> addressList = user.getAddressList();
        Address address = addressList.stream().filter(Address::isDefault).findFirst().orElse(null);
        if (address!=null){
            address.setDefault(false);
        }
        Address defaultAddress = addressService.getById(addressId);
        defaultAddress.setDefault(true);
        addressService.saveOrUpdate(defaultAddress);
        return new ResponseEntity<Void>(HttpStatus.OK);
    }
}
