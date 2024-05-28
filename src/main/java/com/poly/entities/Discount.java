package com.poly.entities;

import jakarta.persistence.*;
import lombok.Data;

import java.sql.Timestamp;

@Data
@Entity(name = "discounts")
public class Discount {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long discountId;

    @ManyToOne
    @JoinColumn(name = "productItemId")
    private ProductItem productItem;

    @Column(unique = true, updatable = false)
    private String code;

    private Integer percentNumber;

    private Timestamp createTime;

    private Timestamp endTime;
}
