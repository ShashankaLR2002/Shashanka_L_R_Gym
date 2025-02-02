package com.xworkz.admin.controller;

import com.xworkz.admin.entity.SlotTimingsEntity;
import com.xworkz.admin.service.AdminService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import java.util.List;

@Controller
@RequestMapping("/")
@Slf4j
public class SlotsTimingsController {
    @Autowired
    AdminService adminService;

    SlotsTimingsController() {
        log.info("TrainerAllotmentController Constructor");
    }

    @GetMapping("/AddSlotact")
    public String onslots(@RequestParam("startTimings") String startTimings, @RequestParam("endTimings") String endTimings,
                          @RequestParam("duration") String duration,
                          Model model) {
        boolean saved = adminService.saveSlots(startTimings, endTimings, duration);
        if (saved) {
            model.addAttribute("successMessage", "DetailsUpdatedSuccessfully");
            List<SlotTimingsEntity> slots = adminService.getAllslots();
            model.addAttribute("slots", slots);
            return "trainerslots";
        }
        model.addAttribute("errorMessage", "Failed ");
        return "trainerslots";
    }


}
