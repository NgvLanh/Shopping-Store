package com.poly.controllers.client;

import com.poly.entities.Customer;
import com.poly.repositories.CustomerRepository;
import com.poly.services.CookieService;
import com.poly.services.ParamService;
import com.poly.services.SessionService;
import jakarta.servlet.http.Cookie;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class LoginController {

    @Autowired
    ParamService paramService;

    @Autowired
    CookieService cookieService;

    @Autowired
    CustomerRepository customerRepository;

    @Autowired
    SessionService sessionService;

    @PostMapping("/login")
    public String login(Model model, @RequestParam("email") String email,
                        @RequestParam("password") String password,
                        @RequestParam(value = "remember", defaultValue = "false") Boolean remember,
                        RedirectAttributes redirectAttributes) {
        System.out.println(remember);
        // Check for empty email and password fields
        if (email.isEmpty() && password.isEmpty()) {
            model.addAttribute("emailError", "Please enter your email");
            model.addAttribute("passwordError", "Please enter your password");
            model.addAttribute("page", "login.jsp");
            return "client/index";
        }
        if (email.isEmpty()) {
            model.addAttribute("emailError", "Please enter your email");
            model.addAttribute("page", "login.jsp");
            return "client/index";
        }
        if (password.isEmpty()) {
            model.addAttribute("passwordError", "Please enter your password");
            model.addAttribute("page", "login.jsp");
            return "client/index";
        }

        try {
            // Attempt to find the user by email
            Customer customer = customerRepository.findByEmailLike(email);
            if (customer == null) {
                model.addAttribute("allError", "Your email or password is incorrect.");
                model.addAttribute("page", "login.jsp");
                return "client/index";
            }

            // Validate email and password
            if (customer.getPassword().equals(password)) {
                customer.setPassword("***");

                sessionService.set("customer", customer);
                // Handle remember me functionality
                if (remember) {
                    cookieService.add("email", email, 10);
                    System.out.println(cookieService.getValue("email"));
                }

                // Check if the account is activated
                if (!customer.getActivated()) {
                    model.addAttribute("allError", "Your account has been locked.");
                    model.addAttribute("page", "login.jsp");
                    return "client/index";
                }
                redirectAttributes.addFlashAttribute("customer", customer);
                // Redirect based on user role
                if (customer.getRole()) {
                    return "redirect:/admin/dashboard";
                } else {
                    return "redirect:/home";
                }
            } else {
                model.addAttribute("allError", "Your email or password is incorrect.");
            }
        } catch (Exception e) {
            e.printStackTrace();  // Optionally log the exception for debugging
        }

        model.addAttribute("page", "login.jsp");
        return "client/index";
    }


    @GetMapping("/login")
    public String getLogin(Model model) {
        model.addAttribute("page", "login.jsp");
        return "client/index";
    }

    @GetMapping("/logout")
    public String logout() {
        cookieService.remove("email");
        sessionService.remove("customer");
        return "redirect:/home";
    }
}
