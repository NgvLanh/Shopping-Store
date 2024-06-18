package com.poly.entities;

import lombok.Data;

@Data
public class BestSellerProduct {
    private Long productId;
    private String name;
    private String image;
    private Integer price;
    private Long timesSold;

    public BestSellerProduct(Long productId, String name, String image, Integer price, Long timesSold) {
        this.productId = productId;
        this.name = name;
        this.image = image;
        this.price = price;
        this.timesSold = timesSold;
    }

    // Getters and Setters
}
