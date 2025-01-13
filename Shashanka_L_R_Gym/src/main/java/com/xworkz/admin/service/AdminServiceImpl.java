package com.xworkz.admin.service;

import com.xworkz.admin.entity.AdminEntity;
import com.xworkz.admin.repository.AdminRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;

@Service
public class AdminServiceImpl implements AdminService {
    @Autowired
    AdminRepository adminRepository;
    private final BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();


    AdminServiceImpl() {
        System.out.println("AdminServiceImplConstructorCreated");
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

}
