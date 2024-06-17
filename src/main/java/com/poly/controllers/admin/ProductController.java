package com.poly.controllers.admin;

import com.poly.entities.*;
import com.poly.repositories.*;
import com.poly.services.ParamService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.Collections;
import java.util.List;

@Controller
@RequestMapping("/admin/product-management")
public class ProductController {

    @Autowired
    ParamService paramService;

    @Autowired
    ProductRepository productRepository;

    @Autowired
    BrandRepository brandRepository;

    @Autowired
    CategoryRepository categoryRepository;

    @Autowired
    SupplierRepository supplierRepository;

    @Autowired
    ColorRepository colorRepository;

    @Autowired
    SizeRepository sizeRepository;

    @GetMapping("")
    public String showProductManagement(@ModelAttribute("product") Product product,
                                        Model model) {
        model.addAttribute("disabledUpdate", "disabled");
        model.addAttribute("page", "productManagement.jsp");
        return "admin/index";
    }

    @PostMapping("/create")
    public String createProduct(@Validated @ModelAttribute("product") Product product,
                                BindingResult result,
                                @RequestPart("photo") MultipartFile file,
                                Model model) {
        model.addAttribute("disabledUpdate", "disabled");
        if (!file.isEmpty()) {
            if (!result.hasErrors()) {
                paramService.save(file, "/uploads/");
                product.setImage(file.getOriginalFilename());
                productRepository.save(product);
                return "redirect:/admin/product-management";
            }
        } else {
            model.addAttribute("msgImage", "Please upload a product image.");
        }
        model.addAttribute("page", "productManagement.jsp");
        return "admin/index";
    }

    @GetMapping("/edit/{id}")
    public String edit(@PathVariable Long id,
                       Model model) {
        Product product = productRepository.findById(id).orElse(null);
        model.addAttribute("disabledSave", "disabled");
        model.addAttribute("product", product);
        model.addAttribute("srcImage", product.getImage());
        model.addAttribute("page", "productManagement.jsp");
        return "admin/index";
    }

    @PostMapping("/update")
    public String update(@Validated @ModelAttribute("product") Product product,
                         BindingResult result,
                         @RequestPart("photo") MultipartFile file,
                         Model model) {
        model.addAttribute("disabledSave", "disabled");
        if (file.isEmpty() && !product.getImage().isEmpty()) {
            if (!result.hasErrors()) {
                productRepository.save(product);
                return "redirect:/admin/product-management";
            }
        } else if (!file.isEmpty()) {
            if (!result.hasErrors()) {
                paramService.save(file, "/uploads/");
                product.setImage(file.getOriginalFilename());
                productRepository.save(product);
                return "redirect:/admin/product-management";
            }
        } else {
            model.addAttribute("msgImage", "Please upload a product image.");
        }
        model.addAttribute("page", "productManagement.jsp");
        return "admin/index";
    }

    @GetMapping("/delete/{id}")
    public String delete(@PathVariable Long id,
                         Model model,
                         @ModelAttribute("product") Product product) {
        try {
            productRepository.deleteById(id);
        } catch (Exception e) {
            model.addAttribute("msgDeleteProduct", true);
        }
        model.addAttribute("page", "productManagement.jsp");
        return "admin/index";
    }


    @ModelAttribute("products")
    public List<Product> getAllProducts() {
        List<Product> products = productRepository.findAll();
        Collections.reverse(products);
        return products;
    }

    @ModelAttribute("brands")
    public List<Brand> getAllBrands() {
        return brandRepository.findAll();
    }

    @ModelAttribute("categories")
    public List<Category> getAllCategories() {
        return categoryRepository.findAll();
    }

    @ModelAttribute("suppliers")
    public List<Supplier> getAllSuppliers() {
        return supplierRepository.findAll();
    }

    @ModelAttribute("colors")
    public List<Color> getAllColors() {
        return colorRepository.findAll();
    }

    @ModelAttribute("sizes")
    public List<Size> getAllSizes() {
        return sizeRepository.findAll();
    }

}

