package cn.attackme.escort.Controller.Admin;

import cn.attackme.escort.Model.Standard;
import cn.attackme.escort.Service.StandardService;
import cn.attackme.escort.Utils.PageResults;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

/**
 * Created by hujian on 2017/4/25.
 */

@Controller
@RequestMapping("/StandardManagement")
public class StandardManagementController {

    @Autowired
    StandardService standardService;

    @RequiresRoles("admin")
    @GetMapping("/")
    public String index() {
        return "Admin/StandardManagement/index";
    }

    //分页获取标准
    @RequiresRoles("admin")
    @ResponseBody
    @GetMapping("/getStandardList/pageNumber/{pageNumber}/pageSize/{pageSize}")
    public PageResults<Standard> getStandardList(@PathVariable int pageNumber, @PathVariable int pageSize) {
        return standardService.getListByPage(pageNumber, pageSize);
    }

    //新增标准
    @RequiresRoles("admin")
    @ResponseBody
    @PostMapping("/createStandard")
    public ResponseEntity<Void> createStandard(@RequestBody Standard standard) {
        System.out.println(standard);
        if (standard == null) {
            return new ResponseEntity<Void>(HttpStatus.NOT_FOUND);
        } else {
            standardService.save(standard);
            return new ResponseEntity<Void>(HttpStatus.CREATED);
        }
    }

    //修改标准
    @RequiresRoles("admin")
    @ResponseBody
    @PutMapping("/updateStandard")
    public ResponseEntity<Void> updateStandard(@RequestBody Standard standard) {
        if (standard == null) {
            return new ResponseEntity<Void>(HttpStatus.NOT_FOUND);
        } else {
            standardService.saveOrUpdate(standard);
            return new ResponseEntity<Void>(HttpStatus.OK);
        }
    }

    //删除标准
    @RequiresRoles("admin")
    @DeleteMapping("deleteStandard/standardId/{standardId}")
    public ResponseEntity<Void> deleteStandard(@PathVariable int standardId){
         if (standardService.getById(standardId)==null){
             return new ResponseEntity<Void>(HttpStatus.NOT_FOUND);
         }else {
             standardService.deleteById(standardId);
             return new ResponseEntity<Void>(HttpStatus.OK);
         }

    }
}
