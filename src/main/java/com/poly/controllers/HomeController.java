package com.poly.controllers;

import com.poly.model.Customer;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class HomeController {

    // client
    private String setPage(Model model, String pageName) {
        model.addAttribute("page", pageName);
        return "client/index";
    }

    @GetMapping("/home")
    public String home(Model model) {
        return setPage(model, "home.jsp");
    }

    @GetMapping("/contact")
    public String contact(Model model) {
        return setPage(model, "contact.jsp");
    }

    @GetMapping("/category")
    public String category(Model model) {
        return setPage(model, "category.jsp");
    }

    @GetMapping("/single-product")
    public String singleProduct(Model model) {
        return setPage(model, "single-product.jsp");
    }

    @GetMapping("/checkout")
    public String checkout(Model model) {
        return setPage(model, "checkout.jsp");
    }

    @GetMapping("/confirmation")
    public String confirmation(Model model) {
        return setPage(model, "confirmation.jsp");
    }

    @GetMapping("/cart")
    public String cart(Model model) {
        return setPage(model, "cart.jsp");
    }

    @GetMapping("/blog")
    public String blog(Model model) {
        return setPage(model, "blog.jsp");
    }

    @GetMapping("/single-blog")
    public String singleBlog(Model model) {
        return setPage(model, "single-blog.jsp");
    }

    @GetMapping("/login")
    public String login(Model model) {
        return setPage(model, "login.jsp");
    }

    @GetMapping("/register")
    public String register(Model model) {
        return setPage(model, "register.jsp");
    }

    @GetMapping("/tracking-order")
    public String trackingOrder(Model model) {
        return setPage(model, "tracking-order.jsp");
    }

    // admin
    @GetMapping("/admin")
    public String admin() {
        return "admin/index";
    }
}
