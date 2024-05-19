package com.poly.models;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Supplier {
    private String supplierName;
    private String contactName;
    private String contactPhone;
    private String contactEmail;
    private String address;
    private String city;
}
