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

import java.util.Date;

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
                                 @RequestParam("photo") MultipartFile file,
                                 Model model) {
        System.out.println((file.getOriginalFilename()));
        if (!file.isEmpty()) {
            if (!result.hasErrors()) {
                customer.setImage(file.getOriginalFilename());
                paramService.save(file, "/uploads/");
                customer.setCreateDate(new Date());
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
