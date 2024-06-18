package com.poly.repositories;

import com.poly.entities.Color;
import com.poly.entities.Size;
import com.poly.entities.Supplier;
import org.springframework.data.jpa.repository.JpaRepository;

public interface SizeRepository extends JpaRepository<Size, Long> {
    Size findBySizeName(String sizeName);
}
