package com.poly.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class RouterController {

    // client
    private String setPageClient(Model model, String pageName) {
        model.addAttribute("page", pageName);
        return "client/index";
    }

    @GetMapping("/contact")
    public String contact(Model model) {
        return setPageClient(model, "contact.jsp");
    }

    @GetMapping("/checkout")
    public String checkout(Model model) {
        return setPageClient(model, "checkout.jsp");
    }

    @GetMapping("/blog")
    public String blog(Model model) {
        return setPageClient(model, "blog.jsp");
    }

    @GetMapping("/single-blog")
    public String singleBlog(Model model) {
        return setPageClient(model, "single-blog.jsp");
    }

    @GetMapping("/tracking-order")
    public String trackingOrder(Model model) {
        return setPageClient(model, "tracking-order.jsp");
    }
    // admin
    private String setPageAdmin(Model model, String pageName) {
        model.addAttribute("page", pageName);
        return "admin/index";
    }
}
