package com.poly.controllers.client;

import com.poly.entities.Order;
import com.poly.repositories.OrderRepository;
import com.poly.services.SessionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;
import java.util.Optional;

@Controller
public class TrackingOrder {
    @Autowired
    SessionService session;
    @Autowired
    OrderRepository orderRepository;

    /*SearchOrderId*/
    @PostMapping("/tracking-order")
    public String searchOrderId(Model model, @RequestParam("orderId") String orderId) {
        try {
            if (orderId == null || orderId.trim().isEmpty()) {
                model.addAttribute("message", "Order ID must not be empty");
                model.addAttribute("page", "tracking-order.jsp");
            } else if (!isNumeric(orderId)) {
                model.addAttribute("message", "Order ID must be a number");
                model.addAttribute("page", "tracking-order.jsp");
            } else {
                List<Order> item = orderRepository.findByByOrderId(Long.parseLong(orderId));
                if (item == null || item.isEmpty()) {
                    model.addAttribute("message", "Order not found");
                    model.addAttribute("page", "tracking-order.jsp");
                } else {
                    model.addAttribute("page", "tracking-order.jsp");
                    model.addAttribute("item", item);
                }
            }
        } catch (Exception e) {
            model.addAttribute("message", "An error occurred while searching for the order");
        }
        return "client/index";
    }

    private boolean isNumeric(String str) {
        try {
            Long.parseLong(str);
            return true;
        } catch (NumberFormatException e) {
            return false;
        }
    }
       /* List<Order> item = orderRepository.findByByOrderId(orderId);
        model.addAttribute("page", "tracking-order.jsp");
        model.addAttribute("item", item);
        return "client/index";
    }*/
}
