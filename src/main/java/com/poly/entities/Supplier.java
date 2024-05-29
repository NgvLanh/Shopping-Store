package com.poly.entities;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity(name = "suppliers")
public class Supplier {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long supplierId;

    @NotBlank(message = "NotBlank.supplier.supplierName")
    private String supplierName;

    @NotBlank(message = "NotBlank.supplier.contactName")
    private String contactName;

    @NotBlank(message = "NotBlank.supplier.contactPhone")
    private String contactPhone;

    @Email(message = "Email.supplier.contactEmail")
    @NotBlank(message = "NotBlank.supplier.contactEmail")
    private String contactEmail;

    @NotBlank(message = "NotBlank.supplier.address")
    private String address;

    @NotBlank(message = "NotBlank.supplier.city")
    private String city;

}

