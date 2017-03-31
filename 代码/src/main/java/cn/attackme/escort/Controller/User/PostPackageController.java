package cn.attackme.escort.Controller.User;

import cn.attackme.escort.Model.Certificate;
import cn.attackme.escort.Model.Package;
import cn.attackme.escort.Model.PackageStatus;
import cn.attackme.escort.Model.User;
import cn.attackme.escort.Service.CertificateService;
import cn.attackme.escort.Service.PackageService;
import cn.attackme.escort.Service.UserInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import static org.apache.shiro.SecurityUtils.getSubject;

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
    @Autowired
    private CertificateService certificateService;

    @GetMapping("/")
    public String index(){
        return "User/PostPackage/index";
    }

    @PostMapping("/")
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
    }
}
