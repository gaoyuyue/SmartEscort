package cn.attackme.escort.Controller.User;

import cn.attackme.escort.Model.Package;
import cn.attackme.escort.Model.PackageStatus;
import cn.attackme.escort.Model.User;
import cn.attackme.escort.Service.PackageService;
import cn.attackme.escort.Service.UserInfoService;
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
 * Created by IntelliJ IDEA.
 * User: StevenJack
 * Date: ${DATA}
 * Time: 19:28
 * To change this template use File | Settings | File Templates.
 * 待评价
 */
@RequestMapping("/User/WaitingEvaluation")
@Controller
public class WaitingEvaluationController {
    @GetMapping("/")
    public String index(){
        return "User/WaitingEvaluation/index";
    }

    @Autowired
    private UserInfoService userInfoService;

    @Autowired
    private PackageService packageService;

    /**
     * 获取当前人所有的包裹
     * @return
     */
    @ResponseBody
    @GetMapping("packageList")
    public List<Package> packageList(){
        String userName = getSubject().getPrincipal().toString();
        User user = userInfoService.getById(userName);
        List<Package> receivelist = user.getReceiveList()
                                    .stream()
                                    .filter(p->(p.getPackageStatus().equals(PackageStatus.已完成) && !p.isAgencyEvaluate()))
                                    .collect(toList());
        List<Package> publishList = user.getPublishList()
                                    .stream()
                                    .filter(p->(p.getPackageStatus().equals(PackageStatus.已完成) && !p.isDelegationEvaluated()))
                                    .collect(toList());
        publishList.addAll(receivelist);
        return publishList;
    }

    /**
     * 获取当前人包裹信息
     * @param publishDartId
     * @return
     */
    @ResponseBody
    @GetMapping("/dartDetail/publishDartId/{publishDartId}")
    public ResponseEntity<Package> getDartDetail(@PathVariable String publishDartId){
        Package aPackage = packageService.getById(publishDartId);
        return new ResponseEntity<>(aPackage,HttpStatus.OK);
    }
}
