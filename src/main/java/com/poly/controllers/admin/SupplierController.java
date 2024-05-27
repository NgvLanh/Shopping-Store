package com.poly.controllers.admin;


import com.poly.entities.Product;
import com.poly.entities.Supplier;
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


    @GetMapping("")
    public String ShowSupplierManagement(@ModelAttribute("supplier") Supplier supplier, Model model) {

        model.addAttribute("formAction", "/admin/supplier-management/create");
        model.addAttribute("page", "supplierManagement.jsp");
        return "admin/index";
    }

    @PostMapping("/create")
    public String createSupplier(@Validated @ModelAttribute("supplier") Supplier supplier, BindingResult result,
                                 Model model) {
        if (result.hasErrors()) {
            model.addAttribute("page", "supplierManagement.jsp");
            return "admin/index";
        }
//        assert supplier != null;
        if (!supplier.isEmpty()) {
            model.addAttribute("status", "Create");
            model.addAttribute("createSuccess", true);
//            supplier.setId(list.get(list.size() - 1).getId() + 1);
            list.add(supplier);
        }
        model.addAttribute("page", "supplierManagement.jsp");
        return "admin/index";
    }

    @GetMapping("/edit/{id}")
    public String edit(@PathVariable Long id,
                       Model model) {

        Supplier supplierEdit = new Supplier();
        for (Supplier supplier : list) {
//            if (supplier.getId() == id) {
//                supplierEdit = supplier;
//                break;
//            }
        }
        model.addAttribute("supplier", supplierEdit);
        model.addAttribute("page", "supplierManagement.jsp");
        model.addAttribute("formAction", "/admin/supplier-management/update/" + id);
        return "admin/index";
    }
        @PostMapping("/update/{id}")
    public String update(@PathVariable Long id,
                         @Validated @ModelAttribute("supplier") Supplier supplier,
                         BindingResult result,
                         Model model) {


            if (!result.hasErrors()) {
//                list.removeIf(product1 -> product1.getId() == id);
            }

        if (!supplier.isEmpty()) {
            model.addAttribute("status", "Update");
            model.addAttribute("createSuccess", true);
//            supplier.setId(id);
            list.add(supplier);

        }

        model.addAttribute("page", "supplierManagement.jsp");
        return "admin/index";
    }
    @GetMapping("/delete/{id}")
    public String delete(@PathVariable Long id,
                         @ModelAttribute("supplier") Supplier supplier) {
//        list.removeIf(supplier1 -> supplier1.getId() == id);
        return "redirect:/admin/supplier-management";
    }

    List<Supplier> list = new ArrayList<>(List.of(
//            new Supplier(1L, "Jacob", "NgVanTien", "0834619802", "tiennvpc06608@gmail.com", "Xóm Chài", "Cần Thơ"),
//            new Supplier(2L, "Ronaldo", "NgVanTien", "0834619802", "tiennvpc06608@gmail.com", "Xóm Chài", "Cần Thơ"),
//            new Supplier(3L, "John", "NgVanTien", "0834619802", "tiennvpc06608@gmail.com", "Xóm Chài", "Cần Thơ"),
//            new Supplier(4L, "Peter", "NgVanTien", "0834619802", "tiennvpc06608@gmail.com", "Xóm Chài", "Cần Thơ"),
//            new Supplier(5L, "Dave", "NgVanTien", "0834619802", "tiennvpc06608@gmail.com", "Xóm Chài", "Cần Thơ")
    ));

    @ModelAttribute("suppliers")
    public List<Supplier> getAllSuppliers() {
        return list;
    }

}
