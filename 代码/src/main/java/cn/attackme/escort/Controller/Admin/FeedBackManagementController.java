package cn.attackme.escort.Controller.Admin;

import cn.attackme.escort.Model.Feedback;
import cn.attackme.escort.Service.FeedBackService;
import cn.attackme.escort.Utils.PageResults;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

/**
 * Created by Administrator on 2017/4/26.
 */
@Controller
@RequestMapping("/FeedBackManagement")
public class FeedBackManagementController {
    @Autowired
    private FeedBackService feedBackService;

    @RequiresRoles("admin")
    @GetMapping("/")
    public String index(){return "Admin/FeedBackManagement/index";}

//获取
    @RequiresRoles("admin")
    @ResponseBody
    @GetMapping("/getFeedBack/pageNumber/{pageNumber}/pageSize/{pageSize}")
    public PageResults<Feedback> getFeedBack(@PathVariable int pageNumber,
                                                @PathVariable int pageSize){
        return feedBackService.getListByPage(pageNumber,pageSize);
    }
//删除
    @RequiresRoles("admin")
    @DeleteMapping("/deleteFeedBack/id/{id}")
    public ResponseEntity<Void> deleteFeedBack(@PathVariable int id){
        if (feedBackService.getById(id)==null){
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }else {
            feedBackService.deleteById(id);
            return new ResponseEntity<>(HttpStatus.OK);
        }
    }

}
