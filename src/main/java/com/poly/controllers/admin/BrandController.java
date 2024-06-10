package com.poly.controllers.admin;

import com.poly.entities.Brand;
import com.poly.repositories.BrandRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import java.util.List;

@Controller
@RequestMapping("/admin/brands-management")
public class BrandController {

    @Autowired
    private BrandRepository brandRepository;

    @ModelAttribute("brands")
    public List<Brand> getAllBrand() {
        return brandRepository.findAll();
    }

    @GetMapping("")
    public String brandsManagement(@ModelAttribute("brand") Brand brand, Model model) {
        model.addAttribute("disabledUpdate", "disabled");
        model.addAttribute("page", "brandsManagement.jsp");
        return "admin/index";
    }

    @PostMapping("/create")
    public String createBrand(@Validated @ModelAttribute("brand") Brand brand,
                              BindingResult result, Model model) {
        model.addAttribute("disabledUpdate", "disabled");
        if (!result.hasErrors()) {
            brandRepository.save(brand);
            return "redirect:/admin/brands-management";
        }
        model.addAttribute("page", "brandsManagement.jsp");
        return "admin/index";
    }

    @PostMapping("/update")
    public String update(@Validated @ModelAttribute("brand") Brand brand,
                         BindingResult result, Model model) {
        model.addAttribute("disabledSave", "disabled");
        if (!result.hasErrors()) {
            Brand brandUpdate = brandRepository.findById(brand.getBrandId()).orElse(null);
            brand.setBrandId(brandUpdate.getBrandId());
            brandRepository.save(brand);
            return "redirect:/admin/brands-management";
        }
        model.addAttribute("page", "brandsManagement.jsp");
        return "admin/index";
    }

    @GetMapping("/edit/{id}")
    public String edit(@PathVariable Long id, Model model) {
        model.addAttribute("disabledSave", "disabled");
        model.addAttribute("brand", brandRepository.findById(id).orElse(null));
        model.addAttribute("page", "brandsManagement.jsp");
        return "admin/index";
    }

    @GetMapping("/delete/{id}")
    public String delete(@PathVariable Long id, Model model) {
        brandRepository.deleteById(id);
        return "redirect:/admin/brands-management";
    }
}
