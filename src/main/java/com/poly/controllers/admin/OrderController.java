package com.poly.controllers.admin;

import com.poly.entities.Customer;
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
import java.util.Collections;
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


    @GetMapping("/update/{orderId}")
    public String update(Model model, @PathVariable Long orderId) {
        Order order = orderRepository.findById(orderId).orElse(null);
        order.setStatus("confirm");
        orderRepository.save(order);
        model.addAttribute("page", "orderManagement.jsp");
        return "redirect:/admin/order-management";
    }

    @GetMapping("/update1/{orderId}")
    public String update1(Model model, @PathVariable Long orderId) {
        Order order = orderRepository.findById(orderId).orElse(null);
        order.setStatus("shipping orders");
        orderRepository.save(order);
        model.addAttribute("page", "orderManagement.jsp");
        return "redirect:/admin/order-management";
    }

    @GetMapping("/update2/{orderId}")
    public String update2(Model model, @PathVariable Long orderId) {
        Order order = orderRepository.findById(orderId).orElse(null);
        order.setStatus("delivered");
        orderRepository.save(order);
        model.addAttribute("page", "orderManagement.jsp");
        return "redirect:/admin/order-management";
    }


    @ModelAttribute("orders")
    public List<Order> getAllOrders() {
        List<Order> list = orderRepository.findByStatus();
        Collections.reverse(list);
        return list;
    }

    @ModelAttribute("orders1")
    public List<Order> getAllOrders1() {
        List<Order> list = orderRepository.findByStatus1();
        Collections.reverse(list);
        return list;
    }

    @ModelAttribute("orders2")
    public List<Order> getAllOrders2() {
        List<Order> list = orderRepository.findByStatus2();
        Collections.reverse(list);
        return list;
    }

    @ModelAttribute("orders3")
    public List<Order> getAllOrders3() {
        List<Order> list = orderRepository.findByStatus3();
        Collections.reverse(list);
        return list;
    }

    @ModelAttribute("orders4")
    public List<Order> getAllOrders4() {
        List<Order> list = orderRepository.findByStatus4();
        Collections.reverse(list);
        return list;
    }
}
