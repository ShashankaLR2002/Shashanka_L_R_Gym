package com.xworkz.admin.entity;
import lombok.Data;
import javax.persistence.*;
@Data
@Entity
@Table(name = "admin")
@NamedQuery(name = "getAdminEntitylistbyemailforResetpassword", query = "SELECT p FROM AdminEntity p WHERE p.email = :email")
@NamedQuery(name = "getAdminEntityCountByEmail", query = "SELECT COUNT(a) FROM AdminEntity a WHERE a.email = :email")
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
