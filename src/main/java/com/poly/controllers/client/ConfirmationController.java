package com.poly.controllers.client;

import com.poly.entities.Customer;
import com.poly.entities.Order;
import com.poly.entities.OrderItem;
import com.poly.repositories.OrderItemRepository;
import com.poly.repositories.OrderRepository;
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
