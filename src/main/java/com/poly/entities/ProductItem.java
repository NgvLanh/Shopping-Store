package com.poly.entities;

import jakarta.persistence.*;
import jakarta.validation.Valid;
import jakarta.validation.constraints.NotEmpty;
import lombok.Data;

import java.util.List;

@Data
@Entity(name = "productItems")
public class ProductItem {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long productItemId;

    @ManyToOne
    @JoinColumn(name = "productId")
    @Valid
    private Product product;

    private Integer price;

    private Integer quantity;

    @ManyToMany
    @JoinTable(
            name = "product_item_color",
            joinColumns = @JoinColumn(name = "productItemId"),
            inverseJoinColumns = @JoinColumn(name = "colorId")
    )
    @NotEmpty(message = "NotEmpty.productItem.colors")
    private List<Color> colors;

    @ManyToMany
    @JoinTable(
            name = "product_item_size",
            joinColumns = @JoinColumn(name = "productItemId"),
            inverseJoinColumns = @JoinColumn(name = "sizeId")
    )
    @NotEmpty(message = "NotEmpty.productItem.sizes")
    private List<Size> sizes;


    @OneToMany(mappedBy = "productItem")
    private List<Discount> discounts;

    @Override
    public String toString() {
        return "ProductItem{" +
                "productItemId=" + productItemId +
                ", product=" + (product != null ? product.getProductId() : "null") +
                ", price=" + price +
                ", quantity=" + quantity +
                '}';
    }
}