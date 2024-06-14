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
import java.util.Optional;

@Controller
@RequestMapping("/register")
public class RegisterController {
    @Autowired
    ParamService paramService;
    @Autowired
    CustomerRepository customerRepository;

    @GetMapping("")
    public String showRegister(@ModelAttribute("customer") Customer customer, Model model) {
        model.addAttribute("page", "register.jsp");
        return "client/index";
    }

    @PostMapping("/create")
    public String createCustomer(@Validated @ModelAttribute("customer") Customer customer,
                                 BindingResult result,
                                 @RequestParam("photo") Optional<MultipartFile> file,
                                 Model model) {
        MultipartFile file1 = file.orElse(null);

        if (!result.hasErrors()) {
            Customer emailExist = customerRepository.findByEmailLike(customer.getEmail());
            Customer phoneExist = customerRepository.findByPhoneLike(customer.getPhone());
            if (emailExist == null) {
                if (phoneExist == null) {
                    if (!file1.getOriginalFilename().isEmpty()) {
                        customer.setImage(file1.getOriginalFilename());
                        paramService.save(file1, "/uploads/");
                    }
                    customer.setCreateDate(new Date());
                    customerRepository.save(customer);
                    return "redirect:/register";
                } else {
                    model.addAttribute("phoneExist", "Phone is exist");
                }

            } else {
                model.addAttribute("emailExist", "Email is exist");
            }

        }
        model.addAttribute("page","register.jsp");
        return"client/index";
}
}
