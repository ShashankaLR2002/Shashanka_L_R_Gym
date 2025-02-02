package com.xworkz.admin.controller;

import com.xworkz.admin.entity.EnquiryEntity;
import com.xworkz.admin.entity.Followuptrackdetailsentity;
import com.xworkz.admin.service.AdminService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDate;
import java.util.List;

@Slf4j
@Component
@RequestMapping("/")
public class FollowupsController {

    @Autowired
    private AdminService adminService;

    FollowupsController() {
        log.info("FollowupsController Created");
    }

    @GetMapping("/followupAct")
    public String onFollowupForm(Model model) {
        List<EnquiryEntity> enquiryList = adminService.getAllEnquiries();
        model.addAttribute("enquiryList", enquiryList);
        return "enquiryList";
    }

    @GetMapping("/enquirieslistact")
    public String showEnquiryList(@RequestParam(required = false) String search, Model model) {
        List<EnquiryEntity> enquiryList = adminService.getFilteredEnquiries(search);
        model.addAttribute("enquiryList", enquiryList);
        return "enquiryList";
    }

    @PostMapping("/updateStatus")
    public String updateStatusAndReason(@RequestParam int id, @RequestParam String status, @RequestParam String reason,
                                        Model model) {
        boolean updated = adminService.updateStatusAndReason(id, status, reason);
        if (updated) {
            model.addAttribute("successMessage", "Updated Successfully.");
            log.info("Updated successfully");
            Followuptrackdetailsentity followuptrackdetails = new Followuptrackdetailsentity();
            followuptrackdetails.setStatus(status);
            followuptrackdetails.setReason(reason);
            followuptrackdetails.setFollowedupdate(LocalDate.now());
            EnquiryEntity enquiry = adminService.getEnquiryById(id);
            if (enquiry != null) {
                followuptrackdetails.setEnquiryEntity(enquiry);
                boolean savedFollowUp = adminService.saveFollowuptrackdetails(followuptrackdetails);
                if (savedFollowUp) {
                    model.addAttribute("successMessage", "Details Updated successfully");
                } else {
                    model.addAttribute("errorMessage", "Failed to save followup details.");
                }

            } else {
                log.error("Enquiry not found for ID: ");
                model.addAttribute("errorMessage", "Enquiry not found.");
            }
        } else {

            log.error("Failed to update enquiry for ID:");
            model.addAttribute("errorMessage", "Failed to update enquiry.");
        }
        List<EnquiryEntity> enquiryList = adminService.getAllEnquiries();
        model.addAttribute("enquiryList", enquiryList);
        return "enquiryList";

    }

    @GetMapping("/showfollowupdetails")
    public String getFollowupDetailsByEnquiryId(@RequestParam int id, Model model) {
        List<Followuptrackdetailsentity> followupDetails = adminService.getFollowupDetailsByEnquiryId(id);
        model.addAttribute("followupDetails", followupDetails);
        return "followuptrackdetails";
    }
}
