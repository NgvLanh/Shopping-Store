package com.poly.repositories;
import com.poly.entities.Category;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;


public interface CategoryRepository extends JpaRepository<Category, Long> {


        @Query("SELECT c.name, p.name, pi.price, p.image " +
                "FROM categories c " +
                "INNER JOIN products p ON c.categoryId = p.category.categoryId " +
                "INNER JOIN productItems pi ON p.productId = pi.product.productId")
        List<Object[]> findCategoriesAndProductsAndPrices();
    }






