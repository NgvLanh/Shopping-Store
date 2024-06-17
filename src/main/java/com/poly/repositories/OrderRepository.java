package com.poly.repositories;

import com.poly.entities.Order;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.time.LocalDate;
import java.util.Date;
import java.util.List;
import java.util.Optional;

public interface OrderRepository extends JpaRepository<Order, Long> {

    @Query("SELECT o FROM Orders o WHERE o.orderId= :orderId")
    List<Order> findByByOrderId(@Param("orderId") Long orderId);

    @Query("SELECT SUM(o.total) FROM Orders o")
    Double findTotalSumOrder();

    List<Order> findOrderByCustomerCustomerId(Long customerId);

    @Query("select o from Orders o where o.status like 'wait to confirmation' ")
    List<Order> findByStatus();

    @Query("select o from Orders o where o.status like 'confirm' ")
    List<Order> findByStatus1();

    @Query("select o from Orders o where o.status like 'Shipping orders' ")
    List<Order> findByStatus2();

    @Query("select o from Orders o where o.status like 'delivered'  ")
    List<Order> findByStatus3();

    @Query("select o from Orders o where o.status like 'cancel'  ")
    List<Order> findByStatus4();

    @Query("update Orders o set o.status = 'cancel' where o.orderId = ?1")
    void cancelOrderById(Long orderId);

    //truy vấn tổng số đơn đặt hàng ngày hiện tại đã thanh toán
    @Query("SELECT COUNT(o) FROM Orders o join payments p on p.paymentId = o.orderId WHERE p.status like 'completed' AND o.date = :currentDate")
    Long findTotalOrdersForDateA(@Param("currentDate") LocalDate currentDate);

    //truy vấn tổng số đơn đặt hàng tháng hiện tại đã thanh toán
    @Query("SELECT COUNT(o) FROM Orders o JOIN payments p ON p.paymentId = o.orderId " +
            "WHERE p.status = 'completed' AND MONTH(o.date) = MONTH(:currentDate) AND YEAR(o.date) = YEAR(:currentDate)")
    Long findTotalOrdersForCurrentMonth(@Param("currentDate") LocalDate currentDate);

}
