package com.xworkz.admin.entity;

import lombok.Data;

import javax.persistence.*;
import java.time.LocalDate;

@Entity
@Data
@Table(name = "registration")
@NamedQuery(name = "getRegisteredListById", query = "SELECT r FROM RegistrationEntity r WHERE r.id = :id")
@NamedQuery(name = "GetRegisteredList", query = "SELECT e FROM RegistrationEntity e")
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


}
