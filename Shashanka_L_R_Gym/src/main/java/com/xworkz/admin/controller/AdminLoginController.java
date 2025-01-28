package com.xworkz.admin.controller;

import com.xworkz.admin.entity.AdminEntity;
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
public class AdminLoginController {
    AdminLoginController() {
       log.info ("AdminLoginController Created");
    }

    @Autowired
    AdminService adminService;

    @PostMapping("/adminlogin")
    String onlogin(String email, String password, HttpSession session) {
        AdminEntity entity = adminService.adminLogin(email, password);

        if (entity == null) {
            return "index";
        }
        if (entity.getLoginCount() == -1) {
            session.setAttribute("Loggedinadmin", entity);
            return "setadminpassword";
        }
        if (entity.getLoginCount() == 0) {
            session.setAttribute("Loggedinadmin", entity);
            return "adminDashboard";
        }
        return "adminDashboard";
    }
}
