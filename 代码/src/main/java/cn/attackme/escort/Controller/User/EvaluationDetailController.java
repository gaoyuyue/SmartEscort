package cn.attackme.escort.Controller.User;

import cn.attackme.escort.Model.CreditRecord;
import cn.attackme.escort.Model.CreditRecordDescription;
import cn.attackme.escort.Model.Package;
import cn.attackme.escort.Model.User;
import cn.attackme.escort.Service.CreditRecordService;
import cn.attackme.escort.Service.PackageService;
import cn.attackme.escort.Service.UserInfoService;
import com.mysql.cj.mysqlx.protobuf.Mysqlx;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

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

    @Autowired
    private CreditRecordService creditRecordService;

    //获取用户
    @RequiresRoles("user")
    @ResponseBody
    @GetMapping("/userInformation")
    public User getInfo(){
        final String userName = SecurityUtils.getSubject().getPrincipal().toString();
        return userInfoService.getById(userName);
    }


    /**
     * 获取当前人包裹信息
     * @param publishDartId
     * @return
     */
    @RequiresRoles("user")
    @ResponseBody
    @GetMapping("/dartDetail/publishDartId/{publishDartId}")
    public ResponseEntity<Package> getDartDetail(@PathVariable String publishDartId){
        Package aPackage = packageService.getById(publishDartId);
        return new ResponseEntity<>(aPackage,HttpStatus.OK);
    }

    /**
     * 作为委托人给对方评价
     * @param theLastScore
     * @param userName
     * @return
     */
    @RequiresRoles("user")
    @ResponseBody
    @PostMapping("/create/theLastScore/{theLastScore}/userName/{userName}/publishDartId/{publishDartId}")
    public ResponseEntity<Void> create(@PathVariable int theLastScore,
                                        @PathVariable String userName,
                                       @PathVariable String publishDartId){
        User other = userInfoService.getById(userName);
        Package aPackage = packageService.getById(publishDartId);
        CreditRecord creditRecord = new CreditRecord();
        if(theLastScore >= -5 && theLastScore <= 5){
            creditRecord.setScore(theLastScore);
            creditRecord.setUser(other);
            creditRecord.setDescription(CreditRecordDescription.对方评价);
            creditRecordService.save(creditRecord);
            if(aPackage.getAgency().getUserName() == other.getUserName()){
                aPackage.setDelegationEvaluated(true);
                packageService.saveOrUpdate(aPackage);
            } else {
                aPackage.setAgencyEvaluate(true);
                packageService.saveOrUpdate(aPackage);
            }
            return new ResponseEntity<>(HttpStatus.OK);
        } else {
            return new ResponseEntity<>(HttpStatus.NOT_ACCEPTABLE);
        }


    }
}
