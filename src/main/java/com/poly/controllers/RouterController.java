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

//    @GetMapping("/home")
//    public String home(Model model) {
//        return setPageClient(model, "home.jsp");
//    }

    @GetMapping("/contact")
    public String contact(Model model) {
        return setPageClient(model, "contact.jsp");
    }

    @GetMapping("/category")
    public String category(Model model) {
        return setPageClient(model, "category.jsp");
    }

//    @GetMapping("/single-product")
//    public String singleProduct(Model model) {
//        return setPageClient(model, "single-product.jsp");
//    }

    @GetMapping("/checkout")
    public String checkout(Model model) {
        return setPageClient(model, "checkout.jsp");
    }

    @GetMapping("/confirmation")
    public String confirmation(Model model) {
        return setPageClient(model, "confirmation.jsp");
    }

    @GetMapping("/cart")
    public String cart(Model model) {
        return setPageClient(model, "cart.jsp");
    }

    @GetMapping("/blog")
    public String blog(Model model) {
        return setPageClient(model, "blog.jsp");
    }

    @GetMapping("/single-blog")
    public String singleBlog(Model model) {
        return setPageClient(model, "single-blog.jsp");
    }

    @GetMapping("/login")
    public String login(Model model) {
        return setPageClient(model, "login.jsp");
    }

//    @GetMapping("/register")
//    public String register(Model model) {
//        return setPageClient(model, "register.jsp");
//    }

    @GetMapping("/tracking-order")
    public String trackingOrder(Model model) {
        return setPageClient(model, "tracking-order.jsp");
    }

    // admin
    private String setPageAdmin(Model model, String pageName) {
        model.addAttribute("page", pageName);
        return "admin/index";
    }
    @GetMapping("/admin/dashboard")
    public String admin(Model model) {
        return setPageAdmin(model, "home.jsp");
    }

//    @GetMapping("/product-management")
//    public String productManagement(Model model) {
//        return setPageAdmin(model, "productManagement.jsp");
//    }
//    @GetMapping("/admin/customer-management")
//    public String customerManagement(Model model) {
//        return setPageAdmin(model, "customerManagement.jsp");
//    }
//    @GetMapping("/supplier-management")
//    public String supplierManagement(Model model) {
//        return setPageAdmin(model, "supplierManagement.jsp");
//    }
//    @GetMapping("/admin/review-management")
//    public String reviewManagement(Model model) {
//        return setPageAdmin(model, "reviewManagement.jsp");
//    }
//    @GetMapping("/admin/order-management")
//    public String orderManagement(Model model) {
//        return setPageAdmin(model, "orderManagement.jsp");
//    }

//    @GetMapping("/admin/brands-management")
//    public String bandsManagement(Model model) {
//        return setPageAdmin(model, "brandsManagement.jsp");
//    }
//
//    @GetMapping("/admin/categories-management")
//    public String categoriesManagement(Model model) {
//        return setPageAdmin(model, "categoriesManagement.jsp");
//    }
//    @GetMapping("/admin/size-color-management")
//    public String sizeColorManagement(Model model) {
//        return setPageAdmin(model, "sizeColorManagement.jsp");
//    }

//    @GetMapping("/admin/discounts-management")
//    public String discountsManagement(Model model) {
//        return setPageAdmin(model, "discountsManagement.jsp");
//    }
}
