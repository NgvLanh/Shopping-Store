package com.poly.repositories;

import com.poly.entities.Discount;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Date;
import java.util.List;

@Repository
public interface DiscountRepository extends JpaRepository<Discount, Long> {

    boolean existsByCode(String code);

    List<Discount> findByEndTimeAfter(Date endTime);

    List<Discount> findByPercentNumberGreaterThanEqual(int percentNumber);

}
