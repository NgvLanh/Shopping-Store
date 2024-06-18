package com.poly.controllers.admin;

import com.poly.entities.*;
import com.poly.repositories.OrderItemRepository;
import com.poly.repositories.OrderRepository;
import com.poly.repositories.PaymentRepository;
import com.poly.services.DashboardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping("/admin/dashboard")
public class DashboardController {

    @Autowired
    PaymentRepository paymentRepository;
    @Autowired
    DashboardService dashboardService;
    @Autowired
    OrderRepository orderRepository;
    @Autowired
    OrderItemRepository orderItemRepository;

    @GetMapping("")
    public String dashboard(Model model) {
        DecimalFormat df = new DecimalFormat("#,##0.00");
        DecimalFormat df2 = new DecimalFormat("#,##");

        // Tổng thanh toán
        Double payment = paymentRepository.sumAmountByStatus();
        model.addAttribute("totalPayment", (payment != null) ? df.format(payment) : "0.000");

        // Tổng đơn hàng
        Double order = orderRepository.findTotalSumOrder();
        model.addAttribute("totalOrder", (order != null) ? df2.format(order) : "0.000");

        // Tổng lợi nhuận
        if (payment != null && order != null) {
            model.addAttribute("totalMargin", df.format(order - payment));
        } else {
            model.addAttribute("totalMargin", "0.000");
        }

        // Tổng số tiền trong tháng hiện tại
        Double totalAmount = dashboardService.getAmountCurrentMonth();
        model.addAttribute("totalAmount", (totalAmount != null) ? df.format(totalAmount) : "0.000");

        // Tổng doanh thu trong ngày hôm nay
        Double totalDate = dashboardService.getTotalRevenueForToday();
        model.addAttribute("totalDate", (totalDate != null) ? df.format(totalDate) : "0.000");

        // Tổng đơn hàng trong ngày hôm nay (đã thanh toán)
        Long totalOrderDay = dashboardService.getTotalOrdersForTodayA();
        model.addAttribute("totalPaymentDay", (totalOrderDay != null) ? df2.format(totalOrderDay) : "0");

        // Tổng đơn hàng trong ngày hôm nay (chưa thanh toán)
        Long totalOrderDayNotPayment = dashboardService.getTotalOrdersForTodayNotPayment();
        model.addAttribute("totalOrderDay", (totalOrderDayNotPayment != null) ? df2.format(totalOrderDayNotPayment) : "0");
        // Tổng sản phẩm bán được trong ngày hôm nay
        Long totalOrderProDay = dashboardService.getTotalProductsSoldForToday();
        model.addAttribute("totalOrderProDay", (totalOrderProDay != null) ? df2.format(totalOrderProDay) : "0");

        // Tổng số sản phẩm trong tháng này
        Long totalPrMonth = dashboardService.getTotalSumProMonth();
        model.addAttribute("totalPrMonth", (totalPrMonth != null) ? String.format("%d", totalPrMonth) : "0");

        // Tổng đơn hàng sản phẩm trong tháng này
        Long totalOrderPrMonth = dashboardService.getTotalOrderSumProMonth();
        model.addAttribute("totalOrderPrMonth", (totalOrderPrMonth != null) ? df2.format(totalOrderPrMonth) : "0");

        // Tổng doanh thu trong năm
        Double totalYear = dashboardService.getTotalRevenueForYear();
        model.addAttribute("totalYear", (totalYear != null) ? df.format(totalYear) : "0.000");

        model.addAttribute("page", "home.jsp");
        return "admin/index";
    }

    @ModelAttribute("months")
    public List<String> months() {
        return paymentRepository.findDistinctByDate();
    }

    @ModelAttribute("payments")
    public List<Payment> payments() {
        return paymentRepository.findAll();
    }

    @ModelAttribute("monthlySalesSummary")
    public List<MonthlySalesSummary> monthlySalesSummary() {
        return paymentRepository.findMonthlySalesSummary();
    }

    @ModelAttribute("findTop5OrdersWithCustomers")
    public List<PendingInvoice> top5() {
        Pageable pageable = PageRequest.of(0, 5);
        return orderRepository.findTop5OrdersWithCustomers(pageable);
    }
}
