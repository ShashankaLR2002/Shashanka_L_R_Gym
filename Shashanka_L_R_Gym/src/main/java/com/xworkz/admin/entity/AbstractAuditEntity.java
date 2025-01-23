package com.xworkz.admin.entity;

import lombok.Data;

import javax.persistence.MappedSuperclass;
import java.io.Serializable;
import java.time.LocalDateTime;

@MappedSuperclass
@Data
public class AbstractAuditEntity implements Serializable {

    private LocalDateTime createdDate;


}
