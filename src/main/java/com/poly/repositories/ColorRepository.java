package com.poly.repositories;

import com.poly.entities.Color;
import com.poly.entities.Supplier;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ColorRepository extends JpaRepository<Color, Long> {

}
