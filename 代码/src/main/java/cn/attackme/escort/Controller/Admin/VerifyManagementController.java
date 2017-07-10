package cn.attackme.escort.Controller.Admin;


import cn.attackme.Wechat.Message.LinkMessage;
import cn.attackme.Wechat.Message.RowMessage;
import cn.attackme.Wechat.Message.TemplateMessage;
import cn.attackme.Wechat.Util.MessageUtil;
import cn.attackme.Wechat.Util.WechatProperties;
import cn.attackme.escort.Model.Role;
import cn.attackme.escort.Model.School;
import cn.attackme.escort.Model.User;
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
import java.util.HashMap;
import java.util.Map;

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

    //页面
    @RequiresRoles("admin")
    @GetMapping("/")
    public String index(){
        return "Admin/VerifyManagement/index";
    }

    //分页获取未认证用户
    @RequiresRoles("admin")
    @ResponseBody
    @GetMapping("/userPageResults/school/{schoolId}/pageNumber/{pageNumber}/pageSize/{pageSize}")
    public PageResults<User> userPageResults(@PathVariable int schoolId,
                                             @PathVariable int pageNumber,
                                             @PathVariable int pageSize){
        School school=schoolService.getById(schoolId);
        return userInfoService.getListPageByUrlAndAuth(Role.user,school,false,pageNumber,pageSize);
    }

    //认证
    @RequiresRoles("admin")
    @PutMapping("/Author/userName/{userName}/isPass/{isPass}")
    public ResponseEntity<Void> Author(@PathVariable String userName,
                                       @PathVariable boolean isPass){
        User user = userInfoService.getById(userName);
        if(user!=null){
            if (isPass) {
                user.setAuthed(true);
                userInfoService.save(user);
                //发送消息给用户
                String foreUrl = WechatProperties.authorizeUrl+"?appid="+
                        WechatProperties.appid+
                        "&redirect_uri="+
                        WechatProperties.OAuth2Url+
                        "&response_type=code&scope=snsapi_base&state=";
                String backUrl = "#wechat_redirect";
                TemplateMessage authoredMessage = new TemplateMessage();
                authoredMessage.setTouser(user.getOpenid());
                authoredMessage.setTemplate_id("QWNFfg_U6M45WKOEFTNGZpvQZmFz7JNK6C4YroMETo4");
                authoredMessage.setUrl(foreUrl+"/User/UserInfomation/"+backUrl);
                MessageUtil.postTemplate(authoredMessage);
                return new ResponseEntity<Void>(HttpStatus.OK);
            }else {
                user.setStuCardUrl(null);
                userInfoService.save(user);
                //发送消息给用户
                String foreUrl = WechatProperties.authorizeUrl+"?appid="+
                        WechatProperties.appid+
                        "&redirect_uri="+
                        WechatProperties.OAuth2Url+
                        "&response_type=code&scope=snsapi_base&state=";
                String backUrl = "#wechat_redirect";
                TemplateMessage authoredMessage = new TemplateMessage();
                authoredMessage.setTouser(user.getOpenid());
                authoredMessage.setTemplate_id("w_wsVvI8hOFlnSYvetbiJZZ3NkM_BuI0RkUnIyL6XPs");
                authoredMessage.setUrl(foreUrl+"/User/UserInfomation/"+backUrl);
                MessageUtil.postTemplate(authoredMessage);
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


