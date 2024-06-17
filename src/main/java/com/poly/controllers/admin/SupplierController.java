package com.poly.controllers.admin;


import com.poly.entities.Brand;
import com.poly.entities.Product;
import com.poly.entities.Supplier;
import com.poly.repositories.SupplierRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/admin/supplier-management")
public class SupplierController {
    @Autowired
    private SupplierRepository supplierRepository;

    @ModelAttribute("suppliers")
    public List<Supplier> getAllSupplier() {
        return supplierRepository.findAll();
    }

    @GetMapping("")
    public String supplierManagement(@ModelAttribute("supplier") Supplier supplier, Model model) {
        model.addAttribute("disabledUpdate", "disabled");
        model.addAttribute("page", "supplierManagement.jsp");
        return "admin/index";
    }

    @PostMapping("/create")
    public String createBrand(@Validated @ModelAttribute("supplier") Supplier supplier,
                              BindingResult result, Model model) {
        model.addAttribute("disabledUpdate", "disabled");
        if (!result.hasErrors()) {
            supplierRepository.save(supplier);
            return "redirect:/admin/supplier-management";
        }
        model.addAttribute("page", "supplierManagement.jsp");
        return "admin/index";
    }

    @GetMapping("/edit/{id}")
    public String edit(@PathVariable Long id, Model model) {
        model.addAttribute("disabledSave", "disabled");
        model.addAttribute("supplier", supplierRepository.findById(id).orElse(null));
        model.addAttribute("page", "supplierManagement.jsp");
        return "admin/index";
    }

    @PostMapping("/update/{id}")
    public String update(@Validated @ModelAttribute("supplier") Supplier supplier,
                         BindingResult result, Model model) {
        model.addAttribute("disabledSave", "disabled");
        if (!result.hasErrors()) {
            Supplier supplierUpdate = supplierRepository.findById(supplier.getSupplierId()).orElse(null);
            supplierUpdate.setSupplierId(supplierUpdate.getSupplierId());
            supplierRepository.save(supplier);
            return "redirect:/admin/supplier-management";
        }
        model.addAttribute("page", "supplierManagement.jsp");
        return "admin/index";
    }

    @GetMapping("/delete/{id}")
    public String delete(@PathVariable Long id,
                         Model model,
                         @ModelAttribute("supplier") Supplier supplier) {
        try {
            supplierRepository.deleteById(id);
        } catch (Exception e) {
            model.addAttribute("msgDeleteProduct", true);
        }
        model.addAttribute("page", "supplierManagement.jsp");
        return "admin/index";
    }


}
