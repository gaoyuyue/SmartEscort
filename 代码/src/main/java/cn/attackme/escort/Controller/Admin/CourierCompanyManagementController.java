package cn.attackme.escort.Controller.Admin;

import cn.attackme.escort.Model.CourierCompany;
import cn.attackme.escort.Service.CourierCompanyService;
import cn.attackme.escort.Utils.PageResults;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;

import static java.util.stream.Collectors.toList;

/**
 * 快递类型管理
 * Created by hujian on 2017/3/25.
 */
@Controller
@RequestMapping("/CourierCompanyManagement")
public class CourierCompanyManagementController {

    @Autowired
    private CourierCompanyService courierCompanyService;

    @RequiresRoles("admin")
    @GetMapping("/")
    public String index(){
        return "Admin/CourierCompanyManagement/index";
    }

    //分页
    @RequiresRoles("admin")
    @ResponseBody
    @GetMapping("/getCourierCompanyList/pageNumber/{pageNumber}/pageSize/{pageSize}")
    public PageResults<CourierCompany> getCourierCompanyList(@PathVariable int pageNumber,
                                                             @PathVariable int pageSize){
        return courierCompanyService.getListByPage(pageNumber,pageSize);
    }

    //新增
    @RequiresRoles("admin")
    @PostMapping("/createCourier/companyName/{companyName}")
    public ResponseEntity<Void> createCourier(@PathVariable String companyName){
        CourierCompany courierCompany=new CourierCompany(companyName);
        courierCompanyService.save(courierCompany);
        return new ResponseEntity<>(HttpStatus.OK);
    }

    //修改
    @RequiresRoles("admin")
    @PutMapping("/updateCourierCompany/id/{id}/updateDescription/{updateDescription}")
    public ResponseEntity<Void> updateCourierCompany(@PathVariable int id,
                                                     @PathVariable String updateDescription){
        CourierCompany courierCompany = courierCompanyService.getById(id);
        if(courierCompany==null){
            return new ResponseEntity<Void>(HttpStatus.NOT_FOUND);
        }else {
            courierCompany.setCompanyName(updateDescription);
            courierCompanyService.save(courierCompany);
            return new ResponseEntity<>(HttpStatus.OK);
        }
    }

    //删除
    @RequiresRoles("admin")
    @DeleteMapping("/deleteCourierCompany/id/{id}")
    public ResponseEntity<Void> deleteCourierCompany(@PathVariable int id){
        if(courierCompanyService.getById(id)==null){
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }else {
            courierCompanyService.deleteById(id);
            return new ResponseEntity<>(HttpStatus.OK);
        }

    }

    //获取快递类型
    @RequiresRoles("admin")
    @ResponseBody
    @GetMapping("/courierList")
    public ResponseEntity<List<CourierCompany>> courierList(){
        List<CourierCompany> stringList = courierCompanyService.getAll();
        return new ResponseEntity<List<CourierCompany>>(stringList,HttpStatus.OK);
    }
}
