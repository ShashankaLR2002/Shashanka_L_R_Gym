package com.xworkz.admin.controller;
import com.xworkz.admin.dto.RegistrationDTO;
import com.xworkz.admin.service.AdminService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
@Slf4j
@Component
@RequestMapping("/")
public class RegistrationController {
@Autowired
AdminService adminService;
    RegistrationController()
    {
        log.info("RegistrationController Created");
    }

    @GetMapping("/registrationAct")
    public String onRegistration() {
        return "registrationForm";
    }


    @PostMapping("/register")

    public String onRegister(RegistrationDTO dto, Model model)
    {
        Boolean save= adminService.saveRegistrationdata(dto);
       if(save){
               model.addAttribute("successMessage", "Registered successfully");
           } else {
               model.addAttribute("errorMessage", "Failed to Register");
           }
           return "registrationForm";
    }




}
