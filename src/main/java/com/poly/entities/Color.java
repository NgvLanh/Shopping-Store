package com.poly.entities;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotBlank;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@NoArgsConstructor
@Entity(name = "colors")
public class Color {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long colorId;

    @NotBlank(message = "NotBlank.color.colorName")
    private String colorName;

    @NotBlank(message = "NotBlank.color.colorDescription")
    private String colorDescription;

    @ManyToMany(mappedBy = "colors")
    private List<ProductItem> productItems;

//        @ManyToOne
//        @JoinColumn(name = "productItemId")
//        private ProductItem productItem;

    public Color(Long colorId, String colorName, String colorDescription) {
        this.colorId = colorId;
        this.colorName = colorName;
        this.colorDescription = colorDescription;
    }

}
