package com.xworkz.admin.entity;

import lombok.Data;

import javax.persistence.*;
@Data
@Entity
@Table(name = "admin")
@NamedQuery(name = "getPersonEntitylistbyemailforResetpassword", query = "SELECT p FROM AdminEntity p WHERE p.email = :email")

public class AdminEntity extends AbstractAuditEntity{
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(name = "Email")
    private String email;

    @Column(name = "Name")
    private String name;

    @Column(name = "Password")
    private String password;

    @Column(name = "Logincount")
    private int loginCount;



}
