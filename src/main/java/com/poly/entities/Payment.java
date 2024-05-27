package com.poly.entities;


import jakarta.persistence.*;
import lombok.Data;

import java.sql.Timestamp;
import java.util.List;

@Data
@Entity(name = "payments")
public class Payment {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long paymentId;

    @OneToMany(mappedBy = "payment")
    private List<Order> orders;

    private Timestamp date;

    private Integer amount;

    private String method;

    private String status;
}
