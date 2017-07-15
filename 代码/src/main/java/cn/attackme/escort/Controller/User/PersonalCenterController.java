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

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static java.util.stream.Collectors.toList;
import static org.apache.shiro.SecurityUtils.getSubject;

/**
 * Created by IntelliJ IDEA.
 * User: StevenJack
 * Date: ${DATA}
 * Time: 17:09
 * To change this template use File | Settings | File Templates.
 * 个人中心
 */
@RequestMapping("/User/PersonalCenter")
@Controller
public class PersonalCenterController {
    @GetMapping("/")
    public String index(){
        return "User/PersonalCenter/index";
    }

    @Autowired
    private UserInfoService userInfoService;

    @Autowired
    private PackageService packageService;



    @RequiresRoles("user")
    @ResponseBody
    @GetMapping("/packageList")
    public ResponseEntity<Map<String,Object>> packageList(){
        final String userName = getSubject().getPrincipal().toString();
        User user = userInfoService.getById(userName);
        Map<String,Object> map = new HashMap<>();
        //MyPublish
        List<Package> MyPublishlist1 = user.getPublishList().stream().filter(p -> (p.getPackageStatus() == PackageStatus.待领取 || p.getPackageStatus() == PackageStatus.待签收 || p.getPackageStatus() == PackageStatus.待送达)).collect(toList());
        map.put("myPublishCount",MyPublishlist1.size());
        //MyDart
        List<Package> MyDartList1 = user.getReceiveList().stream().filter(p -> (p.getPackageStatus() == PackageStatus.待签收 || p.getPackageStatus() == PackageStatus.待送达)).collect(toList());
        map.put("myDartCount",MyDartList1.size());
        //WaitingEvaluation
        List<Package> WaitingEvaluationReceivelist = user.getReceiveList().stream().filter(p->(p.getPackageStatus().equals(PackageStatus.已完成) && !p.isAgencyEvaluate())).collect(toList());
        List<Package> WaitingEvaluationPublishList = user.getPublishList().stream().filter(p->(p.getPackageStatus().equals(PackageStatus.已完成) && !p.isDelegationEvaluated())).collect(toList());
        WaitingEvaluationPublishList.addAll(WaitingEvaluationReceivelist);
        map.put("waitingEvaluationCount",WaitingEvaluationPublishList.size());
        return new ResponseEntity<>(map,HttpStatus.OK);
    }
}
