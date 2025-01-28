package com.xworkz.admin.controller;

import com.xworkz.admin.constants.ImagePath;
import com.xworkz.admin.dto.UserDetailsDto;
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
import org.springframework.web.multipart.MultipartFile;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

@Slf4j
@Component
@RequestMapping("/")
public class UserprofileController {

    UserprofileController() {
        log.info("userloginController Created");
    }

    @Autowired
    AdminService adminService;


    @GetMapping("/userprofileact")
    String onProfile(HttpSession session)
    {
        return "Profile";
    }

    @PostMapping("/updateUserProfile")
    public String updateProfile(Model model, UserDetailsDto userDetailsDto, @RequestParam("Img") MultipartFile multipartFile, HttpSession httpSession) throws IOException {
        RegistrationEntity loggedInuserid = (RegistrationEntity) httpSession.getAttribute("Loggedinuser");
        int loggedinuserid = loggedInuserid.getId();

        String filePath = null;

        if (multipartFile != null && !multipartFile.isEmpty()) {
            byte[] bytes = multipartFile.getBytes();
            Path path = Paths.get(ImagePath.IMAGE_PATH.getPath() + System.currentTimeMillis() + ".jpg");
            Files.write(path, bytes);
            filePath = path.getFileName().toString();
        }

        boolean isUpdated = adminService.updateuserdetails(loggedinuserid,userDetailsDto, filePath);


        if (isUpdated) {
            log.info("Details Updated Successfully");
            httpSession.setAttribute("imageName", filePath);
            model.addAttribute("successMessage", "Profile updated successfully.");
            return "Profile";
        }

        log.error("Failed to update details");
        model.addAttribute("errorMessage", "Unable to update profile ");
        return "Profile";
    }

}
