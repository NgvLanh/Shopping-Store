package com.poly.entities;

import jakarta.persistence.*;
import jakarta.validation.Valid;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.NotNull;
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
    @NotNull(message = "Please select product.")
    private ProductItem productItem;

    @NotBlank(message = "Please enter code.")
    @Column(unique = true, updatable = false)
    private String code;

    @NotNull(message = "Please enter percent number.")
    private Integer percentNumber;

    private Timestamp createTime;

    private Timestamp endTime;
}
