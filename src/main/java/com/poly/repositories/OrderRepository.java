package com.poly.repositories;

import com.poly.entities.Order;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface OrderRepository extends JpaRepository<Order, Long> {

    @Query("SELECT o FROM Orders o WHERE o.orderId= :orderId")
    List<Order> findByByOrderId(@Param("orderId") Long orderId);

    @Query("SELECT SUM(o.total) FROM Orders o")
    Double findTotalSumOrder();

    List<Order> findOrderByCustomerCustomerId(Long customerId);

    @Query("select o from Orders o where o.status like 'Wait to confirmation' ")
    List<Order> findByStatus();

    @Query("select o from Orders o where o.status like 'Confirm' ")
    List<Order> findByStatus1();

    @Query("select o from Orders o where o.status like 'Shipping orders'  ")
    List<Order> findByStatus2();

    @Query("select o from Orders o where o.status like 'Delivered'  ")
    List<Order> findByStatus3();

}
