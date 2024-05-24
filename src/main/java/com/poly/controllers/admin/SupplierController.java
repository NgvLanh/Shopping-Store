package com.poly.controllers.admin;


import com.poly.entities.Product;
import com.poly.entities.Supplier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.Arrays;
import java.util.List;

@Controller
@RequestMapping("/admin/supplier-management")
public class SupplierController {


    @GetMapping("")
    public String ShowSupplierManagement(@ModelAttribute("supplier") Supplier supplier, Model model) {


        model.addAttribute("page", "supplierManagement.jsp");
        return "admin/index";
    }

    @PostMapping("/create")
    public String createSupplier(@Validated @ModelAttribute("supplier") Supplier supplier, BindingResult result,
                                 Model model, RedirectAttributes redirectAttributes) {
        if (result.hasErrors()) {
            model.addAttribute("page", "supplierManagement.jsp");
            return "admin/index";
        }
        assert supplier != null;
        if (!supplier.isEmpty()) {
            model.addAttribute("createSuccess", true);
        }
        redirectAttributes.addFlashAttribute("supplier", supplier);
        return "redirect:/admin/supplier-management";
    }

    @GetMapping("/{id}")
    public String update(@PathVariable String id,
                         RedirectAttributes redirectAttributes) {
        Supplier supplier = getAllSuppliers().get(Integer.parseInt(id) - 1);
        redirectAttributes.addFlashAttribute("supplier", supplier);
        return "redirect:/admin/supplier-management";
    }

    @ModelAttribute("suppliers")
    public List<Supplier> getAllSuppliers() {
        return Arrays.asList(
                new Supplier(1L, "Jacob", "NgVanTien", "0834619802", "tiennvpc06608@gmail.com", "Xóm Chài", "Cần Thơ"),
                new Supplier(2L, "Ronaldo", "NgVanTien", "0834619802", "tiennvpc06608@gmail.com", "Xóm Chài", "Cần Thơ"),
                new Supplier(3L, "John", "NgVanTien", "0834619802", "tiennvpc06608@gmail.com", "Xóm Chài", "Cần Thơ"),
                new Supplier(4L, "Peter", "NgVanTien", "0834619802", "tiennvpc06608@gmail.com", "Xóm Chài", "Cần Thơ"),
                new Supplier(5L, "Dave", "NgVanTien", "0834619802", "tiennvpc06608@gmail.com", "Xóm Chài", "Cần Thơ")
        );
    }

}
