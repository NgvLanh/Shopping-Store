package com.poly.controllers.client;

import com.poly.entities.Order;
import com.poly.repositories.OrderRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
@RequestMapping("/confirmation")
public class ConfirmationController {
    @Autowired
    OrderRepository orderRepository;

    @GetMapping
    public String confirmation(Model model) {
        model.addAttribute("page", "confirmation.jsp");
        return "client/index";
    }

}
