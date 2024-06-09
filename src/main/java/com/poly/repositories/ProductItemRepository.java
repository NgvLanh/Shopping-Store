package com.poly.repositories;

import com.poly.entities.Product;
import com.poly.entities.ProductItem;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface ProductItemRepository extends JpaRepository<ProductItem, Long> {
    List<ProductItem> findProductItemByProductProductId(Long id);

    @Query("select pi from  productItems pi " +
            "where pi.product.productId = ?1 " +
            "and pi.color.colorId = ?2 " +
            "and pi .size.sizeId = ?3")
    ProductItem findByProductAndColorAndSize(long productId, long colorId, long sizeId);

    @Query(value = "WITH CTE AS (" +
            "SELECT *, ROW_NUMBER() OVER (PARTITION BY product_id ORDER BY product_item_id) AS row_num " +
            "FROM product_items) " +
            "SELECT * FROM CTE WHERE row_num = 1",
            nativeQuery = true)
    List<ProductItem> findDistinctProductItems();
}
