package com.poly.entities;

import jakarta.persistence.*;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import lombok.Data;

import java.sql.Timestamp;
import java.util.Date;

@Data
@Entity(name = "customers")
public class Customer {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long customerId;

    @NotBlank(message = "NotBlank.customer.name")
    private String name;

    private String image ;

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


    @Temporal(TemporalType.DATE)
    @Column(name = "created_time")
    Date createDate = new Date();

    public void clear() {
        setName(null);
        setEmail(null);
        setPassword(null);
        setPhone(null);
        setAddress(null);
        setCity(null);
    }

    // customer - cart


}
