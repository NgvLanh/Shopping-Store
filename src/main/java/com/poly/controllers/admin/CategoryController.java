package com.poly.controllers.admin;

import com.poly.entities.Category;
import com.poly.repositories.CategoryRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import java.util.List;

@Controller
@RequestMapping("/admin/categories-management")
public class CategoryController {
    @Autowired
    private CategoryRepository categoryRepository;

    @ModelAttribute("categories")
    public List<Category> getACategories() {
        return categoryRepository.findAll();
    }

    @GetMapping("")
    public String categoriesManagement(@ModelAttribute("category") Category category, Model model) {
        model.addAttribute("disabledUpdate", "disabled");
        model.addAttribute("page", "categoriesManagement.jsp");
        return "admin/index";
    }

    @PostMapping("/create")
    public String createOrUpdateCategory(@Validated @ModelAttribute("category") Category category,
                                         BindingResult result, Model model) {
        if (result.hasErrors()) {
            model.addAttribute("disabledUpdate", "disabled");
            model.addAttribute("page", "categoriesManagement.jsp");
            return "admin/index";
        }
        categoryRepository.save(category);
        return "redirect:/admin/categories-management";
    }

    @PostMapping("/update/{id}")
    public String update(@Validated @ModelAttribute("category") Category category,
                         BindingResult result,
                         @PathVariable Long id, Model model) {
        if (!result.hasErrors()) {
            Category categoryUpdate = categoryRepository.findById(id).orElse(null);
            if (categoryUpdate != null) {
                category.setCategoryId(categoryUpdate.getCategoryId());
                categoryRepository.save(category);
                return "redirect:/admin/categories-management";
            }
        }
        model.addAttribute("page", "categoriesManagement.jsp");
        return "admin/index";
    }

    @GetMapping("/edit/{id}")
    public String edit(@PathVariable Long id, Model model) {
        model.addAttribute("disabledSave", "disabled");
        Category category = categoryRepository.findById(id).orElse(null);
        if (category != null) {
            model.addAttribute("category", category);
        }
        model.addAttribute("page", "categoriesManagement.jsp");
        return "admin/index";
    }

    @GetMapping("/delete/{id}")
    public String delete(@PathVariable Long id) {
        categoryRepository.deleteById(id);
        return "redirect:/admin/categories-management";
    }
}
