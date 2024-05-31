package com.poly.controllers.admin;

import com.poly.entities.Discount;
import com.poly.entities.ProductItem;
import com.poly.entities.Review;
import com.poly.repositories.DiscountRepository;
import com.poly.repositories.ProductItemRepository;
import com.poly.repositories.ReviewRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.sql.Timestamp;
import java.util.List;

@Controller
@RequestMapping("/admin/discounts-management")
public class DiscountController {

    @Autowired
    DiscountRepository discountRepository;

    @Autowired
    ProductItemRepository productItemRepository;

    @GetMapping("")
    public String discountsManagement(@ModelAttribute("discount") Discount discount, Model model) {
        model.addAttribute("disabledUpdate", "disabled");
        model.addAttribute("page", "discountsManagement.jsp");
        return "admin/index";
    }

    @PostMapping("/create")
    public String create(@Validated @ModelAttribute("discount") Discount discount,
                         BindingResult result,
                         Model model) {
        discount.setCreateTime(new Timestamp(System.currentTimeMillis()));
        model.addAttribute("disabledUpdate", "disabled");
        if (!result.hasErrors()) {
            discountRepository.save(discount);
        }
        model.addAttribute("page", "discountsManagement.jsp");
        return "admin/index";
    }

    @PostMapping("/update")
    public String update(@ModelAttribute("discount") Discount discount, Model model) {
        model.addAttribute("disabledSave", "disabled");
        discountRepository.save(discount);
        model.addAttribute("page", "discountsManagement.jsp");
        return "admin/index";
    }

    @GetMapping("/edit/{id}")
    public String edit(Model model, @PathVariable Long id) {
        model.addAttribute("disabledSave", "disabled");
        Discount discount = discountRepository.findById(id).orElse(null);
        model.addAttribute("discount", discount);
        model.addAttribute("page", "discountsManagement.jsp");
        return "admin/index";
    }

    @GetMapping("/delete/{id}")
    public String delete(Model model, @PathVariable Long id) {
        model.addAttribute("disabledSave", "disabled");
        Discount discount = discountRepository.findById(id).orElse(null);
        model.addAttribute("discount", discount);
        model.addAttribute("page", "discountsManagement.jsp");
        return "admin/index";
    }

    @ModelAttribute("discounts")
    public List<Discount> getAllReviews() {
        return discountRepository.findAll();
    }

    @ModelAttribute("productItemList")
    public List<ProductItem> getAllProductItems() {
        return productItemRepository.findAll();
    }
}
