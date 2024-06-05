package com.poly.entities;


import jakarta.persistence.*;
import lombok.Data;

@Data
@Entity(name = "cartItems")
public class CartItem {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long cartItemId;

    @ManyToOne
    @JoinColumn(name = "cardId")
    private Cart cart;

    @OneToOne
    @JoinColumn(name = "productItemId")
    private ProductItem productItem;

    private Integer quantity;
}
