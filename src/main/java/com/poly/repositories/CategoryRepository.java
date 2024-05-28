package com.poly.repositories;

import com.poly.entities.Category;
import com.poly.entities.Supplier;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CategoryRepository extends JpaRepository<Category, Long> {
}
