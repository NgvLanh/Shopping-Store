package com.poly.entities;

import jakarta.validation.constraints.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Product {

    private Long id;

    @NotBlank(message = "NotBlank.product.name")
    private String name;

    @NotBlank(message = "NotBlank.product.description")
    private String description;

    @NotNull(message = "NotNull.product.price")
    @Min(value = 1000, message = "Min.product.price")
    private Double price;


    @NotNull(message = "NotNull.product.quantity")
    @Min(value = 1, message = "Min.product.quantity")
    private Integer quantity;

    @NotNull(message = "NotNull.product.file")
    private MultipartFile file;

//    @NotBlank(message = "NotBlank.product.fileName")
    private String fileName;

    @NotBlank(message = "NotBlank.product.category")
    private String category;

    @NotBlank(message = "NotBlank.product.brand")
    private String brand;

    @NotBlank(message = "NotBlank.product.supplier")
    private String supplier;

    @NotEmpty(message = "NotEmpty.product.color")
    private List<String> color;

    @NotEmpty(message = "NotEmpty.product.size")
    private List<String> size;

    // Getters and setters
    public void print() {
        System.out.println("name: " + name);
        System.out.println("description: " + description);
        System.out.println("price: " + price);
        System.out.println("quantity: " + quantity);
        System.out.println("file: " + file);
        System.out.println("fileName: " + fileName);
        System.out.println("category: " + category);
        System.out.println("brand: " + brand);
        System.out.println("supplier: " + supplier);
        System.out.println("color: " + color);
        System.out.println("size: " + size);

    }
    public boolean isEmpty() {
        return name == null || description == null || price == null || quantity == null ||
                file == null || fileName == null || category == null || brand == null ||
                supplier == null || (color == null || color.isEmpty()) ||
                (size == null || size.isEmpty());
    }
}


