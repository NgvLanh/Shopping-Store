package com.poly.entities;

import jakarta.validation.constraints.NotBlank;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Category {
    private Long categoryId;

    @NotBlank(message = "NotBlank.category.name")
    private String name;

    @NotBlank(message = "NotBlank.category.description")
    private String description;
}
