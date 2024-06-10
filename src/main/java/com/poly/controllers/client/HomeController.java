package com.poly.controllers.client;

import com.poly.entities.Customer;
import com.poly.entities.Product;
import com.poly.entities.ProductItem;
import com.poly.repositories.ProductItemRepository;
import com.poly.repositories.ProductRepository;
import com.poly.services.SessionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.Set;

@Controller
public class HomeController {

    @Autowired
    ProductRepository productRepository;

    @Autowired
    ProductItemRepository productItemRepository;

    @Autowired
    SessionService sessionService;

    @GetMapping("/home")
    public String home(Model model) {
        model.addAttribute("page", "home.jsp");
        return "/client/index";
    }


    @ModelAttribute("productItemsList")
    public List<ProductItem> getAllProducts() {
        List<ProductItem> list = productItemRepository.findDistinctProductItems();
        Collections.shuffle(list);
        return list;
    }
}
