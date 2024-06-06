package com.poly.controllers.client;

import com.poly.entities.Product;
import com.poly.repositories.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Arrays;
import java.util.List;

@Controller
public class HomeController {

    @Autowired
    ProductRepository productRepository;

    @GetMapping("/home")
    public String home(Model model) {
        model.addAttribute("page", "home.jsp");
        return "/client/index";
    }


    @ModelAttribute("products")
    public List<Product> getAllProducts() {
        return productRepository.findAll();
    }



}
