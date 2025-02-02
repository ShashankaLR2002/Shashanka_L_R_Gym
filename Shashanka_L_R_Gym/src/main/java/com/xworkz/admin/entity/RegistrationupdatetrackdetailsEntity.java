package com.xworkz.admin.entity;
import lombok.Data;
import javax.persistence.*;
import java.time.LocalDate;

@Entity
@Table(name = "registrationupdatetrackdetails")
@Data
@NamedQuery(name = "GetRegistrationTrackdetailsByEnquiryId", query = "SELECT R FROM RegistrationupdatetrackdetailsEntity R WHERE R.registrationEntity.id = :id")
        public class RegistrationupdatetrackdetailsEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_up")
    private int id;

    @Column(name = "Package")
    private String PackageName;

    @Column(name = "Trainer")
    private String trainer;

    @Column(name ="Amount")
    private double amount;

    @Column(name ="AmountPaid")
    private double amountPaid;

    @Column(name ="Balance")
    private double balance;

    @Column(name ="RegistrationUpdateDate")
    private LocalDate regUpdateDate;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "id")
    private RegistrationEntity registrationEntity;

}