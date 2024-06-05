package com.poly.entities;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotBlank;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@Entity(name = "sizes")
public class Size {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long sizeId;

    @NotBlank(message = "NotBlank.size.sizeName")
    private String sizeName;

    @NotBlank(message = "NotBlank.size.sizeDescription")
    private String sizeDescription;

    @OneToMany(mappedBy = "size")
    private List<ProductItem> productItemList;

    @Override
    public String toString() {
        return String.valueOf(sizeId);
    }
}
