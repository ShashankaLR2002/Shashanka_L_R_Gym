package com.xworkz.admin.controller;
import com.xworkz.admin.entity.RegistrationEntity;
import com.xworkz.admin.service.AdminService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import javax.servlet.http.HttpSession;

@Slf4j
@Component
@RequestMapping("/")
public class UserloginController {

    UserloginController() {
        log.info("userloginController Created");
    }

    @Autowired
    AdminService adminService;

    @PostMapping("/userlogin")
    String onlogin(String email, String password, HttpSession session) {
        RegistrationEntity entity = adminService.userLogin(email, password);

        if (entity == null) {
            return "userlogin";
        }
        if (entity != null) {
            session.setAttribute("Loggedinuser",entity);
            log.info("Loggedin");
            String filePath = entity.getFilePath() != null ? entity.getFilePath() : "default.jpg";
            session.setAttribute("imageName", filePath);
            return "userprofileDashBoard";
        }
        return "userlogin";
    }

}
