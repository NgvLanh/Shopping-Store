package com.poly.controllers.admin;

import com.poly.entities.Product;
import com.poly.services.ParamService;
import jakarta.servlet.ServletContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/admin/product-management")
public class ProductController {

    @Autowired
    ServletContext context;

    @Autowired
    ParamService paramService;

    @GetMapping("")
    public String showProductManagement(@ModelAttribute("product") Product product,
                                        Model model) {
        model.addAttribute("page", "productManagement.jsp");
        product.print();
        return "admin/index";
    }

    @PostMapping("/create")
    public String createProduct(@ModelAttribute("product") Product product,
                                RedirectAttributes redirectAttributes) {
        if (!product.getFile().isEmpty()) {
            paramService.save(product.getFile(), "/uploads/");
            product.setFileName(product.getFile().getOriginalFilename());
        }
        redirectAttributes.addFlashAttribute("product", product);
        return "redirect:/admin/product-management";
    }
}

