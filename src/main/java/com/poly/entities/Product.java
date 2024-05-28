package com.poly.entities;

import jakarta.persistence.*;
import jakarta.validation.constraints.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@Entity(name = "products")
public class Product {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long productId;

    @NotBlank(message = "NotBlank.product.name")
    private String name;

    @NotBlank(message = "NotBlank.product.description")
    private String description;

//    @NotBlank(message = "NotBlank.product.image")
    private String image;

    @NotNull(message = "NotNull.product.quantity")
    @Min(value = 1, message = "Min.product.quantity")
    private Integer quantity;

    @NotNull(message = "NotNull.product.price")
    @Min(value = 5, message = "Min.product.price")
    private Integer price;

    @ManyToOne
    @JoinColumn(name = "categoryId")
    @NotNull(message = "NotNull.product.category")
    private Category category;

    @ManyToOne
    @JoinColumn(name = "brandId")
    @NotNull(message = "NotNull.product.brand")
    private Brand brand;

    @ManyToOne
    @JoinColumn(name = "supplierId")
    @NotNull(message = "NotNull.product.supplier")
    private Supplier supplier;

    @Override
    public String toString() {
        return "Product{" +
                "productId=" + productId +
                ", name='" + name + '\'' +
                ", description='" + description + '\'' +
                ", image='" + image + '\'' +
                ", quantity=" + quantity +
                ", price=" + price +
                ", category=" + (category != null ? category.getCategoryId() : "null") +
                ", brand=" + (brand != null ? brand.getBrandId() : "null") +
                ", supplier=" + (supplier != null ? supplier.getSupplierId() : "null") +
                '}';
    }
}


