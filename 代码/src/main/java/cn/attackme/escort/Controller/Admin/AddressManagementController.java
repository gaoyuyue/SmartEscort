package cn.attackme.escort.Controller.Admin;

import cn.attackme.escort.Model.Area;
import cn.attackme.escort.Model.School;
import cn.attackme.escort.Model.User;
import cn.attackme.escort.Service.AreaService;
import cn.attackme.escort.Service.SchoolService;
import cn.attackme.escort.Utils.PageResults;
import com.fasterxml.jackson.annotation.JsonTypeInfo;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.persistence.Id;
import java.util.List;

/**
 * 地址管理
 * Created by hujian on 2017/3/25.
 */
@Controller
@RequestMapping("/AddressManagement")
public class AddressManagementController {

    @Autowired
    private SchoolService schoolService;
    @Autowired
    private AreaService areaService;

    @GetMapping("/")
    public String index() {
        return "Admin/AddressManagement/index";
    }

    //分页获取全部地址
    @RequiresRoles("admin")
    @ResponseBody
    @GetMapping("/getAddressList/pageNumber/{pageNumber}/pageSize/{pageSize}")
    public PageResults<School> getAddressList(@PathVariable int pageNumber,
                                              @PathVariable int pageSize) {
        return schoolService.getListByPage(pageNumber, pageSize);
    }


    //删除Area
    @RequiresRoles("admin")
    @DeleteMapping("/deleteAreaBySchool/schoolId/{schoolId}/areaId/{areaId}")
    public ResponseEntity<Void> deleteAreaBySchool(@PathVariable int schoolId,
                                                   @PathVariable int areaId) {
        Area area = areaService.getById(areaId);
        School school = schoolService.getById(schoolId);
        if (area != null && school != null) {
            List<Area> areaList = school.getAreaList();
            if (areaList.contains(area)) {
                areaList.remove(area);
                schoolService.save(school);
                areaService.delete(area);
                return new ResponseEntity<>(HttpStatus.OK);
            } else {
                return new ResponseEntity<>(HttpStatus.NOT_MODIFIED);
            }
        }
        return new ResponseEntity<>(HttpStatus.NOT_FOUND);
    }

    //新增学校
    @RequiresRoles("admin")
    @PostMapping("/createSchool/schoolName/{schoolName}")
    public ResponseEntity<Void> createSchool(@PathVariable String schoolName){
        School school=new School(schoolName,null);
        schoolService.save(school);
        return new ResponseEntity<>(HttpStatus.CREATED);
    }



    //增加地址
    @RequiresRoles("admin")
    @PostMapping("/createArea/areaName/{areaName}/schoolId/{schoolId}")
    public ResponseEntity<Void> createArea(@PathVariable String areaName,
                                           @PathVariable int schoolId) {
        School school = schoolService.getById(schoolId);
        Area area = new Area(areaName,school);
        school.getAreaList().add(area);
        areaService.save(area);
        schoolService.save(school);
        return new ResponseEntity<>(HttpStatus.CREATED);
    }
}
