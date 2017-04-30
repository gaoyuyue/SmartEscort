package cn.attackme.escort.Controller.User;

import cn.attackme.escort.Model.Package;
import cn.attackme.escort.Model.PackageStatus;
import cn.attackme.escort.Model.User;
import cn.attackme.escort.Service.PackageService;
import cn.attackme.escort.Service.UserInfoService;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

import static java.util.stream.Collectors.toList;
import static org.apache.shiro.SecurityUtils.getSubject;

/**
 * Created by IntelliJ IDEA.
 * User: StevenJack
 * Date: ${DATA}
 * Time: 15:58
 * To change this template use File | Settings | File Templates.
 * 评价详情
 */
@RequestMapping("/User/EvaluationDetail")
@Controller
public class EvaluationDetailController {
    @GetMapping("/")
    public String index(){
        return "User/EvaluationDetail/index";
    }

    @Autowired
    private UserInfoService userInfoService;

    @Autowired
    private PackageService packageService;

    /**
     * 通过包裹获取代理人信息
     * @return
     */
    @RequiresRoles("user")
    @ResponseBody
    @RequestMapping("/agency")
    public ResponseEntity<List<Package>> getAgencyInfo(){
        String userName = getSubject().getPrincipal().toString();
        User user = userInfoService.getById(userName);
        List<Package> publishList = user.getPublishList();
        List<Package> publishList1 = publishList.stream().filter(p -> (p.getPackageStatus() == PackageStatus.待评价)).collect(toList());
        return new ResponseEntity<>(publishList1,HttpStatus.OK);
    }


}
