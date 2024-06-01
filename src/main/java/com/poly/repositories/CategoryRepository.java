package com.poly.repositories;

import com.poly.entities.Category;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface CategoryRepository extends JpaRepository<Category, Long> {
    @Query("select o.name,count(o) from categories o where o.name = ?1 group by o.name")
//    List<Category> findCategoriesByName(string name);
}
