package com.xworkz.admin.restcontroller;

import com.xworkz.admin.entity.EnquiryEntity;
import com.xworkz.admin.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/")
public class Restcontroller {
@Autowired
AdminService adminService;

    @GetMapping(value = "/name/{name}", produces = MediaType.APPLICATION_JSON_VALUE)
    public String onName(@PathVariable String name, Model model) {
        long count = adminService.getCountofName(name);

        if (count > 0) {
            model.addAttribute("disp", "Name already Exist");
            return "Name already exist";
        } else {
            System.out.println("Name does not exist: " + name);
            return "  ";
        }
    }
}
