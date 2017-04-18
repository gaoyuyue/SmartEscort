package cn.attackme.escort.Controller.User;


import cn.attackme.escort.Service.PackageService;
import cn.attackme.escort.Service.UserInfoService;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by arthurme on 2017/3/21.
 */
@RequestMapping("/User/PostPackage")
@Controller
public class PostPackageController {

    @Autowired
    private UserInfoService userInfoService;
    @Autowired
    private PackageService packageService;

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

    /*@PostMapping("/")
    public ResponseEntity<Void> create(@RequestBody Package p){
        Certificate certificate = p.getCertificate();
        certificateService.save(certificate);
        String userName = getSubject().getPrincipal().toString();
        User user = userInfoService.getById(userName);
        p.setDelegation(user);
        p.setPackageStatus(PackageStatus.待领取);
        p.setCertificate(certificate);
        packageService.save(p);
        return new ResponseEntity<Void>(HttpStatus.CREATED);
    }*/
}
