package com.poly.entities;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Product {
    private String name;
    private String description;
    private Double price;
    private Integer quantity;
    private MultipartFile file;
    private String fileName;
    private String category;
    private String brand;
    private String supplier;
    private List<String> color;
    private List<String> size;
    // Getters and setters
    public void print() {
        System.out.println("name: " + name);
        System.out.println("description: " + description);
        System.out.println("price: " + price);
        System.out.println("quantity: " + quantity);
        System.out.println("file: " + file.toString());
        System.out.println("fileName: " + fileName);
        System.out.println("category: " + category);
        System.out.println("brand: " + brand);
        System.out.println("supplier: " + supplier);
        System.out.println("color: " + color);
        System.out.println("size: " + size);

    }
}

