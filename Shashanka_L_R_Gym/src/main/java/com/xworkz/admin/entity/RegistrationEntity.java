package com.xworkz.admin.entity;

import lombok.Data;

import javax.persistence.*;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

@Entity
@Data
@Table(name = "registration")
@NamedQuery(name = "getRegisteredListById", query = "SELECT r FROM RegistrationEntity r WHERE r.id = :id")
@NamedQuery(name = "GetRegisteredList", query = "SELECT e FROM RegistrationEntity e")
@NamedQuery(name = "getregistrationlistbyemailforuserlogin", query = "SELECT p FROM RegistrationEntity p WHERE p.email = :email")
@NamedQuery(name = "getRegistrationEntityCountByEmail", query = "SELECT COUNT(a) FROM RegistrationEntity a WHERE a.email = :email")

public class RegistrationEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(name = "Name")
    private String name;

    @Column(name = "Email")
    private String email;

    @Column(name = "Password")
    private String password;

    @Column(name = "Package")
    private String PackageName;

    @Column(name = "Trainer")
    private String trainer;

    @Column(name = "PhoneNumber")
    private String phoneNumber;

    @Column(name = "Amount")
    private double amount;

    @Column(name = "AmountPaid")
    private double amountpaid;

    @Column(name = "Discount")
    private double discount;

    @Column(name = "GymName")
    private String gymName;

    @Column(name = "Balance")
    private double balance;

    @Column(name = "Installment")
    private double installment;

    @Column(name = "RegisteredDate")
    private LocalDate date;

    @Column(name = "ImageFilePath")
    private String filePath;

    @Column(name = "Age")
    private String age;

    @Column(name = "Gender")
    private String gender;

    @Column(name = "DOB")
    private String dob;

    @Column(name ="EmergencyContactName")
    private String emName;

    @Column(name ="EmergencyContactNumber")
    private String emContact;

    @Column(name ="CurrentHeight")
    private String currentHeight;

    @Column(name ="CurrentWeight")
    private String currentWeight;

    @OneToMany(mappedBy = "registrationEntity", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<RegistrationupdatetrackdetailsEntity> followupDetails = new ArrayList<>();

}
