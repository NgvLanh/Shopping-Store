package com.poly.repositories;

import com.poly.entities.Payment;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.List;

public interface PaymentRepository extends JpaRepository<Payment, Long> {
    @Query("SELECT SUM(p.amount) FROM payments p WHERE p.status like 'completed'")
    Double sumAmountByStatus();

    //truy vấn theo tháng
    @Query("SELECT SUM(p.amount) AS totalAmount " +
            "FROM payments p WHERE p.status LIKE 'completed' " +
            "AND YEAR(p.date) = :year AND MONTH(p.date) = :month")
    Double sumAmountByMonth(@Param("year") int year, @Param("month") int month);

    @Query("SELECT SUM(p.amount) AS totalAmount " +
            "FROM payments p WHERE p.status LIKE 'completed' " +
            "AND YEAR(p.date) = YEAR(CURRENT_DATE()) " +
            "AND MONTH(p.date) = MONTH(CURRENT_DATE()) " +
            "GROUP BY YEAR(p.date), MONTH(p.date)")
    Double sumAmountCurrentMonth();
    //truy vấn tổng doanh thu theo ngày
    @Query("SELECT SUM(p.amount) FROM payments p WHERE p.status LIKE 'completed' AND p.date = :currentDate")
    Double findTotalRevenueForDate(@Param("currentDate") LocalDate currentDate);
    //truy vấn tổng doanh thu theo năm
    @Query("SELECT SUM(p.amount) FROM payments p WHERE p.status LIKE 'completed' AND YEAR(p.date) = YEAR(:currentDate)")
    Double getTotalAmountForCurrentYear(@Param("currentDate") LocalDate currentDate);

//    List<String> findDistinctByDate();
}
