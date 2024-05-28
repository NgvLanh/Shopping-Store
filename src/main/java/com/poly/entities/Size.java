package com.poly.entities;

import jakarta.persistence.*;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@NoArgsConstructor
@Entity(name = "sizes")
public class Size {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long sizeId;

    private String size;

    private String sizeDescription;

    @ManyToMany(mappedBy = "sizes")
    private List<ProductItem> productItems;

//    @ManyToOne
//    @JoinColumn(name = "productItemId")
//    private ProductItem productItem;

    public Size(Long sizeId, String size, String sizeDescription) {
        this.sizeId = sizeId;
        this.size = size;
        this.sizeDescription = sizeDescription;
    }

    // Getters and setters
    public void print() {
        System.out.println("size: " + size);
        System.out.println("description: " + sizeDescription);


    }

    public boolean isEmpty() {
        return size == null || sizeDescription == null;
    }
}
