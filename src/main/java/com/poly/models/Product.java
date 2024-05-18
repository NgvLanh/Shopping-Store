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
    private String brand;
    private String supplier;
    private String color;
    private String size;
    // Getters and setters
    public void print() {
        System.out.println(name);
        System.out.println(description);
        System.out.println(price);
        System.out.println(quantity);
        System.out.println(image.getOriginalFilename());
        System.out.println(category);
        System.out.println(brand);
        System.out.println(supplier);
    }
}

