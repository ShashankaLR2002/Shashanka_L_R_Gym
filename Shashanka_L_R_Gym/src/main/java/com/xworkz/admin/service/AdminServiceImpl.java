package com.xworkz.admin.service;

import com.xworkz.admin.dto.EnquiresDTO;
import com.xworkz.admin.dto.RegistrationDTO;
import com.xworkz.admin.entity.AdminEntity;
import com.xworkz.admin.entity.EnquiryEntity;
import com.xworkz.admin.entity.Followuptrackdetailsentity;
import com.xworkz.admin.entity.RegistrationEntity;
import com.xworkz.admin.repository.AdminRepository;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Properties;
import java.util.Random;


@Slf4j
@Service
public class AdminServiceImpl implements AdminService {
    String generatedPassword;
    @Autowired
    AdminRepository adminRepository;
    AdminEntity adminEntity;
    private final BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();


    AdminServiceImpl() {
        log.info("AdminServiceImplConstructorCreated");
    }

    @Override
    public AdminEntity adminLogin(String email, String password) {

        AdminEntity entity = adminRepository.findByEmail(email);

        if (entity == null) {
            return null;
        }
        if (passwordEncoder.matches(password, entity.getPassword())) {
            adminRepository.update(entity);
            return entity;
        }

        if (entity.getLoginCount() == -1 && password.equals(entity.getPassword())) {
            return entity;
        }


        return null;
    }

    @Override
    public AdminEntity resetPassword(String email, String newPassword) {
        AdminEntity entity = adminRepository.findByEmail(email);
        if (entity != null && entity.getLoginCount() == -1) {
            String encryptedPassword = passwordEncoder.encode(newPassword);
            entity.setPassword(encryptedPassword);
            entity.setCreatedDate(LocalDateTime.now());
            entity.setLoginCount(0);
            adminRepository.update(entity);

            return entity;
        }
        return null;
    }

    @Override
    public boolean saveEnquirydata(EnquiresDTO dto, String adminName) {
        EnquiryEntity entity = new EnquiryEntity();
        entity.setName(dto.getName());
        entity.setEmail(dto.getEmail());
        entity.setArea(dto.getArea());
        entity.setPhonenumber(dto.getPhonenumber());
        entity.setDistance(dto.getDistance());
        entity.setAge(dto.getAge());
        entity.setEnquireddate(LocalDate.now());
        entity.setEnquiredby(adminName);

        boolean isSaved = adminRepository.saveEnquiriesData(entity);
        if (isSaved) {
            return saveEmail(entity.getEmail(), entity.getId(), entity.getName());
        }
        return false;
    }

    @Override
    public List<EnquiryEntity> getAllEnquiries() {
        return adminRepository.findAllEnquiries();
    }

    @Override
    public EnquiryEntity getEnquiryById(int id) {
        return adminRepository.findEnquiryById(id);
    }

    @Override
    public boolean updateStatusAndReason(int id, String status, String reason) {
        EnquiryEntity entity = adminRepository.findEnquiryById(id);
        if (entity != null) {
            entity.setStatus(status);
            entity.setReason(reason);
            entity.setFollowedupdate(LocalDate.now());
            return adminRepository.update(entity);
        }
        return false;
    }

    @Override
    public boolean saveEmail(String email, int id, String name) {
        final String username = "lrshashank2002@gmail.com";
        final String userPassword = "xrlc rqiv zsus wcnx";

        Properties prop = new Properties();
        prop.put("mail.smtp.host", "smtp.gmail.com");
        prop.put("mail.smtp.port", "587");
        prop.put("mail.smtp.auth", "true");
        prop.put("mail.smtp.starttls.enable", "true");

        Session session = Session.getInstance(prop, new javax.mail.Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(username, userPassword);
            }
        });

        try {
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(username));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(email));
            message.setSubject("Thank you for your Enquiry");

            String emailContent = "<html><body>"
                    + "<h2>Dear " + name + ",</h2>"
                    + "<p>Thank you for your enquiry</p>"
                    + "</body></html>";

            message.setContent(emailContent, "text/html");

            Transport.send(message);

            return true;
        } catch (MessagingException e) {
            log.info("Error sending email: " + e.getMessage());
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public boolean saveRegistrationdata(RegistrationDTO dto) {
        StringBuilder sb = new StringBuilder();
        int length = 6;
        String characters = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789!@#$%^&*()-_=+";
        Random random = new Random();

        for (int i = 0; i < length; i++) {
            int index = random.nextInt(characters.length());
            sb.append(characters.charAt(index));
        }

        generatedPassword = sb.toString();
        log.info("Generated password: " + generatedPassword);

        RegistrationEntity entity = new RegistrationEntity();
        entity.setName(dto.getName());
        entity.setEmail(dto.getEmail());
        entity.setPhoneNumber(dto.getPhoneNumber());
        entity.setAmount(dto.getAmount());
        entity.setAmountpaid(dto.getAmountpaid());
        entity.setPassword(generatedPassword);
        entity.setBalance(dto.getBalance());
        entity.setDiscount(dto.getDiscount());
        entity.setGymName(dto.getGymName());
        entity.setPackageName(dto.getPackageName());
        entity.setInstallment(dto.getInstallment());
        entity.setTrainer(dto.getTrainer());
        entity.setDate(LocalDate.now());

        return adminRepository.saveRegisterdData(entity);
    }

    @Override
    public List<EnquiryEntity> getFilteredEnquiries(String search) {
        return adminRepository.findFilteredEnquiries(search);
    }

    @Override
    public long getCountofName(String name) {
        long count = adminRepository.getCountofName(name);

        if (count > 0) {
            System.out.println("Name exists: " + name);

        } else {
            return 0;
        }

        return count;
    }

    @Override
    public RegistrationEntity findregistrationbyid(int Id) {

        return adminRepository.findregistrationbyid(Id);
    }

    @Override
    public List<RegistrationEntity> getAllRegistration() {
        return adminRepository.findallregistration();
    }

    @Override
    public boolean updateregdata(int id, String trainer,String PackageName, double amountpaid, double balance) {
        RegistrationEntity entity = adminRepository.findregistrationbyid(id);
        if (entity != null) {
            entity.setPackageName(PackageName);
            entity.setTrainer(trainer);
            entity.setAmountpaid(amountpaid);
            entity.setBalance(balance);
            return adminRepository.updateregdata(entity);
        }
        return false;
    }

    @Override
    public boolean saveFollowuptrackdetails(Followuptrackdetailsentity followuptrackdetailsentity) {
        return adminRepository.saveFollowupDetails(followuptrackdetailsentity);
    }
    @Override
    public List<Followuptrackdetailsentity> getFollowupDetailsByEnquiryId(int enquiryId)
    {
        return adminRepository.getFollowupDetailsByEnquiryId(enquiryId);
    }

}
