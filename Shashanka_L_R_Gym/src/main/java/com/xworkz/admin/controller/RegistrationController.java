package com.xworkz.admin.controller;
import com.xworkz.admin.dto.RegistrationDTO;
import com.xworkz.admin.entity.RegistrationEntity;
import com.xworkz.admin.entity.RegistrationupdatetrackdetailsEntity;
import com.xworkz.admin.service.AdminService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import javax.servlet.http.HttpSession;
import java.util.List;

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


    @GetMapping("/showregupdetails")
    public String getregupdateDetailsByEnquiryId(@RequestParam int id, Model model) {
        List<RegistrationupdatetrackdetailsEntity> regupdetails = adminService.getRegistartionDetailsByEnquiryId(id);
        model.addAttribute("regupDetails", regupdetails);
        return "registrationupdatetrackdetails";
    }

    @GetMapping("/viewdetails")
    public String viewregupdateDetailsByEnquiryId(Model model, HttpSession httpSession) {
        RegistrationEntity loggedInuserid = (RegistrationEntity) httpSession.getAttribute("Loggedinuser");

        int id = loggedInuserid.getId();

        List<RegistrationupdatetrackdetailsEntity> regupdetails = adminService.getRegistartionDetailsByEnquiryId(id);
        model.addAttribute("regupDetails", regupdetails);
        return "viewdetails";
    }
}
