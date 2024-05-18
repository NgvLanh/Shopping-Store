package com.poly.controllers.admin;

import com.poly.models.Product;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/product-management")
public class ProductController {
    @ModelAttribute("product")
    public Product product() {
        return new Product();
    }

    @GetMapping("")
    public String showProductManagement(Model model) {
        model.addAttribute("page", "productManagement.jsp");
        return "admin/index";
    }

    @GetMapping("/create")
    public String showCreateProductForm(Model model) {
        model.addAttribute("page", "productManagement.jsp");
        return "admin/index";
    }

    @PostMapping("/create")
    public String createProduct(@ModelAttribute("product") Product product, Model model) {
        // Logic to handle the product creation (e.g., save the product to the database)

        model.addAttribute("page", "productManagement.jsp");
        return "admin/index";
    }
}
