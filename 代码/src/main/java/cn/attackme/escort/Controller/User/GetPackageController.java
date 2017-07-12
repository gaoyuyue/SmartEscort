package cn.attackme.escort.Controller.User;

import cn.attackme.Wechat.Message.RowMessage;
import cn.attackme.Wechat.Message.TemplateMessage;
import cn.attackme.Wechat.Util.MessageUtil;
import cn.attackme.Wechat.Util.WechatProperties;
import cn.attackme.escort.Model.*;
import cn.attackme.escort.Model.Package;
import cn.attackme.escort.Service.*;
import cn.attackme.escort.Utils.PageResults;
import org.apache.shiro.authz.annotation.Logical;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static java.util.stream.Collectors.toList;
import static org.apache.shiro.SecurityUtils.getSubject;

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
    @Autowired
    private PackageService packageService;
    @Autowired
    private UserService userService;

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

    //获取所有包裹
    @RequiresRoles("user")
    @ResponseBody
    @GetMapping("/allList/pageNumber/{pageNumber}/pageSize/{pageSize}")
    public ResponseEntity<PageResults<Package>> allList(@PathVariable int pageNumber,
                                                        @PathVariable int pageSize){
        String userName = getSubject().getPrincipal().toString();
        User user = userService.getById(userName);
        PageResults<Package> results = packageService.getPackageByStatusAndSchool(PackageStatus.待领取, user.getSchool(), pageNumber, pageSize);
        List<Package> packages = results.getResults().stream().filter(p -> !p.getDelegation().equals(user)).collect(toList());
        packages.forEach(p->p.setMessage(null));
        results.setResults(packages);
        return new ResponseEntity<PageResults<Package>>(results,HttpStatus.OK);
    }

    //筛选
    @RequiresRoles("user")
    @ResponseBody
    @GetMapping("/sortList/areaId/{areaId}" +
            "/courierCompanyId/{courierCompanyId}" +
            "/standardId/{standardId}" +
            "/pageNumber/{pageNumber}" +
            "/pageSize/{pageSize}")
    public ResponseEntity<PageResults<Package>> filterList(@PathVariable String areaId,
                                                         @PathVariable String courierCompanyId,
                                                         @PathVariable String standardId,
                                                         @PathVariable int pageNumber,
                                                         @PathVariable int pageSize){
        CourierCompany courierCompany = courierCompanyService.getByName(courierCompanyId);
        Standard standard = standardService.getByDescription(standardId);
        String userName = getSubject().getPrincipal().toString();
        User user = userService.getById(userName);
        Area area = areaService.getByNameAndSchool(areaId,user.getSchool());
        PageResults<Package> results = packageService.getPackageByFilter(area, courierCompany, standard,
                PackageStatus.待领取, user.getSchool(), pageNumber, pageSize);
        return new ResponseEntity<PageResults<Package>>(results,HttpStatus.OK);
    }

    //领取包裹
    @RequiresRoles(value = {"user","authed"},logical = Logical.AND)
    @ResponseBody
    @GetMapping("/receive/packageId/{packageId}")
    public ResponseEntity<Void> receive(@PathVariable String packageId){
        Package thePackage = packageService.getById(packageId);
        if (thePackage.getAgency() != null){
            return new ResponseEntity<Void>(HttpStatus.NOT_ACCEPTABLE);
        }
        String userName = getSubject().getPrincipal().toString();
        User agency = userService.getById(userName);
        if (thePackage.getDelegation().equals(agency)){
            return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
        }
        thePackage.setAgency(agency);
        thePackage.setPackageStatus(PackageStatus.待送达);
        thePackage.setReceiveTime(new Date());
        packageService.saveOrUpdate(thePackage);
        User delegation = thePackage.getDelegation();

        //发送模板消息给交易双方
        String foreUrl = WechatProperties.authorizeUrl+"?appid="+
                WechatProperties.appid+
                "&redirect_uri="+
                WechatProperties.OAuth2Url+
                "&response_type=code&scope=snsapi_base&state=";
        String backUrl = "#wechat_redirect";

        TemplateMessage delegateMessage = new TemplateMessage();
        delegateMessage.setTouser(delegation.getOpenid());
        delegateMessage.setTemplate_id("1r7zCe-2-qakpyNVNL-8-6SFvBJPtDop4bm6zWTgZlI");
        delegateMessage.setUrl(foreUrl+"/User/MyPublish/"+backUrl);
        RowMessage receiverName = new RowMessage(agency.getName()+"\n","red");
        RowMessage receiverPhone = new RowMessage(agency.getPhoneNumber(),"red");
        Map<String,RowMessage> delegateMessageMap = new HashMap<>();
        delegateMessageMap.put("receiverName",receiverName);
        delegateMessageMap.put("receiverPhone",receiverPhone);
        delegateMessage.setData(delegateMessageMap);

        TemplateMessage agencyMessage = new TemplateMessage();
        agencyMessage.setTouser(agency.getOpenid());
        agencyMessage.setTemplate_id("T-OcS-GauGMFnEEz3O9uXX_G8AZwbCJoCbFC16e8_iw");
        agencyMessage.setUrl(foreUrl+"/User/MyDart/"+backUrl);
        RowMessage publisherName = new RowMessage(agency.getName()+"\n","red");
        RowMessage publisherPhone = new RowMessage(agency.getPhoneNumber()+"\n","red");
        RowMessage receiveName = new RowMessage(thePackage.getReceiverName()+"\n","red");
        RowMessage receiveNumber = new RowMessage(thePackage.getReceiverPhoneNumber()+"\n","red");
        RowMessage receiveMessage = new RowMessage(thePackage.getMessage()+"\n","red");
        Map<String,RowMessage> agencyMessageMap = new HashMap<>();
        agencyMessageMap.put("publisherName",publisherName);
        agencyMessageMap.put("publisherPhone",publisherPhone);
        agencyMessageMap.put("receiveName",receiveName);
        agencyMessageMap.put("receiveNumber",receiveNumber);
        agencyMessageMap.put("receiveMessage",receiveMessage);
        agencyMessage.setData(agencyMessageMap);

        MessageUtil.postTemplate(delegateMessage);
        MessageUtil.postTemplate(agencyMessage);

        return new ResponseEntity<Void>(HttpStatus.OK);
    }
}
