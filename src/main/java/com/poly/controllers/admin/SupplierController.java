package com.poly.controllers.admin;


import com.poly.entities.Supplier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin/supplier-management")
public class SupplierController {
    @ModelAttribute("supplier")
    public Supplier supplier() {
        return new Supplier();
    }

    @GetMapping("")
    public String ShowSupplierManagement(Model model){
        model.addAttribute("page", "supplierManagement.jsp");
        return "admin/index";
    }

    @GetMapping("/create")
    public String showCreateSupplierForm(Model model) {
        model.addAttribute("page", "supplierManagement.jsp");
        return "admin/index";
    }

    @PostMapping("/create")
    public String createSupplier(@ModelAttribute("supplier") Supplier supplier, Model model) {
        model.addAttribute("page", "supplierManagement.jsp");
        return "admin/index";
    }
}
