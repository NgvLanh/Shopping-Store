package com.poly.controllers.admin;

import com.poly.models.Product;
import jakarta.servlet.ServletContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import java.io.File;

@Controller
@RequestMapping("/product-management")
public class ProductController {

    @Autowired
    ServletContext context;

    @ModelAttribute("product")
    public Product product() {
        return new Product();
    }

    @GetMapping("")
    public String showProductManagement(Model model) {
        model.addAttribute("page", "productManagement.jsp");
        return "admin/index";
    }

    @GetMapping("/create")
    public String showCreateProductForm(Model model) {
        model.addAttribute("page", "productManagement.jsp");
        return "admin/index";
    }

    @PostMapping("/create")
    public String createProduct(@ModelAttribute("product") Product product, Model model) {
        MultipartFile file = product.getImage();
        if (!file.isEmpty()) {
            // Luư file ảnh vào thư mục uploads
            try {
                String fileName = file.getOriginalFilename();
                // Kiểm tra xem có đường dẫn chưa
                File uploadFolder = new File(context.getRealPath("/uploads/"));
                if (!uploadFolder.exists()) {
                    uploadFolder.mkdirs();
                }
                // Tạo file trong thư mục uploads
                assert fileName != null;
                File dirFile = new File(uploadFolder, fileName);

                file.transferTo(dirFile);

                model.addAttribute("image", "/uploads/" + fileName);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        product.print();

        // Logic to handle product creation (e.g., save to the database)
        // productService.save(product); (uncomment and implement this line if you have a service for saving the product)

        model.addAttribute("page", "productManagement.jsp");
        return "admin/index";
    }

}
