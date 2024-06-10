package com.poly.entities;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.validation.constraints.NotBlank;
import lombok.Data;

@Data
@Entity(name = "brands")
public class Brand {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)

    private Long brandId;
    @NotBlank(message = "NotBlank.brand.name")
    private String name;
    @NotBlank(message = "NotBlank.brand.description")
    private String description;
}
