package cn.attackme.escort.Controller.User;

import com.mysql.cj.api.Session;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.Date;

/**
 * Created by Administrator on 2017/5/23.
 */
@Controller
@RequestMapping("/User/StudentVerify")
public class StudentVerifyController {
    @GetMapping("/")
    public String index(){return "User/StudentVerify/index" ;}

    @RequestMapping("/upLoad")
    public String upLoad(MultipartFile uploadFile, HttpSession session)throws Exception{
//
//       if (uploadFile.getSize()>0){
//            String fileName=uploadFile.getOriginalFilename();
//            String suffix=session.getServletContext().getRealPath("/VerifyPics");
//           File file=new File(suffix,fileName);
//           uploadFile.transferTo(file);
//       }
       return "User/PersonalCenter/index";
    }


}


