package com.xworkz.admin.service;

import com.xworkz.admin.dto.EnquiresDTO;
import com.xworkz.admin.dto.RegistrationDTO;
import com.xworkz.admin.entity.AdminEntity;
import com.xworkz.admin.entity.EnquiryEntity;
import com.xworkz.admin.entity.Followuptrackdetailsentity;
import com.xworkz.admin.entity.RegistrationEntity;

import java.time.LocalDate;
import java.util.List;

public interface AdminService {


    AdminEntity adminLogin(String email, String password);

    AdminEntity resetPassword(String email, String newPassword);

    boolean saveEnquirydata(EnquiresDTO dto,String adminName);

    List<EnquiryEntity> getAllEnquiries();

    EnquiryEntity getEnquiryById(int id);

    boolean updateStatusAndReason(int id, String status, String reason);

    public boolean saveEmail(String email, int Id,String name) ;

    boolean saveRegistrationdata(RegistrationDTO dto);

    public List<EnquiryEntity> getFilteredEnquiries(String search) ;

    public long getCountofName(String name) ;

  boolean updateregdata(int Registrationid,String PackageName, String trainer, double balance,double amountpaid);

    RegistrationEntity findregistrationbyid(int registrationId);
    public List<RegistrationEntity> getAllRegistration() ;
    public boolean saveFollowuptrackdetails(Followuptrackdetailsentity followuptrackdetailsentity) ;
        public List<Followuptrackdetailsentity> getFollowupDetailsByEnquiryId(int enquiryId) ;

        }
