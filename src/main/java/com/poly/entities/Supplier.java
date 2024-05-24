package com.poly.entities;

import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Pattern;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Supplier {
    private Long id;

    @NotBlank(message = "NotBlank.supplier.supplierName")
    private String supplierName;

    @NotBlank(message = "NotBlank.supplier.contactName")
    private String contactName;

//    @Pattern(regexp = "^0\\d{9,10}$", message = "Pattern.supplier.contactPhone")
    @NotBlank(message = "NotBlank.supplier.contactPhone")
    private String contactPhone;

    @Email(message = "Email.supplier.contactEmail")
    @NotBlank(message = "NotBlank.supplier.contactEmail")
    private String contactEmail;

    @NotBlank(message = "NotBlank.supplier.address")
    private String address;

    @NotBlank(message = "NotBlank.supplier.city")
    private String city;


    public boolean isEmpty(){
        return  supplierName == null || contactName == null || contactPhone == null ||contactEmail == null || address == null || city ==null;
    }

}

