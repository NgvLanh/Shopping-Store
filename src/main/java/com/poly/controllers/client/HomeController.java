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
                new Product(1L, "Product1", "Description1", 100.0, 10, null, "vscode.ico", "Category1", "Brand1", "Supplier1", Arrays.asList("Red", "Blue"), Arrays.asList("L", "S")),
                new Product(2L, "Product2", "Description2", 200.0, 20, null, "vscode.ico", "Category2", "Brand2", "Supplier2", Arrays.asList("Blue"), Arrays.asList("M")),
                new Product(3L, "Product3", "Description3", 300.0, 30, null, "vscode.ico", "Category3", "Brand3", "Supplier3", Arrays.asList("Green"), Arrays.asList("S")),
                new Product(4L, "Product4", "Description4", 400.0, 40, null, "vscode.ico", "Category4", "Brand4", "Supplier4", Arrays.asList("Yellow"), Arrays.asList("XL")),
                new Product(5L, "Product5", "Description5", 500.0, 50, null, "vscode.ico", "Category5", "Brand5", "Supplier5", Arrays.asList("Black"), Arrays.asList("XXL"))
        );
    }


}
