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
    public String index(Model model,
                        @ModelAttribute("productItem") ProductItem productItem,
                        @RequestParam("product_id") Long productId) {
        model.addAttribute("disabledUpdate", "disabled");
        Product product = productRepository.findById(productId).orElse(null);
        model.addAttribute("product", product);
        model.addAttribute("page", "productVariationManagement.jsp");
        return "admin/index";
    }

    @PostMapping("/create")
    public String createProduct(@Validated @ModelAttribute("productItem") ProductItem productItem,
                                BindingResult result,
                                @RequestParam("product_id") Long productId,
                                Model model) {
        model.addAttribute("disabledUpdate", "disabled");
        Product product = productRepository.findById(productId).orElse(null);
        model.addAttribute("product", product);
        if (!result.hasErrors()) {
            productItemRepository.save(productItem);
            return "redirect:/admin/product-variation-management?product_id=" + productId;
        }
        model.addAttribute("page", "productVariationManagement.jsp");
        return "admin/index";
    }

    @GetMapping("/edit/{id}")
    public String edit(@PathVariable Long id,
                       Model model,
                       @RequestParam("product_id") Long productId) {
        model.addAttribute("disabledSave", "disabled");
        Product product = productRepository.findById(productId).orElse(null);
        model.addAttribute("product", product);
        ProductItem productItem = productItemRepository.findById(id).orElse(null);
        model.addAttribute("productItem", productItem);
        model.addAttribute("page", "productVariationManagement.jsp");
        return "admin/index";
    }


    @PostMapping("/update")
    public String update(@Validated @ModelAttribute("productItem") ProductItem productItem,
                         BindingResult result,
                         Model model,
                         @RequestParam("product_id") Long productId) {
        model.addAttribute("disabledSave", "disabled");
        if (!result.hasErrors()) {
            productItemRepository.save(productItem);
            return "redirect:/admin/product-variation-management?product_id=" + productId;
        }
        model.addAttribute("page", "productVariationManagement.jsp");
        return "admin/index";
    }

    @GetMapping("/delete/{id}")
    public String delete(@PathVariable Long id,
                         Model model,
                         @ModelAttribute("productItem") ProductItem productItem,
                         @RequestParam("product_id") Long productId) {
        Product product = productRepository.findById(productId).orElse(null);
        model.addAttribute("product", product);
        try {
            productItemRepository.deleteById(id);
        } catch (Exception e) {
            model.addAttribute("msgDeleteProductVariation", true);
            model.addAttribute("page", "productVariationManagement.jsp");
            return "admin/index";
        }
        return "redirect:/admin/product-variation-management?product_id=" + productId;
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

    @ModelAttribute("colors")
    public List<Color> getAllColor() {
        return colorRepository.findAll();
    }

    @ModelAttribute("sizes")
    public List<Size> getAllSize() {
        return sizeRepository.findAll();
    }

    @ModelAttribute("productItems")
    public List<ProductItem> getAllProductItems(@RequestParam("product_id") Long productId) {
        return productItemRepository.findProductItemByProductProductId(productId);
    }

}

