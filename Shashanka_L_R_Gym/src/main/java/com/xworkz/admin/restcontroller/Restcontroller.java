package com.xworkz.admin.restcontroller;

import com.xworkz.admin.service.AdminService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@Slf4j
@RestController
@RequestMapping("/")
public class Restcontroller {

    @Autowired
    private AdminService adminService;

    @GetMapping(value = "/email/{email}", produces = MediaType.APPLICATION_JSON_VALUE)
    public String onEmail(@PathVariable String email) {
        long count = adminService.getCountofEmail(email);
        long countForRegistration = adminService.getCountofEmailforreg(email);

        if (count > 0) {
            return "";
        }

        if (countForRegistration > 0) {
            log.info("Email exists");
            return "Email Already exists";
        }

        log.info("Email does not exist: " + email);
        return "";

    }
}