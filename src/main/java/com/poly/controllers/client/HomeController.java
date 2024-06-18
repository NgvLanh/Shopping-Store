package com.poly.controllers.client;

import com.poly.entities.BestSellerProduct;
import com.poly.entities.OrderItem;
import com.poly.entities.Product;
import com.poly.entities.ProductItem;
import com.poly.repositories.*;
import com.poly.services.SessionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.*;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Optional;


@Controller
@RequestMapping("/home")
public class HomeController {

    @Autowired
    ProductRepository productRepository;

    @Autowired
    ProductItemRepository productItemRepository;
    @Autowired
    PaymentRepository paymentRepository;
    @Autowired
    SessionService sessionService;

    @GetMapping
    public String home(@RequestParam("page") Optional<Integer> page,
                       Model model) {
        Pageable pageable = PageRequest.of(page.orElse(0), 4);
        Page<Product> products = productRepository.findAll(pageable);
        model.addAttribute("trendingProducts", products);
        model.addAttribute("page", "home.jsp");
        return "/client/index";
    }

    @ModelAttribute("productItemsList")
    public List<ProductItem> getAllProducts() {
        List<ProductItem> list = productItemRepository.findDistinctProductItems();
        Collections.shuffle(list);
        return list;
    }

    @ModelAttribute("bestSellers")
    public List<BestSellerProduct> bestSellers() {
        return paymentRepository.getBestSellers();
    }


}
