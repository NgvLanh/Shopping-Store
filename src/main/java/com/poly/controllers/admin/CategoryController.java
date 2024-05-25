package com.poly.controllers.admin;

import com.poly.entities.Category;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/admin/categories-management")
public class CategoryController {
    private List<Category> categoryList = new ArrayList<>();

    public CategoryController() {
        // Initialize some categories
        categoryList.add(new Category(1L, "T-Shirt1", "description"));
        categoryList.add(new Category(2L, "T-Shirt2", "description"));
        categoryList.add(new Category(3L, "T-Shirt3", "description"));
        categoryList.add(new Category(4L, "T-Shirt4", "description"));
        categoryList.add(new Category(5L, "T-Shirt5", "description"));
        categoryList.add(new Category(6L, "T-Shirt6", "description"));
    }

    @GetMapping("")
    public String categoriesManagement(@ModelAttribute("category") Category category, Model model) {
        model.addAttribute("categories", categoryList);
        model.addAttribute("page", "categoriesManagement.jsp");
        return "admin/index";
    }

    @PostMapping("/create")
    public String createOrUpdateCategory(@Validated @ModelAttribute("category") Category category,
                                         BindingResult result,
                                         Model model,
                                         RedirectAttributes redirectAttributes) {

        if (result.hasErrors()) {
            model.addAttribute("page", "categoriesManagement.jsp");
            return "admin/index";
        }

        // Check if category exists, if so, update it, otherwise add new
        boolean categoryExists = false;
        for (int i = 0; i < categoryList.size(); i++) {
            if (categoryList.get(i).getCategoryId().equals(category.getCategoryId())) {
                categoryList.set(i, category);
                categoryExists = true;
                break;
            }
        }

        if (!categoryExists) {
            category.setCategoryId((long) (categoryList.size() + 1));
            categoryList.add(category);
        }

        redirectAttributes.addFlashAttribute("message", "Category saved successfully!");
        return "redirect:/admin/categories-management";
    }

    @GetMapping("/{id}")
    public String update(@PathVariable Long id,
                         RedirectAttributes redirectAttributes) {
        Category category = categoryList.stream()
                .filter(c -> c.getCategoryId().equals(id))
                .findFirst()
                .orElse(null);

        redirectAttributes.addFlashAttribute("category", category);
        return "redirect:/admin/categories-management";
    }

    @GetMapping("/delete/{id}")
    public String delete(@PathVariable Long id,
                         RedirectAttributes redirectAttributes) {
        categoryList.removeIf(category -> category.getCategoryId().equals(id));
        redirectAttributes.addFlashAttribute("message", "Category deleted successfully!");
        return "redirect:/admin/categories-management";
    }

    @ModelAttribute("categories")
    public List<Category> getAllCategory() {
        return categoryList;
    }
}
