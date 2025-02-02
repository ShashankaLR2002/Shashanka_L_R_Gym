package com.xworkz.admin.controller;

import com.xworkz.admin.constants.StatusEnum;
import com.xworkz.admin.entity.SlotTimingsEntity;
import com.xworkz.admin.entity.TrainerinfoEntity;
import com.xworkz.admin.service.AdminService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@Slf4j
@Component
@RequestMapping("/")
public class TrainerAllotmentController {
    @Autowired
    AdminService adminService;

    TrainerAllotmentController() {
        log.info("TrainerAllotmentController Constructor");
    }

    @GetMapping("/trainersAllotmentact")
    public String ontrainermanage(Model model) {
        List<SlotTimingsEntity> slots = adminService.getAllslots();
        model.addAttribute("slots", slots);
        List<TrainerinfoEntity> trainerinfolist = adminService.getAlltrainerdetails();
        model.addAttribute("trainerInfoList", trainerinfolist);
        return "trainerslots";
    }


    @PostMapping("/trainerAddact")
    public String ontraineradd(@RequestParam("Name") String name, @RequestParam("phoneNumber") String phoneNumber,
                               @RequestParam("slotTimings") String slotTimings, Model model) {
        boolean saved = adminService.savetrainerdetails(name, phoneNumber, slotTimings);
        if (saved) {
            List<SlotTimingsEntity> slots = adminService.getAllslots();
            model.addAttribute("slots", slots);
            List<TrainerinfoEntity> trainerinfolist = adminService.getAlltrainerdetails();
            model.addAttribute("trainerInfoList", trainerinfolist);
            model.addAttribute("successMessage", "DetailsUpdatedSuccessfully");
            return "trainerslots";
        }
        model.addAttribute("errorMessage", "Failed ");
        return "trainerslots";
    }


}
