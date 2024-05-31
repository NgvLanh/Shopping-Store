package com.poly.entities;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotBlank;
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

    @NotBlank(message = "NotBlank.size.sizeName")
    private String sizeName;

    @NotBlank(message = "NotBlank.size.sizeDescription")
    private String sizeDescription;

    @ManyToMany(mappedBy = "sizes")
    private List<ProductItem> productItems;

//    @ManyToOne
//    @JoinColumn(name = "productItemId")
//    private ProductItem productItem;

    public Size(Long sizeId, String sizeName, String sizeDescription) {
        this.sizeId = sizeId;
        this.sizeName = sizeName;
        this.sizeDescription = sizeDescription;
    }

}
