package com.xworkz.admin.controller;

import com.xworkz.admin.entity.RegistrationEntity;
import com.xworkz.admin.service.AdminService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import java.util.List;


@Slf4j
@Component
@RequestMapping("/")
public class UpdateController {
@Autowired
AdminService adminService;

    UpdateController()
    {
        log.info("UpdateController");
    }
    @GetMapping("/Regupdateact")

  public String regupdate(Model model)
    {
        List<RegistrationEntity> registrationEntityList = adminService.getAllRegistration();
        model.addAttribute("RegisteredList",registrationEntityList);
         return "update";
    }

@PostMapping("/Regdataupdateaction")
     public  String onregupdate(@RequestParam int id, @RequestParam String trainer, @RequestParam String PackageName, @RequestParam double amountpaid, @RequestParam double balance, Model model)
    {

        boolean updated = adminService.updateregdata(id, trainer,PackageName,amountpaid,balance);
        List<RegistrationEntity> registrationEntityList = adminService.getAllRegistration();

        if(updated)
        {
            model.addAttribute("successMessage", "Updated successfully");
            model.addAttribute("updatedId", id);
            model.addAttribute("RegisteredList",registrationEntityList);
            return "update";
        }
        return trainer;
    }
}
