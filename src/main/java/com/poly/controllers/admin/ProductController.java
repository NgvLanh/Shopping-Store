package com.poly.controllers.admin;

import com.poly.entities.*;
import com.poly.repositories.*;
import com.poly.services.ParamService;
import jakarta.servlet.ServletContext;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.provider.HibernateUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

@Controller
@RequestMapping("/admin/product-management")
public class ProductController {

    @Autowired
    ParamService paramService;

    @Autowired
    ProductItemRepository productItemRepository;

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
    public String showProductManagement(@ModelAttribute("productItem") ProductItem productItem,
                                        Model model) {
        model.addAttribute("disabledUpdate", "disabled");
        model.addAttribute("page", "productManagement.jsp");
        return "admin/index";
    }

    @PostMapping("/create")
    public String createProduct(@Validated @ModelAttribute("productItem") ProductItem productItem,
                                BindingResult result,
                                @RequestPart("image") MultipartFile file,
                                Model model) {
        model.addAttribute("disabledUpdate", "disabled");
        if (!file.getOriginalFilename().isEmpty()) {
            if (!result.hasErrors()) {
                paramService.save(file, "/uploads/");

                Product product = productItem.getProduct();
                product.setImage(file.getOriginalFilename());

                productRepository.save(product);
                productItem.setProduct(product);

                productItem.setQuantity(product.getQuantity());
                productItem.setPrice(product.getPrice());

                productItemRepository.save(productItem);

                return "redirect:/admin/product-management";
            }
        } else {
            model.addAttribute("msgImage", "Please upload a product image.");
        }

        model.addAttribute("page", "productManagement.jsp");
        return "admin/index";
    }

    Product productEdit = new Product();
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable Long id,
                       Model model) {
        ProductItem productItem = productItemRepository.findById(id).orElse(null);
        productEdit = productItem.getProduct();
        model.addAttribute("disabledSave", "disabled");
        model.addAttribute("productItem", productItemRepository.findById(id).orElse(null));
        model.addAttribute("page", "productManagement.jsp");
        return "admin/index";
    }

    @PostMapping("/update/{id}")
    public String update(@PathVariable Long id,
                         @Validated @ModelAttribute("productItem") ProductItem productItem,
                         BindingResult result,
                         @RequestPart("image") MultipartFile file,
                         Model model) {
        model.addAttribute("disabledSave", "disabled");
        if (!file.getOriginalFilename().isEmpty()) {
            if (!result.hasErrors()) {
                Product productUpdate = productItem.getProduct();

                productUpdate.setProductId(productEdit.getProductId());
                productUpdate.setProductId(productItem.getProduct().getProductId());

                productItem.setProductItemId(id);

                paramService.save(file, "/uploads/");

                productUpdate.setImage(file.getOriginalFilename());

                productItem.setQuantity(productUpdate.getQuantity());
                productItem.setPrice(productUpdate.getPrice());

                productRepository.save(productUpdate);
                productItem.setProduct(productUpdate);
                productItemRepository.save(productItem);

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
                         @ModelAttribute("productItem") ProductItem productItem,
                         Model model) {
        ProductItem productItemDelete = productItemRepository.findById(id).orElse(null);
        try {
            productItemRepository.deleteById(id);
            productRepository.deleteById(productItemDelete.getProduct().getProductId());
        } catch (Exception e) {
            model.addAttribute("deleteError", true);
        }
        return "redirect:/admin/product-management";
    }


    @ModelAttribute("productItemList")
    public List<ProductItem> getAllProducts() {
        return productItemRepository.findAll();
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

