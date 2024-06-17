package com.poly.controllers.client;

import com.poly.entities.Customer;
import com.poly.entities.Order;
import com.poly.entities.OrderItem;
import com.poly.entities.Payment;
import com.poly.repositories.OrderItemRepository;
import com.poly.repositories.OrderRepository;
import com.poly.repositories.PaymentRepository;
import com.poly.services.SessionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Collections;
import java.util.List;


@Controller
@RequestMapping("/your-order")
public class ConfirmationController {
    @Autowired
    OrderRepository orderRepository;
    @Autowired
    OrderItemRepository orderItemRepository;
    @Autowired
    SessionService sessionService;
    @Autowired
    PaymentRepository paymentRepository;

    @GetMapping
    public String confirmation(Model model) {
        model.addAttribute("page", "confirmation.jsp");
        return "client/index";
    }

    @GetMapping("/order-details")
    public String orderDetails(@RequestParam("order_id") Long orderId,
                               Model model) {
        List<OrderItem> orderItemList = orderItemRepository.findOrderItemByOrderOrderId(orderId);
        model.addAttribute("orderItems", orderItemList);
        model.addAttribute("page", "confirmation.jsp");
        return "client/index";
    }

    @GetMapping("/update-status")
    public String updateStatus(@RequestParam("status") String status,
                               @RequestParam("order_id") Long orderId) {
        Order order = orderRepository.findById(orderId).orElse(null);
        order.setStatus(status);
        if (status.equals("delivered")) {
            Payment payment = order.getPayment();
            payment.setStatus("completed");
            paymentRepository.save(payment);
        }
        orderRepository.save(order);
        return "redirect:/your-order";
    }

    @ModelAttribute("orders")
    public List<Order> getAllOrders() {
        Customer customer = sessionService.get("customer");
        try {
            List<Order> orders = orderRepository.findOrderByCustomerCustomerId(customer.getCustomerId());
            Collections.reverse(orders);
            return orders;
        } catch (Exception e) {
            return null;
        }
    }
}
