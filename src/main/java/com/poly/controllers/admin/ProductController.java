package com.poly.controllers.admin;

import com.poly.entities.Product;
import com.poly.entities.ProductItem;
import com.poly.services.ParamService;
import jakarta.servlet.ServletContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.ArrayList;
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
    public String showProductManagement(@ModelAttribute("productItem") ProductItem productItem,
                                        Model model) {
        model.addAttribute("formAction", "/admin/product-management/create");
        model.addAttribute("page", "productManagement.jsp");
        return "admin/index";
    }

    @PostMapping("/create")
    public String createProduct(@Validated @ModelAttribute("productItem") ProductItem productItem,
                                BindingResult result,
                                Model model) {

//        if (!product.getFile().getOriginalFilename().isEmpty()) {
//            if (!result.hasErrors()) {
//                MultipartFile file = product.getFile();
//                paramService.save(file, "/uploads/");
//                product.setFileName(file.getOriginalFilename());
//            }
//        } else {
//            result.rejectValue("file", "NotNull.product.file");
//        }
//
//        if (!product.isEmpty()) {
//            model.addAttribute("status", "Create");
//            model.addAttribute("createSuccess", true);
//            product.setId(list.get(list.size() - 1).getId() + 1);
//            list.add(product);
////            return "redirect:/admin/product-management";
//        }
        model.addAttribute("page", "productManagement.jsp");
        return "admin/index";
    }

    @GetMapping("/edit/{id}")
    public String edit(@PathVariable Long id,
                       Model model) {

        Product productEdit = new Product();
        for (Product product : list) {
//            if (product.getId() == id) {
//                productEdit = product;
//                break;
//            }
        }
        model.addAttribute("product", productEdit);
        model.addAttribute("page", "productManagement.jsp");
        model.addAttribute("formAction", "/admin/product-management/update/" + id);
        return "admin/index";
    }

    @PostMapping("/update/{id}")
    public String update(@PathVariable Long id,
                         @Validated @ModelAttribute("productItem") ProductItem productItem,
                         BindingResult result,
                         Model model) {
//        System.out.println(id);
//        if (!product.getFile().getOriginalFilename().isEmpty()) {
//            if (!result.hasErrors()) {
//                list.removeIf(product1 -> product1.getId() == id);
//                MultipartFile file = product.getFile();
//                paramService.save(file, "/uploads/");
//                product.setFileName(file.getOriginalFilename());
//            }
//        } else {
//            result.rejectValue("file", "NotNull.product.file");
//        }
//
//        if (!product.isEmpty()) {
//            model.addAttribute("status", "Update");
//            model.addAttribute("createSuccess", true);
//            product.setId(id);
//            list.add(product);
//            list.sort((o1, o2) -> Long.compare(o1.getId(), o2.getId()));
////            return "redirect:/admin/product-management";
//        }

        model.addAttribute("page", "productManagement.jsp");
        return "admin/index";
    }

    @GetMapping("/delete/{id}")
    public String delete(@PathVariable Long id,
                         @ModelAttribute("productItem") ProductItem productItem) {
//        list.removeIf(product1 -> product1.getId() == id);
        return "redirect:/admin/product-management";
    }


    //
    List<Product> list = new ArrayList<>(List.of(
    ));

    @ModelAttribute("products")
    public List<Product> getAllProducts() {
        return list;
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

