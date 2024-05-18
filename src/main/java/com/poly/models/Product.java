package com.poly.models;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.web.multipart.MultipartFile;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Product {
    private String name;
    private String description;
    private Double price;
    private Integer quantity;
    private MultipartFile image;
    private String category;
    private String band;
    private String supplier;
    // Getters and setters
}

