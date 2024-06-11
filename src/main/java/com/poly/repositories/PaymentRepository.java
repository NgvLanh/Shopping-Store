package com.poly.repositories;

import com.poly.entities.Payment;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface PaymentRepository extends JpaRepository<Payment, Long> {
    @Query("SELECT SUM(p.amount) FROM payments p WHERE p.status like 'completed'")
    Double sumAmountByStatus();
}
