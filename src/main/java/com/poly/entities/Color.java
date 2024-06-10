package com.poly.entities;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotBlank;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@Entity(name = "colors")
public class Color {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long colorId;

    @NotBlank(message = "NotBlank.color.color")
    private String colorName;

    @NotBlank(message = "NotBlank.color.colorDescription")
    private String colorDescription;

    @OneToMany(mappedBy = "color")
    private List<ProductItem> productItemList;
    @Override
    public String toString() {
        return String.valueOf(colorId);
    }
}
