package com.xworkz.admin.service;

import com.xworkz.admin.entity.AdminEntity;

public interface AdminService {


AdminEntity adminLogin(String email,String password);
public AdminEntity resetPassword(String email, String newPassword) ;

}
