package com.poly.controllers.client;

import com.poly.entities.*;
import com.poly.repositories.*;
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
    @Autowired
    BrandRepository brandRepository;
    @Autowired
    ColorRepository colorRepository;
    @Autowired
    SizeRepository sizeRepository;


    @ModelAttribute("categoriesAndProducts")
    public List<Object[]> getCategoriesAndProducts() {
        return categoryRepository.findCategoriesAndProductsAndPrices();
    }
    @ModelAttribute("sizes")
    public List<Size> getAllSize() {
        return sizeRepository.findAll();
    }
    @ModelAttribute("colors")
    public List<Color> getAllColor() {
        return colorRepository.findAll();
    }

    @ModelAttribute("brands")
    public List<Brand> getAllBrand() {
        return brandRepository.findAll();
    }

    @ModelAttribute("categories")
    public List<Category> getAllCategory() {
        return categoryRepository.findAll();
    }

    @GetMapping("")
    public String category(Model model) {
        model.addAttribute("page", "category.jsp");
        return "client/index";
    }

}
