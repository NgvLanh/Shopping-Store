package com.poly.entities;

import jakarta.persistence.*;
import lombok.Data;

@Data
@Entity(name = "sizes")
public class Size {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long sizeId;

    private String size;

    private String sizeDescription;

    @ManyToOne
    @JoinColumn(name = "productItemId")
    private ProductItem productItem;

    // Getters and setters
    public void print() {
        System.out.println("size: " + size);
        System.out.println("description: " + sizeDescription);


    }

    public boolean isEmpty() {
        return size == null || sizeDescription == null;
    }
}
