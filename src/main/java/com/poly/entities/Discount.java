package com.poly.entities;

import jakarta.persistence.*;
import jakarta.validation.Valid;
import jakarta.validation.constraints.*;
import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.Date;
import java.util.List;

@Data
@Entity(name = "discounts")
public class Discount {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long discountId;

//    @ManyToOne
//    @JoinColumn(name = "productItemId")
//    @NotNull(message = "Please select product.")
//    private ProductItem productItem;

    @NotBlank(message = "Please enter code.")
    @Column(unique = true, updatable = false)
    private String code;

    @NotNull(message = "Please enter percent number.")
    @Min(value = 0, message = "percentNumber")
    @Max(value = 100, message = "percentNumber")
    private Integer percentNumber;

    @Temporal(TemporalType.DATE)
    @Column(name = "created_time")
    Date createTime = new Date();

    private Date endTime;

    @OneToMany(mappedBy = "discount")
    private List<Order> orders;

    @Override
    public String toString() {
        return String.valueOf(discountId);
    }
}
