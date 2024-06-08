package com.poly.controllers.client;

import com.poly.entities.Customer;
import com.poly.repositories.CustomerRepository;
import com.poly.services.CookieService;
import com.poly.services.ParamService;
import com.poly.services.SessionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.*;

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
                        @RequestParam("password") String password) {
        boolean remember = paramService.getBoolean("remember", false);
        if(email.isEmpty() && password.isEmpty()){
            model.addAttribute("emailError","Invalid email");
            model.addAttribute("passwordError","Invalid password");
            model.addAttribute("page", "login.jsp");
            return "client/index";
        }
        if (email.isEmpty()){
            model.addAttribute("emailError","Invalid email");
            model.addAttribute("page", "login.jsp");
            return "client/index";
        }
        if (password.isEmpty()){
            model.addAttribute("passwordError","Invalid password");
            model.addAttribute("page", "login.jsp");
            return "client/index";
        }


        try {
            Customer user = customerRepository.findByEmailLike(email);
            if(user.getEmail().equals(email) && user.getPassword().equals(password)){
                sessionService.set("email", email);

                if (user.getActivated()) {
                    model.addAttribute("message", "This account has been locked");
                }
                //cookie chx lay dc email
                if (remember) {
                    cookieService.add("email", email, 10);
                } else {
                    cookieService.remove("email");
                }
                if (user.getRole()) {
                    return "redirect:/admin/dashboard";
                } else {
                    return "redirect:/home";
                }
            }
        } catch (Exception e) {
            model.addAttribute("emailError", "Invalid email");

        }
        model.addAttribute("page", "login.jsp");
        return "client/index";

    }

    @GetMapping("/login")
    public String getLogin(@ModelAttribute("login") Customer customer, Model model) {
        String email = cookieService.getValue("email");
        if (email != null) {
            model.addAttribute("email", email);
        }
        model.addAttribute("page", "login.jsp");
        return "client/index";
    }

    @GetMapping("/logout")
    public String logout() {
        return "redirect:/home";
    }
}
