package com.poly.entities;

import jakarta.persistence.*;
import lombok.Data;

@Data
@Entity(name = "carts")
public class Cart {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long cardId;

    @OneToOne
    @JoinColumn(name = "customerId")
    private Customer customer;

}
