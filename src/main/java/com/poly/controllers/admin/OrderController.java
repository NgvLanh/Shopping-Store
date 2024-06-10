package com.poly.controllers.admin;

import com.poly.entities.Order;
import com.poly.repositories.OrderRepository;
import com.poly.services.SessionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.Arrays;
import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping("/admin/order-management")
public class OrderController {
    @Autowired
    SessionService session;
    @Autowired
    OrderRepository orderRepository;

    @GetMapping("")
    public String ShowOrderManagement(@ModelAttribute("order") Order order,
                                      Model model) {
        model.addAttribute("disabledSave", "disabled");
        model.addAttribute("page", "orderManagement.jsp");
        return "admin/index";
    }

    @PostMapping("/update")
    public String update(@Validated @ModelAttribute("order") Order order,
                         BindingResult result,
                         Model model) {
        if (!result.hasErrors()) {
            orderRepository.save(order);
        }
        model.addAttribute("page", "orderManagement.jsp");
        return "admin/index";
    }

    @GetMapping("/edit/{id}")
    public String edit(Model model,
                       @PathVariable Long id) {
        model.addAttribute("disabledSave", "");
        model.addAttribute("order", orderRepository.findById(id).orElse(null));
        model.addAttribute("page", "orderManagement.jsp");
        return "admin/index";
    }

    @ModelAttribute("orders")
    public List<Order> getAllOrders() {
        return orderRepository.findAll();
    }


    @ModelAttribute("status")
    public List<String> getAllStatus() {
        return Arrays.asList(
                "Confirmed", "Cancellation"
        );
    }
}
