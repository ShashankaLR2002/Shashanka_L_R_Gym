package com.xworkz.admin.service;

import com.xworkz.admin.dto.*;
import com.xworkz.admin.entity.*;

import java.util.List;

public interface AdminService {

    AdminEntity adminLogin(String email, String password);

    AdminEntity resetPassword(String email, String newPassword);

    boolean saveEnquirydata(EnquiresDTO dto, String adminName);

    List<EnquiryEntity> getAllEnquiries();

    EnquiryEntity getEnquiryById(int id);

    boolean updateStatusAndReason(int id, String status, String reason);

    public boolean saveEmail(String email, int Id, String name);

    boolean saveRegistrationdata(RegistrationDTO dto);

    public List<EnquiryEntity> getFilteredEnquiries(String search);

    boolean updateregdata(int Registrationid, String PackageName, String trainer, double balance, double amountpaid);

    RegistrationEntity findregistrationbyid(int registrationId);

    public List<RegistrationEntity> getAllRegistration();

    public boolean saveFollowuptrackdetails(Followuptrackdetailsentity followuptrackdetailsentity);

    public List<Followuptrackdetailsentity> getFollowupDetailsByEnquiryId(int enquiryId);

    public long getCountofEmail(String email);

    public long getCountofEmailforreg(String email);

    public boolean saveRegEmail(int id, String name, String email, String generatedPassword);

    RegistrationEntity userLogin(String email, String password);

    public boolean updateuserdetails(int loggedinuserid, UserDetailsDto userDetailsDto, String filePath);

    public boolean saveRegistrationupdatetrackdetails(RegistrationupdatetrackdetailsEntity registrationupdatetrackdetailsEntity);

    public List<RegistrationupdatetrackdetailsEntity> getRegistartionDetailsByEnquiryId(int RegistrationID);

    public boolean saveSlots(String startTimings, String endTimings, String duration);

    public boolean savetrainerdetails(String name, String phoneNumber, String slotTimings);

    public List<SlotTimingsEntity> getAllslots();

    public List<TrainerinfoEntity> getAlltrainerdetails();


}
