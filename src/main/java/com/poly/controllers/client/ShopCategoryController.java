package com.poly.controllers.client;

import com.poly.entities.Category;
import com.poly.entities.Supplier;
import com.poly.repositories.CategoryRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/category")
public class ShopCategoryController {
    @Autowired
    CategoryRepository categoryRepository;
    @ModelAttribute("categories")
    public List<Category> getAllCategory() {
        return categoryRepository.findAll();
    }
    @GetMapping("")
    public String category( Model model) {
        model.addAttribute("page", "category.jsp");
        return "client/index";
    }

}
