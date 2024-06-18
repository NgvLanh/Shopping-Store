package com.poly.repositories;

import com.poly.entities.Supplier;
import org.springframework.data.jpa.repository.JpaRepository;

public interface SupplierRepository extends JpaRepository<Supplier, Long> {
    Supplier findBySupplierNameLike(String name);
}
