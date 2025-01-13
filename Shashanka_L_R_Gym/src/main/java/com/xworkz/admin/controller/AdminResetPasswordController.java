package com.xworkz.admin.controller;

import com.xworkz.admin.entity.AdminEntity;
import com.xworkz.admin.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Component
@RequestMapping("/")

public class AdminResetPasswordController {
@Autowired
AdminService adminService;
    AdminResetPasswordController()
    {
        System.out.println("AdminResetPasswordController Constructor created");
    }

    @PostMapping("/adminpasswordset")
    String resetPassword(String email, String newPassword) {

        AdminEntity entity = adminService.resetPassword(email, newPassword);
        if (entity != null) {
            return "adminworkspace";
        }
        return "setadminpassword";
    }

}
