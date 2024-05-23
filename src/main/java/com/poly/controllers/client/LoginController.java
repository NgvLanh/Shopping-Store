package com.poly.controllers.client;
import com.poly.entities.Customer;
import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class LoginController {

    @PostMapping("/login")
    public String login(Customer customer, HttpSession session) {
        String email = "lanhnvpc06581@fpt.edu.vn";
        String password = "admin";
        if (customer.getPassword().equals(password) && customer.getEmail().equals(email)) {
            session.setAttribute("role", true);
            return "redirect:/admin";
        } else {
            return "redirect:/login";
        }
    }
}
