package com.poly.entities;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.web.multipart.MultipartFile;

import java.sql.Timestamp;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Customer {
    private Long customerId;
    private String firstName;
    private String lastName;
    private MultipartFile file;
    private String fileName;
    private String email;
    private String password;
    private String phone;
    private String address;
    private String city;
    private Timestamp createdDate;
    private Boolean role = false;
}
