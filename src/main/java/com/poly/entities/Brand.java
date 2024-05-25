package com.poly.entities;

import jakarta.validation.constraints.NotBlank;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Brand {
    private Long brandId;

    @NotBlank(message = "NotBlank.brand.name")
    private String name;

    @NotBlank(message = "NotBlank.brand.description")
    private String description;
}
