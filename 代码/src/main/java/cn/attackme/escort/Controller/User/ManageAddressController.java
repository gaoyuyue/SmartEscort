package cn.attackme.escort.Controller.User;

import cn.attackme.escort.Model.Address;
import cn.attackme.escort.Model.User;
import cn.attackme.escort.Service.AddressService;
import cn.attackme.escort.Service.UserInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import static org.apache.shiro.SecurityUtils.getSubject;

/**
 * Created by arthurme on 2017/3/25.
 */
@RequestMapping("/User/ManageAddress")
@Controller
public class ManageAddressController {
    @Autowired
    private UserInfoService userInfoService;
    @Autowired
    private AddressService addressService;

    @GetMapping("/")
    public String index(){
        return "User/ManageAddress/index";
    }

    @GetMapping("/add")
    public String addPage(){
        return "User/ManageAddress/add";
    }

    @GetMapping("/edit")
    public String editPage(){
        return "User/ManageAddress/edit";
    }

    @ResponseBody
    @PostMapping("/add")
    public ResponseEntity<Void> add(@RequestBody Address address){
        String userName = getSubject().getPrincipal().toString();
        User user = userInfoService.getById(userName);
        address.setUser(user);
        addressService.save(address);
        return new ResponseEntity<Void>(HttpStatus.CREATED);
    }
}
