package com.poly.entities;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import lombok.Data;

import java.sql.Timestamp;

@Data
@Entity(name = "customers")
public class Customer {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long customerId;
    private String name;
    private String image;
    private String email;
    private String password;
    private Boolean role;
    private Boolean activated;
    private String phone;
    private String address;
    private String city;
    private Timestamp createdTime;

    // customer - cart


}
