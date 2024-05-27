package com.poly.entities;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import lombok.Data;

@Data
@Entity(name = "suppliers")
public class Supplier {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long supplierId;

    private String supplierName;

    private String contactName;

    private String contactPhone;

    private String contactEmail;

    private String address;

    private String city;

    public boolean isEmpty() {
        return supplierName == null || contactName == null || contactPhone == null || contactEmail == null || address == null || city == null;
    }

}

