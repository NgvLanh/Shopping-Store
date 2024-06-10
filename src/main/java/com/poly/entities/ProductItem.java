package com.poly.entities;

import jakarta.persistence.*;
import jakarta.validation.Valid;
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.NotNull;
import lombok.Data;

import java.util.List;

@Data
@Entity(name = "productItems")
public class ProductItem {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long productItemId;

    @NotNull(message = "Please select the product.")
    @ManyToOne
    @JoinColumn(name = "productId")
    private Product product;

    @NotNull(message = "Please enter product price.")
    @Min(value = 1, message = "Price must be greater than 1.")
    private Integer price;

    @NotNull(message = "Please enter product quantity.")
    @Min(value = 1, message = "Quantity must be greater than 1.")
    private Integer quantity;

    @ManyToOne
    @JoinColumn(name = "colorId")
    @NotNull(message = "Please select the color.")
    private Color color;

    @ManyToOne
    @JoinColumn(name = "sizeId")
    @NotNull(message = "Please select the size.")
    private Size size;

//    @OneToMany(mappedBy = "productItem")
//    private List<Discount> discounts;

}