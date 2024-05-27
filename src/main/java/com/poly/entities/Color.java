package com.poly.entities;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotBlank;
import lombok.Data;

@Data
@Entity
public class Color {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long colorId;

    @NotBlank(message = "NotBlank.color.color")
    private String color;

    @NotBlank(message = "NotBlank.color.colorDescription")
    private String colorDescription;

    @ManyToOne
    @JoinColumn(name = "productItemId")
    private ProductItem productItem;


    // ko cần dùng nữa thì xoá ko để hàm ko dùng
    public void print() {
        System.out.println("color: " + color);
        System.out.println("description: " + colorDescription);


    }

    public boolean isEmpty() {
        return color == null || colorDescription == null;
    }
}
