package com.poly.controllers.admin;

import com.poly.entities.Customer;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin/dashboard")
public class DashboardController {
    @GetMapping("")
    public String dashboard(Model model) {
        model.addAttribute("page", "home.jsp");
        return "admin/index";
    }
}
