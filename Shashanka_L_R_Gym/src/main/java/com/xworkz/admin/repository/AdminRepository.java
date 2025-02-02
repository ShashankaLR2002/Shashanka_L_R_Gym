package com.xworkz.admin.repository;

import com.xworkz.admin.entity.*;

import java.util.List;

public interface AdminRepository {

    AdminEntity findByEmail(String email);

    boolean update(AdminEntity entity);

    boolean saveEnquiriesData(EnquiryEntity entity);

    List<EnquiryEntity> findAllEnquiries();

    public EnquiryEntity findEnquiryById(int enquiryId);

    boolean update(EnquiryEntity entity);

    boolean saveRegisterdData(RegistrationEntity entity);

    public List<EnquiryEntity> findFilteredEnquiries(String search);

    public boolean updateregdata(RegistrationEntity entity);

    RegistrationEntity findregistrationbyid(int registrationId);

    List<RegistrationEntity> findallregistration();

    public boolean saveFollowupDetails(Followuptrackdetailsentity followuptrackdetailsentity);

    public List<Followuptrackdetailsentity> getFollowupDetailsByEnquiryId(int enquiryId);

    public long getCountofEmail(String email);

    public long getCountofEmailforreg(String email);

    RegistrationEntity findByEmailforuserlogin(String email);

    public boolean updateUserdetails(RegistrationEntity entity);

    RegistrationEntity findbyidforupdateuserprofile(long loggedinuserid);

    public boolean saveregistrationupdatetrackDetails(RegistrationupdatetrackdetailsEntity registrationupdatetrackdetailsEntity);

    public List<RegistrationupdatetrackdetailsEntity> getregupdatetrackDetailsByEnquiryId(int enquiryId);

    public boolean saveSlots(SlotTimingsEntity slotTimings);

    public boolean savetrainerdetails(TrainerinfoEntity trainerinfoEntity);

    List<SlotTimingsEntity> findallslots();

    List<TrainerinfoEntity> findAlltrainerlist();


}

