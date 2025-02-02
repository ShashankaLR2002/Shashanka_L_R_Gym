package com.xworkz.admin.controller;

import com.xworkz.admin.entity.AdminEntity;
import com.xworkz.admin.service.AdminService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Slf4j
@Component
@RequestMapping("/")

public class AdminResetPasswordController {
    @Autowired
    AdminService adminService;

    AdminResetPasswordController() {
        AdminResetPasswordController.log.info("AdminResetPasswordController Constructor created");
    }

    @PostMapping("/adminpasswordset")
    String resetPassword(String email, String newPassword) {
        AdminEntity entity = adminService.resetPassword(email, newPassword);
        if (entity != null) {
            return "adminDashboard";
        }
        return "setadminpassword";
    }

}
