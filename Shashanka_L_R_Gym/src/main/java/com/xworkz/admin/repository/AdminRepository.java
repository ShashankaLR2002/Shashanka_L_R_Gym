package com.xworkz.admin.repository;

import com.xworkz.admin.entity.AdminEntity;
import com.xworkz.admin.entity.EnquiryEntity;
import com.xworkz.admin.entity.Followuptrackdetailsentity;
import com.xworkz.admin.entity.RegistrationEntity;
import net.bytebuddy.asm.Advice;

import java.time.LocalDate;
import java.util.List;

public interface AdminRepository {

    AdminEntity findByEmail(String email) ;
    boolean update(AdminEntity entity);
    boolean saveEnquiriesData (EnquiryEntity entity);
    List<EnquiryEntity> findAllEnquiries();
    public EnquiryEntity findEnquiryById(int enquiryId) ;
    boolean update(EnquiryEntity entity);
    boolean saveRegisterdData (RegistrationEntity entity);
    public List<EnquiryEntity> findFilteredEnquiries(String search) ;
    public long getCountofName(String name);
    public boolean updateregdata(RegistrationEntity entity);
    RegistrationEntity findregistrationbyid(int registrationId);
    List<RegistrationEntity>findallregistration();
    public boolean saveFollowupDetails(Followuptrackdetailsentity followuptrackdetailsentity) ;
        public List<Followuptrackdetailsentity> getFollowupDetailsByEnquiryId(int enquiryId) ;

    }
