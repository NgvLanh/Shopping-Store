package com.poly.controllers.admin;

import com.poly.entities.Customer;
import com.poly.entities.Product;
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

    @ModelAttribute("customers")
    public List<Customer> getAllCustomers() {
        return Arrays.asList(
                new Customer(1L, "John", "Doe", null, "john.png", "john.doe@example.com", "password", "1234567890", "123 Street", "City", new Timestamp(System.currentTimeMillis()), false),
                new Customer(2L, "Jane", "Doe", null, "jane.png", "jane.doe@example.com", "password", "0987654321", "456 Avenue", "City", new Timestamp(System.currentTimeMillis()), false)
        );
    }

    @GetMapping("")
    public String showCustomerManagement(Model model) {
        model.addAttribute("page", "customerManagement.jsp");
        return "admin/index";
    }
}
