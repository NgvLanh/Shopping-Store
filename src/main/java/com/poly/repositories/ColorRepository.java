package com.poly.repositories;

import com.poly.entities.Color;
import com.poly.entities.Supplier;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface ColorRepository extends JpaRepository<Color, Long> {
    Color findByColorName(String colorName);
}
