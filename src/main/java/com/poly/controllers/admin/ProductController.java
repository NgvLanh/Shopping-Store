package com.poly.controllers.admin;

import com.poly.entities.Product;
import com.poly.services.ParamService;
import jakarta.servlet.ServletContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.Arrays;
import java.util.List;

@Controller
@RequestMapping("/admin/product-management")
public class ProductController {

    @Autowired
    ServletContext context;

    @Autowired
    ParamService paramService;

    @GetMapping("")
    public String showProductManagement(@ModelAttribute("product") Product product,
                                        Model model) {
        assert product != null;
        if (!product.isEmpty()) {
            model.addAttribute("createSuccess", true);
        }

        model.addAttribute("page", "productManagement.jsp");
        return "admin/index";
    }

    @PostMapping("/create")
    public String createProduct(@Validated @ModelAttribute("product") Product product,
                                BindingResult result,
                                Model model,
                                RedirectAttributes redirectAttributes) {

        MultipartFile file = product.getFile();
        if (file == null || file.isEmpty()) {
            result.rejectValue("file", "NotNull.product.file");
            model.addAttribute("page", "productManagement.jsp");
            return "admin/index";
        }

        if (result.hasErrors()) {
            model.addAttribute("page", "productManagement.jsp");
            return "admin/index";
        }

        paramService.save(file, "/uploads/");
        product.setFileName(file.getOriginalFilename());

        redirectAttributes.addFlashAttribute("product", product);
        return "redirect:/admin/product-management";
    }

    @GetMapping("/{id}")
    public String update(@PathVariable String id,
                         RedirectAttributes redirectAttributes) {
        Product product = getAllProducts().get(Integer.parseInt(id) - 1);
        redirectAttributes.addFlashAttribute("product", product);
        return "redirect:/admin/product-management";
    }


//

    @ModelAttribute("products")
    public List<Product> getAllProducts() {
        return Arrays.asList(
                new Product(1L, "Product1", "Description1", 100.0, 10, null, "vscode.ico", "Category1", "Brand1", "Supplier1", Arrays.asList("Red", "Blue"), Arrays.asList("L", "S")),
                new Product(2L, "Product2", "Description2", 200.0, 20, null, "vscode.ico", "Category2", "Brand2", "Supplier2", Arrays.asList("Blue"), Arrays.asList("M")),
                new Product(3L, "Product3", "Description3", 300.0, 30, null, "vscode.ico", "Category3", "Brand3", "Supplier3", Arrays.asList("Green"), Arrays.asList("S")),
                new Product(4L, "Product4", "Description4", 400.0, 40, null, "vscode.ico", "Category4", "Brand4", "Supplier4", Arrays.asList("Yellow"), Arrays.asList("XL")),
                new Product(5L, "Product5", "Description5", 500.0, 50, null, "vscode.ico", "Category5", "Brand5", "Supplier5", Arrays.asList("Black"), Arrays.asList("XXL"))
        );
    }
    @ModelAttribute("brands")
    public List<String> getAllBrands() {
        return Arrays.asList("Brand1", "Brand2", "Brand3", "Brand4", "Brand5");
    }

    @ModelAttribute("categories")
    public List<String> getAllCategories() {
        return Arrays.asList("Category1", "Category2", "Category3", "Category4", "Category5");
    }
    @ModelAttribute("suppliers")
    public List<String> getAllSuppliers() {
        return Arrays.asList("Supplier1", "Supplier2", "Supplier3", "Supplier4", "Supplier5");
    }
    @ModelAttribute("colors")
    public List<String> getAllColors() {
        return Arrays.asList("Red", "Blue", "Green", "Yellow", "Black");
    }

    @ModelAttribute("sizes")
    public List<String> getAllSizes() {
        return Arrays.asList("L", "S", "M", "XL", "XXL");
    }

}

