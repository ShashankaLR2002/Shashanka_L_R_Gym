package com.xworkz.admin.service;

import com.xworkz.admin.dto.*;
import com.xworkz.admin.entity.*;
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
        String characters = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
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

        boolean issaved = adminRepository.saveRegisterdData(entity);
        if (issaved) {
            return saveRegEmail(entity.getId(), entity.getName(), entity.getEmail(), generatedPassword);
        }
        return false;
    }

    @Override
    public boolean saveRegEmail(int id, String name, String email, String generatedPassword) {
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
            message.setSubject("Registration Success");

            String emailContent = "<html><body>"
                    + "<h2>Dear " + name + ",</h2>"
                    + "<p>Thank you for your Registration</p>"
                    + "<p>Your Password is " + generatedPassword + "</p>"
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
    public List<EnquiryEntity> getFilteredEnquiries(String search) {
        return adminRepository.findFilteredEnquiries(search);
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
    public boolean updateregdata(int id, String trainer, String PackageName, double amountpaid, double balance) {
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
    public List<Followuptrackdetailsentity> getFollowupDetailsByEnquiryId(int enquiryId) {
        return adminRepository.getFollowupDetailsByEnquiryId(enquiryId);
    }

    @Override
    public long getCountofEmail(String email) {
        long count = adminRepository.getCountofEmail(email);

        if (count > 0) {

            System.out.println("Email exist" + email);
            return count;

        } else {

            return 0;
        }
    }

    @Override
    public long getCountofEmailforreg(String email) {
        long countForRegistration = adminRepository.getCountofEmailforreg(email);

        if (countForRegistration > 0) {

            System.out.println("Email exist" + email);
            return countForRegistration;

        } else {

            return 0;
        }
    }

    @Override
    public RegistrationEntity userLogin(String email, String password) {
        RegistrationEntity entity = adminRepository.findByEmailforuserlogin(email);
        if (entity == null) {
            return null;
        }
        if (password.equals(entity.getPassword())) {
            return entity;
        }

        return null;
    }

    @Override
    public boolean updateuserdetails(int loggedinuserid, UserDetailsDto userDetailsDto, String filePath) {
        RegistrationEntity registrationEntity = adminRepository.findregistrationbyid(loggedinuserid);
        if (registrationEntity != null) {

            registrationEntity.setName(userDetailsDto.getName());
            registrationEntity.setEmail(userDetailsDto.getEmail());
            registrationEntity.setPhoneNumber(userDetailsDto.getPhoneNumber());
            registrationEntity.setFilePath(filePath);
            registrationEntity.setAge(userDetailsDto.getAge());
            registrationEntity.setDob(userDetailsDto.getDob());
            registrationEntity.setCurrentHeight(userDetailsDto.getCurrentHeight());
            registrationEntity.setCurrentWeight(userDetailsDto.getCurrentWeight());
            registrationEntity.setEmName(userDetailsDto.getEmName());
            registrationEntity.setEmContact(userDetailsDto.getEmContact());
            registrationEntity.setGender(userDetailsDto.getGender());
            return adminRepository.updateUserdetails(registrationEntity);
        }
        return false;

    }

    @Override
    public boolean saveRegistrationupdatetrackdetails(RegistrationupdatetrackdetailsEntity registrationupdatetrackdetailsEntity) {
        return adminRepository.saveregistrationupdatetrackDetails(registrationupdatetrackdetailsEntity);
    }

    @Override
    public List<RegistrationupdatetrackdetailsEntity> getRegistartionDetailsByEnquiryId(int RegistrationID) {
        return adminRepository.getregupdatetrackDetailsByEnquiryId(RegistrationID);
    }


    @Override
    public boolean saveSlots(String startTimings, String endTimings, String duration) {

        SlotTimingsEntity entity = new SlotTimingsEntity();
        entity.setStartTimings(startTimings);
        entity.setEndTimings(endTimings);
        entity.setDuration(duration);
        return adminRepository.saveSlots(entity);

    }


    @Override
    public boolean savetrainerdetails(String name, String phoneNumber, String slotTimings) {

        TrainerinfoEntity entity = new TrainerinfoEntity();
        entity.setName(name);
        entity.setPhoneNumber(phoneNumber);
        entity.setSlotTimings(slotTimings);
        return adminRepository.savetrainerdetails(entity);
    }


    @Override
    public List<SlotTimingsEntity> getAllslots() {
        return adminRepository.findallslots();
    }


    @Override
    public List<TrainerinfoEntity> getAlltrainerdetails() {
        return adminRepository.findAlltrainerlist();
    }
}


