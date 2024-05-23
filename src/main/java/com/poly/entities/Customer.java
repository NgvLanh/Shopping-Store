package com.poly.entities;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Timestamp;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Customer {
    private Long customerId;
    private String firstName;
    private String lastName;
    private String email;
    private String password;
    private String phone;
    private String address;
    private String city;
    private String state;
    private String zipCode;
    private Timestamp createdDate;
    private Boolean role = false;
}
