package com.poly.entities;

import jakarta.persistence.*;
import lombok.Data;

import java.util.List;

@Data
@Entity(name = "productItems")
public class ProductItem {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long productItemId;

    @ManyToOne
    @JoinColumn(name = "productId")
    private Product product;

    @OneToMany(mappedBy = "productItem")
    private List<Discount> discounts;

    private Integer price;

    private Integer quantity;

    @OneToMany(mappedBy = "productItem")
    private List<Color> colors;

    @OneToMany(mappedBy = "productItem")
    private List<Size> sizes;
}