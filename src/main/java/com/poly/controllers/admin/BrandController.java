package com.poly.controllers.admin;

import com.poly.entities.Brand;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.atomic.AtomicLong;

@Controller
@RequestMapping("/admin/brands-management")
public class BrandController {
    private List<Brand> brandList = new ArrayList<>();
    private AtomicLong counter = new AtomicLong(5); // Assuming you already have 4 brands initialized

    public BrandController(){
        brandList.add(new Brand(1L,"Balenciaga","High-end fashion"));
        brandList.add(new Brand(2L,"Louis Vuitton","Luxury goods"));
        brandList.add(new Brand(3L,"Gucci","High-end fashion"));
        brandList.add(new Brand(4L,"Prada","Luxury goods"));
    }

    @GetMapping("")
    public String brandsManagement(@ModelAttribute("brand") Brand brand, Model model) {
        model.addAttribute("brands", brandList);
        model.addAttribute("page", "brandsManagement.jsp");
        return "admin/index";
    }

    @PostMapping("/create")
    public String createBrand(@Validated @ModelAttribute("brand") Brand brand,
                              BindingResult result,
                              Model model,
                              RedirectAttributes redirectAttributes) {
        if (result.hasErrors()) {
            model.addAttribute("page", "brandsManagement.jsp");
            return "admin/index";
        }

        // Check if brand exists, if so, update it, otherwise add new
        boolean brandExists = false;
        for (int i = 0; i < brandList.size(); i++) {
            if (brandList.get(i).getBrandId().equals(brand.getBrandId())) {
                brandList.set(i, brand);
                brandExists = true;
                break;
            }
        }

        if (!brandExists) {
            brand.setBrandId(counter.incrementAndGet());
            brandList.add(brand);
        }

        redirectAttributes.addFlashAttribute("message", "Brand saved successfully!");
        return "redirect:/admin/brands-management";
    }

    @GetMapping("/edit/{id}")
    public String update(@PathVariable Long id,
                         RedirectAttributes redirectAttributes) {
        Brand brand = brandList.stream()
                .filter(b -> b.getBrandId().equals(id))
                .findFirst()
                .orElse(null);

        if (brand != null) {
            redirectAttributes.addFlashAttribute("brand", brand);
        }

        return "redirect:/admin/brands-management";
    }

    @GetMapping("/delete/{id}")
    public String delete(@PathVariable Long id,
                         RedirectAttributes redirectAttributes) {
        brandList.removeIf(brand -> brand.getBrandId().equals(id));
        redirectAttributes.addFlashAttribute("message", "Brand deleted successfully!");
        return "redirect:/admin/brands-management";
    }

    @ModelAttribute("brands")
    public List<Brand> getAllBrand() {
        return brandList;
    }
}
