package com.xworkz.admin.entity;
import lombok.Data;
import javax.persistence.*;
import java.time.LocalDate;

@Entity
@Table(name = "enquiryupdatetrackdetails")
@Data
@NamedQuery(name = "GetFollowupDetailsByEnquiryId", query = "SELECT f FROM Followuptrackdetailsentity f WHERE f.enquiryEntity.id = :enquiryId")
public class Followuptrackdetailsentity {


    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_up")
    private int id;

    @Column(name = "Status")
    private String status;

    @Column(name = "Reason")
    private String reason;

    @Column(name ="Followedupdate")
    private LocalDate followedupdate;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "id")
    private EnquiryEntity enquiryEntity;


}

