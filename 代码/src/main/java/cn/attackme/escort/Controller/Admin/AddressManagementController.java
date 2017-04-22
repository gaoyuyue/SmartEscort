package cn.attackme.escort.Controller.Admin;

import cn.attackme.escort.Model.Area;
import cn.attackme.escort.Model.School;
import cn.attackme.escort.Service.AreaService;
import cn.attackme.escort.Service.SchoolService;
import cn.attackme.escort.Utils.PageResults;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

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

    @RequiresRoles("admin")
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
                areaService.delete(area);
                schoolService.save(school);
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

    //新增区域
    @RequiresRoles("admin")
    @PostMapping("/createArea/areaName/{areaName}/schoolId/{schoolId}")
    public ResponseEntity<Void> createArea(@PathVariable String areaName,
                                           @PathVariable int schoolId){
        School school = schoolService.getById(schoolId);
        Area area=new Area(areaName,school);
        areaService.save(area);
        if(school==null){
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }else {
            school.getAreaList().add(area);
            schoolService.save(school);
            return new ResponseEntity<>(HttpStatus.CREATED);
        }
    }
}
