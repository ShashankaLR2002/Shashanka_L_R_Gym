package com.xworkz.admin.repository;

import com.xworkz.admin.entity.AdminEntity;

public interface AdminRepository {

    AdminEntity findByEmail(String email) ;
    boolean update(AdminEntity entity);




    }
