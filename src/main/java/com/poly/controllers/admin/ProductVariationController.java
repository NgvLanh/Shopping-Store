package com.poly.controllers.admin;

import com.poly.entities.*;
import com.poly.repositories.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping("/admin/product-variation-management")
public class ProductVariationController {

    @Autowired
    ProductRepository productRepository;
    @Autowired
    ProductItemRepository productItemRepository;
    @Autowired
    ColorRepository colorRepository;
    @Autowired
    SizeRepository sizeRepository;

    @GetMapping("")
    public String index(@ModelAttribute("productItem") ProductItem productItem,
                        Model model) {
        model.addAttribute("disabledUpdate", "disabled");
        model.addAttribute("page", "productVariationManagement.jsp");
        return "admin/index";
    }

    @PostMapping("/create")
    public String createProduct(@Validated @ModelAttribute("productItem") ProductItem productItem,
                                BindingResult result,
                                Model model) {
        model.addAttribute("disabledUpdate", "disabled");
        if (!result.hasErrors()) {
            productItemRepository.save(productItem);
            return "redirect:/admin/product-variation-management";
        }
        model.addAttribute("page", "productVariationManagement.jsp");
        return "admin/index";
    }

    @GetMapping("/edit/{id}")
    public String edit(@PathVariable Long id, Model model) {
        model.addAttribute("disabledSave", "disabled");
        ProductItem productItem = productItemRepository.findById(id).orElse(null);
        model.addAttribute("productItem", productItem);
        model.addAttribute("page", "productVariationManagement.jsp");
        return "admin/index";
    }


    @PostMapping("/update")
    public String update(@Validated @ModelAttribute("productItem") ProductItem productItem,
                         BindingResult result,
                         Model model) {
        model.addAttribute("disabledSave", "disabled");
        if (!result.hasErrors()) {
            productItemRepository.save(productItem);
            return "redirect:/admin/product-variation-management";
        }
        model.addAttribute("page", "productVariationManagement.jsp");
        return "admin/index";
    }

    @GetMapping("/delete/{id}")
    public String delete(@PathVariable Long id) {
        productItemRepository.deleteById(id);
        return "redirect:/admin/product-variation-management";
    }

    @GetMapping({"/sort", "/page"})
    public String sort(@RequestParam("column") Optional<String> columnName,
                       @RequestParam("page") Optional<Integer> page,
                       @ModelAttribute("productItem") ProductItem productItem,
                       Model model) {
        Sort sort = Sort.by(Sort.Direction.ASC, columnName.orElse("productItemId"));
        Pageable pageable = PageRequest.of(page.orElse(0), 5, sort);
        Page<ProductItem> productItemList = productItemRepository.findAll(pageable);
        model.addAttribute("productItems", productItemList);
        model.addAttribute("page", "productVariationManagement.jsp");
        return "admin/index";
    }

    @ModelAttribute("products")
    public List<Product> getAllProduct() {
        return productRepository.findAll();
    }

    @ModelAttribute("colors")
    public List<Color> getAllColor() {
        return colorRepository.findAll();
    }

    @ModelAttribute("sizes")
    public List<Size> getAllSize() {
        return sizeRepository.findAll();
    }

    @ModelAttribute("productItems")
    public Page<ProductItem> getAllProductItems() {
        Pageable pageable = PageRequest.of(0, 5);
        return productItemRepository.findAll(pageable);
    }

}
