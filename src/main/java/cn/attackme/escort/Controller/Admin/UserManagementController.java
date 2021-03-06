package cn.attackme.escort.Controller.Admin;

import cn.attackme.escort.Model.AuthStatus;
import cn.attackme.escort.Model.Role;
import cn.attackme.escort.Model.School;
import cn.attackme.escort.Model.User;
import cn.attackme.escort.Service.SchoolService;
import cn.attackme.escort.Service.UserInfoService;
import cn.attackme.escort.Utils.PageResults;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.List;

import static cn.attackme.escort.Utils.LogUtils.LogToDB;

/**
 * Created by hujian on 2017/3/21.
 */
@Controller
@RequestMapping("/UserManagement")
public class UserManagementController {

    @Autowired
    private UserInfoService userInfoService;
    @Autowired
    private SchoolService schoolService;

    @RequiresRoles("admin")
    @GetMapping("/")
    public String index(){
        return "Admin/UserManagement/index";
    }

    //返回用户个人信息
    @ResponseBody
    @GetMapping("/UserInfo")
    public User getUserInfo(){
        final String userName= SecurityUtils.getSubject().getPrincipal().toString();
        return userInfoService.getById(userName);
    }

    //分页加载用户
    @RequiresRoles("admin")
    @ResponseBody
    @GetMapping("/userPageResults/school/{schoolId}/pageNumber/{pageNumber}/pageSize/{pageSize}")
    public PageResults<User> userPageResults(@PathVariable int pageNumber,
                                             @PathVariable int pageSize,
                                             @PathVariable int schoolId){
        School school = schoolService.getById(schoolId);
        PageResults<User> pageResults = userInfoService.getListPageByAuthStatus(Role.user, school, AuthStatus.已认证, pageNumber, pageSize);
        List<User> results = pageResults.getResults();
        results.stream().forEach(u ->{
            try {
                u.setNickName(URLDecoder.decode(u.getNickName(), "utf-8"));
            } catch (UnsupportedEncodingException e) {
                LogToDB(e);
            }
        });
        pageResults.setResults(results);
        return pageResults;
    }

    //获取全部学校
    @ResponseBody
    @GetMapping("/getSchoolList")
    public ResponseEntity<List<School>> getSchoolList(){
        List<School> schoolList=schoolService.getAll();
        return new ResponseEntity<>(schoolList, HttpStatus.OK);
    }

    //是否禁用用户
    @RequiresRoles("admin")
    @PutMapping("/disabledUser/userName/{userName}/stage/{stage}")
    public ResponseEntity<Void> disabledUser(@PathVariable String userName,
                                             @PathVariable boolean stage){
        User user = userInfoService.getById(userName);
        if(user!=null){
            if(stage){
                user.setDeleted(true);
                userInfoService.save(user);
            }else {
                user.setDeleted(false);
                userInfoService.save(user);
            }
            return new ResponseEntity<>(HttpStatus.OK);
        }else {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }

    }
}
