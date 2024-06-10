package com.poly.entities;


import jakarta.persistence.*;
import lombok.Data;

@Data
@Entity(name = "orderItems")
public class OrderItem {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long orderItemId;

    @ManyToOne
    @JoinColumn(name = "orderId")
    private Order order;

    @ManyToOne
    @JoinColumn(name = "productItemId")
    private ProductItem productItem;

    private Integer quantity;

    private Integer price;

}
