package com.poly.entities;

import jakarta.persistence.*;
import jakarta.validation.constraints.Max;
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
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

    @NotNull(message = "Please enter rating.")
    @Min(value = 1, message = "rating")
    @Max(value = 5, message = "rating")
    private Integer rating;
    @NotBlank(message = "Please enter commnet.")
    private String comment;

    private Date reviewDate;
}
