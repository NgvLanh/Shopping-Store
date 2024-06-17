package com.poly.repositories;

import com.poly.entities.OrderItem;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.time.LocalDate;
import java.util.List;

public interface OrderItemRepository extends JpaRepository<OrderItem, Long> {
    List<OrderItem> findOrderItemByOrderOrderId(Long orderId);
    // tổng sản phẩm bán theo ngày
    @Query("SELECT SUM(oi.quantity) FROM orderItems oi JOIN Orders o ON oi.orderItemId = o.orderId JOIN payments p on p.paymentId = o.orderId WHERE p.status LIKE 'completed' AND o.date = :currentDate")
    Long findTotalProductsSoldForDate(@Param("currentDate") LocalDate currentDate);
    // tổng sản phẩm bán theo tháng
    @Query("SELECT SUM(oi.quantity) FROM Orders o JOIN orderItems oi ON o.orderId = oi.order.orderId " +
            "join payments p on p.paymentId = o.orderId WHERE p.status like 'completed' AND MONTH(o.date) = MONTH(:currentDate) AND YEAR(o.date) = YEAR(:currentDate)")
    Long findTotalProductsSoldForCurrentMonth(@Param("currentDate") LocalDate currentDate);
    // top sản phẩm bán
    @Query("SELECT oi.productItem.productItemId, p.name, SUM(oi.quantity) AS totalSold " +
            "FROM orderItems oi " +
            "JOIN products p ON p.productId = oi.productItem.productItemId JOIN Orders d on d.orderId = oi.orderItemId JOIN payments a on a.paymentId = d.orderId WHERE a.status LIKE 'completed'" +
            "GROUP BY oi.productItem.productItemId, p.name " +
            "ORDER BY totalSold DESC")
    List<Object[]> findTop5ProductsByTotalSold(Pageable pageable);
}
