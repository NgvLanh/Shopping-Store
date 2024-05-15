package com.poly.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {
    @GetMapping("/home")
    public String home() {
        return "index";
    }

    @GetMapping("/contact")
    public void contact() {
    }

    @GetMapping("/category")
    public void category() {
    }

    @GetMapping("/single-product")
    public void singleProduct() {
    }

    @GetMapping("/checkout")
    public void checkout() {
    }

    @GetMapping("/confirmation")
    public void confirmation() {
    }

    @GetMapping("/cart")
    public void cart() {
    }

    @GetMapping("/blog")
    public void blog() {
    }

    @GetMapping("/single-blog")
    public void singleBlog() {
    }

    @GetMapping("/login")
    public void login() {
    }

    @GetMapping("/register")
    public void register() {
    }

    @GetMapping("/tracking-order")
    public void trackingOrder() {
    }
}
