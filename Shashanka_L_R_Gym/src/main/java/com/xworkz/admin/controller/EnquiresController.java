package com.xworkz.admin.controller;

import com.xworkz.admin.constants.StatusEnum;
import com.xworkz.admin.dto.EnquiresDTO;
import com.xworkz.admin.entity.AdminEntity;
import com.xworkz.admin.entity.EnquiryEntity;
import com.xworkz.admin.service.AdminService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@Component
@Slf4j
@RequestMapping("/")

public class EnquiresController {
    @Autowired
    AdminService adminService;
    AdminEntity adminEntity;
    private List<StatusEnum> statusref = new ArrayList<>(Arrays.asList(StatusEnum.values()));

    EnquiresController() {
        log.info("EnquiriesController Created");
    }

    @GetMapping("/enquiryAct")
    public String enquirylistforupdate(Model model) {
        model.addAttribute("listofstatus", statusref);
        return "enquiryForm";
    }

    @GetMapping("/enquiredlistviewing")
    public String enquirylistview(Model model) {
        List<EnquiryEntity> enquiryList = adminService.getAllEnquiries();
        model.addAttribute("enquiryList", enquiryList);
        return "enquirylistview";
    }

    @PostMapping("/enquirysave")
    public String onEnquiry(@Valid EnquiresDTO dto, Model model, HttpSession session) {
        model.addAttribute("listofstatus", statusref);
        AdminEntity loggedInAdmin = (AdminEntity) session.getAttribute("Loggedinadmin");
        String adminName = loggedInAdmin.getName();
        boolean save = adminService.saveEnquirydata(dto, adminName);
        if (save) {
            model.addAttribute("successMessage", "Enquiry details saved successfully.");
        } else {
            model.addAttribute("errorMessage", "Failed to save enquiry details. Please try again.");
        }

        return "enquiryForm";
    }

}
