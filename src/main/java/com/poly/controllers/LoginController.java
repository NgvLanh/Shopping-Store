package com.poly.controllers;
import com.poly.models.Customer;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class LoginController {

    @PostMapping("/login")
    public String login(Customer customer) {
        String email = "lanhnvpc06581@fpt.edu.vn";
        String password = "admin";
        if (customer.getPassword().equals(password) && customer.getEmail().equals(email)) {
            return "redirect:/admin";
        } else {
            return "redirect:/home";
        }
    }
}
