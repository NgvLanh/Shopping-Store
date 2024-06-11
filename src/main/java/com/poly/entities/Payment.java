package com.poly.entities;


import jakarta.persistence.*;
import lombok.Data;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

@Data
@Entity(name = "payments")
public class Payment {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long paymentId;
    @Temporal(TemporalType.DATE)
    private Date date = new Date();

    private Double amount;

    private String method;

    private String status;
}
