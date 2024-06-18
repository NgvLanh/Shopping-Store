package com.poly.entities;

import jakarta.persistence.*;
import lombok.Data;

import java.util.Date;

@Data
@Entity(name = "reviews")
public class Review {
    // 123
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long reviewId;

    @ManyToOne
    @JoinColumn(name = "productId")
    private Product product;

    @ManyToOne
    @JoinColumn(name = "customerId")
    private Customer customer;

    private Integer rating;
    private String comment;

    @Temporal(TemporalType.DATE)
    private Date reviewDate = new Date();
}
