package com.xworkz.admin.entity;

import lombok.Data;

import javax.persistence.*;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "enquires")
@Data
@NamedQuery(name = "GetEnquiredList", query = "SELECT e FROM EnquiryEntity e")
@NamedQuery(name = "getEnquiredListById", query = "SELECT p FROM EnquiryEntity p WHERE p.id = :id")
@NamedQuery(name = "GetEnquiredListForSorting", query = "SELECT e FROM EnquiryEntity e WHERE " + "CAST(e.id AS string) LIKE :search OR " + "e.name LIKE :search OR " + "e.phonenumber LIKE :search OR " +
        "e.area LIKE :search OR " +
        "e.enquireddate LIKE :search OR " +
        "e.enquiredby LIKE :search OR " +
        "e.status LIKE :search")

@NamedQuery(name = "getEnquiryEntitycountbyname", query = "SELECT COUNT(e) FROM EnquiryEntity e WHERE e.name = :name")

public class EnquiryEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(name = "Name")
    private String name;

    @Column(name = "Email")
    private String email;

    @Column(name = "Area")
    private String area;

    @Column(name = "PhoneNumber")
    private long phonenumber;

    @Column(name = "Distance")
    private double distance;

    @Column(name = "Age")
    private int age;

    @Column(name = "Status")
    private String status;

    @Column(name = "Reason")
    private String reason;

    @Column(name = "EnquiredBy")
    private String enquiredby;

    @Column(name = "EnquiredDate")
    private LocalDate enquireddate;

    @Column(name = "Followedupdate")
    private LocalDate followedupdate;

    @OneToMany(mappedBy = "enquiryEntity", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<Followuptrackdetailsentity> followupDetails = new ArrayList<>();


}
