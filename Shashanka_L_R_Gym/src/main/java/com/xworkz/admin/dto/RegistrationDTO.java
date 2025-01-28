package com.xworkz.admin.dto;

import lombok.Data;

@Data
public class RegistrationDTO {

    private String name;

    private String email;

    private String PackageName;

    private String trainer;

    private String phoneNumber;

    private double amount;

    private double amountpaid;

    private double discount;

    private String gymName;

    private double balance;

    private double installment;
}
