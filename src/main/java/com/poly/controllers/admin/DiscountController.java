package com.poly.controllers.admin;

import com.poly.entities.Discount;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin/discounts-management")
public class DiscountController {
    @GetMapping("")
    public String discountsManagement(@ModelAttribute("discount") Discount discount, Model model) {
        model.addAttribute("page", "discountsManagement.jsp");
        return "admin/index";
    }
}
