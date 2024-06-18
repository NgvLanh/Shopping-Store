package com.poly.entities;

import lombok.AllArgsConstructor;
import lombok.Data;

import java.util.Date;

@Data
@AllArgsConstructor
public class PendingInvoice {
    private Long id;
    private Double total;
    private Date date;
    private String name;
    private String image;
}
