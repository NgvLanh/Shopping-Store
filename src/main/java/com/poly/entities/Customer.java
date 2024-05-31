package com.poly.entities;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import lombok.Data;

import java.sql.Timestamp;

@Data
@Entity(name = "customers")
public class Customer {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long customerId;

    @NotBlank(message = "NotBlank.customer.name")
    private String name;

    private String image;

    @NotBlank(message = "NotBlank.customer.email")
    @Email(message = "Email.customer.email")
    private String email;

    @NotBlank(message = "NotBlank.customer.password")
    private String password;

    private Boolean role = false;
    private Boolean activated =true;

    @NotBlank(message = "NotBlank.customer.phone")
    private String phone;

    @NotBlank(message = "NotBlank.customer.address")
    private String address;

    @NotBlank(message = "NotBlank.customer.city")
    private String city;


    private Timestamp createdTime;

    // customer - cart


}
