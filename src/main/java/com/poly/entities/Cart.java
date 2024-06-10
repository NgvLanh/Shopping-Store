package com.poly.entities;

import jakarta.persistence.*;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@Entity(name = "carts")
public class Cart {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long cartId;

    @OneToOne
    @JoinColumn(name = "customerId")
    private Customer customer;
}
