package com.poly.controllers.client;

import com.poly.entities.Product;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;

import java.util.Arrays;
import java.util.List;

@Controller
public class HomeController {
    @GetMapping("/home")
    public String home(Model model) {
        model.addAttribute("page","home.jsp");
       return "/client/index";
    }
    @ModelAttribute("products")
    public List<Product> getAllProducts() {
        return Arrays.asList(

        );
    }


}
