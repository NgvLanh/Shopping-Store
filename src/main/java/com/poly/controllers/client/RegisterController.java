package com.poly.controllers.client;

import com.poly.entities.Customer;
import com.poly.repositories.CustomerRepository;
import com.poly.services.ParamService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

@Controller
@RequestMapping("/register")
public class RegisterController {
    @Autowired
    ParamService paramService;
    @Autowired
    CustomerRepository customerRepository;

    @GetMapping("")
    public String showRegister( @ModelAttribute("customer")Customer customer, Model model) {
            model.addAttribute("page", "register.jsp");
            return "client/index";
        }

    @PostMapping("/create")
    public String createCustomer(@Validated @ModelAttribute("customer")Customer customer,
                                 BindingResult result,
                                 @RequestPart("image") MultipartFile file,
                                 Model model) {
        if (!file.getOriginalFilename().isEmpty()) {
            if (!result.hasErrors()) {
                customer.setImage(file.getOriginalFilename());
                paramService.save(file, "/uploads/");
                customerRepository.save(customer);
                return "redirect:/register";
            }
        } else {
            model.addAttribute("msgImage", "Please upload a product image.");
        }

        model.addAttribute("page", "register.jsp");
        return "client/index";
    }
}
