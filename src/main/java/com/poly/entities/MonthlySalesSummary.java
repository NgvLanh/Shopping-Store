package com.poly.entities;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class MonthlySalesSummary {
    private int saleYear;
    private int saleMonth;
    private Double totalAmount;
}
