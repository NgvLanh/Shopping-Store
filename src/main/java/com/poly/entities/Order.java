package com.poly.entities;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotBlank;
import lombok.Data;
import java.util.Date;

@Data
@Entity(name = "Orders")
public class Order {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long orderId;
    @Temporal(TemporalType.DATE)
    @Column(name = "date")
    private Date date = new Date();
    private Date shippingDate;
    @NotBlank(message = "NotBlank.order.status")
    private String status;
    private Double total;

    @ManyToOne
    @JoinColumn(name = "customerId")
    private Customer customer;

    @ManyToOne
    @JoinColumn(name = "paymentId")
    private Payment payment;
}
