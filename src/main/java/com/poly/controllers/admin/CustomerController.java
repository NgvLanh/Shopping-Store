package com.poly.controllers.admin;

import com.poly.entities.Customer;
import com.poly.entities.Product;
import com.poly.repositories.CustomerRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import java.sql.Timestamp;
import java.util.Arrays;
import java.util.List;

@Controller
@RequestMapping("/admin/customer-management")
public class CustomerController {

    @Autowired
    CustomerRepository customerRepository;

    @ModelAttribute("customers")
    public List<Customer> getAllCustomers() {
        return customerRepository.findAll();
    }

    @GetMapping("")
    public String showCustomerManagement(Model model) {
        model.addAttribute("page", "customerManagement.jsp");
        return "admin/index";
    }
}
