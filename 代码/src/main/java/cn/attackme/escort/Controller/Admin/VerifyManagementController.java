package cn.attackme.escort.Controller.Admin;


import cn.attackme.Wechat.Util.MessageUtil;
import cn.attackme.escort.Model.*;
import cn.attackme.escort.Service.CreditRecordService;
import cn.attackme.escort.Service.SchoolService;
import cn.attackme.escort.Service.UserInfoService;
import cn.attackme.escort.Utils.ImageUtils;
import cn.attackme.escort.Utils.PageResults;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.List;

import static cn.attackme.escort.Utils.LogUtils.LogToDB;

/**
 * Created by Administrator on 2017/5/23.
 */
@Controller
@RequestMapping("/VerifyManagement")
public class VerifyManagementController {

    @Autowired
    private UserInfoService userInfoService;
    @Autowired
    private SchoolService schoolService;
    @Autowired
    private CreditRecordService creditRecordService;

    //页面
    @RequiresRoles("admin")
    @GetMapping("/")
    public String index(){
        return "Admin/VerifyManagement/index";
    }

    //分页获取审核中用户
    @RequiresRoles("admin")
    @ResponseBody
    @GetMapping("/userPageResults/school/{schoolId}/pageNumber/{pageNumber}/pageSize/{pageSize}")
    public PageResults<User> userPageResults(@PathVariable int schoolId,
                                             @PathVariable int pageNumber,
                                             @PathVariable int pageSize){
        School school=schoolService.getById(schoolId);
        PageResults<User> pageResults = userInfoService.getListPageByAuthStatus(Role.user, school, AuthStatus.审核中, pageNumber, pageSize);
        List<User> userList = pageResults.getResults();
        userList.stream().forEach(user -> {
            try {
                user.setNickName(URLDecoder.decode(user.getNickName(), "utf-8"));
            } catch (UnsupportedEncodingException e) {
                LogToDB(e);
            }
        });
        pageResults.setResults(userList);
        return pageResults;
    }

    //认证
    @RequiresRoles("admin")
    @PutMapping("/Author/userName/{userName}/isPass/{isPass}")
    public ResponseEntity<Void> Author(@PathVariable String userName,
                                       @PathVariable boolean isPass){
        User user = userInfoService.getById(userName);
        if(user!=null){
            if (isPass) {
                user.setAuthStatus(AuthStatus.已认证);
                user.setIntegration(user.getIntegration()+50);
                userInfoService.save(user);
                CreditRecord creditRecord = new CreditRecord(null, user, 50, CreditRecordDescription.完成认证);
                creditRecordService.save(creditRecord);
                MessageUtil.postTemplate(user.getOpenid(),"QWNFfg_U6M45WKOEFTNGZpvQZmFz7JNK6C4YroMETo4","/User/UserInfomation/",null);
                return new ResponseEntity<Void>(HttpStatus.OK);
            }else {
                user.setStuCardUrl(null);
                user.setAuthStatus(AuthStatus.未认证);
                userInfoService.save(user);
                MessageUtil.postTemplate(user.getOpenid(),"WGfq640oRdKmj8soG_ELosHGTE6GGwu4Hp29BTyU5ls","/User/UserInfomation/",null);
                return new ResponseEntity<Void>(HttpStatus.OK);
            }
        }else {
            return new ResponseEntity<Void>(HttpStatus.NOT_FOUND);
        }
    }

    //获取Img
    @RequiresRoles("admin")
    @ResponseBody
    @GetMapping("/CardImg/userName/{userName}")
    public String CardImg(@PathVariable String userName)throws IOException{
        User user = userInfoService.getById(userName);
        String userHome = System.getProperty("user.home");
        String fileSeparator = System.getProperty("file.separator");
        return ImageUtils.encodeImageToBase64(userHome+fileSeparator+"Images"+fileSeparator,user.getStuCardUrl());
    }
}


