package com.poly.services;

import com.poly.entities.Customer;
import com.poly.entities.Order;
import com.poly.repositories.OrderItemRepository;
import com.poly.repositories.OrderRepository;
import com.poly.repositories.PaymentRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.Date;
import java.util.List;
import java.util.Optional;

@Service
public class DashboardService {
    @Autowired
    PaymentRepository paymentRepository;
    @Autowired
    OrderRepository orderRepository;
    @Autowired
    OrderItemRepository orderItemRepository;

    //tổng tiền theo tháng hiện tại
    public Double getAmountCurrentMonth() {
        return paymentRepository.sumAmountCurrentMonth();
    }

    //tổng doanh thu theo ngày đơn hàng đã đặt
    public Double getTotalRevenueForToday() {
        LocalDate today = LocalDate.now();
        return paymentRepository.findTotalRevenueForDate(today);
    }

    //tổng doanh thu số lượng hóa đơn theo ngày đơn hàng đã đặt
    public Long getTotalOrdersForTodayA() {
        LocalDate today = LocalDate.now();
        return orderRepository.findTotalOrdersForDateA(today);
    }

    // tổng doanh thu số lượng sản phẩm theo ngày đơn hàng đã đặt
    public Long getTotalProductsSoldForToday() {
        LocalDate today = LocalDate.now();
        return orderItemRepository.findTotalProductsSoldForDate(today);
    }

    // tổng doanh thu số lượng sản phẩm theo tháng đơn hàng đã đặt
    public Long getTotalSumProMonth() {
        LocalDate today = LocalDate.now();
        return orderItemRepository.findTotalProductsSoldForCurrentMonth(today);
    }

    // tổng doanh thu số lượng hóa đơn theo tháng đơn hàng đã đặt
    public Long getTotalOrderSumProMonth() {
        LocalDate today = LocalDate.now();
        return orderRepository.findTotalOrdersForCurrentMonth(today);
    }

    // tổng doanh thu theo năm
    public Double getTotalRevenueForYear() {
        LocalDate today = LocalDate.now();
        return paymentRepository.getTotalAmountForCurrentYear(today);
    }


}
