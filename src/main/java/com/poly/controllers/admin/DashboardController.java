package com.poly.controllers.admin;

import com.poly.entities.Customer;
import com.poly.entities.Payment;
import com.poly.repositories.OrderRepository;
import com.poly.repositories.PaymentRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin/dashboard")
public class DashboardController {

    @Autowired
    PaymentRepository paymentRepository;

    @Autowired
    OrderRepository orderRepository;


    @GetMapping("")
    public String dashboard(Model model) {
        Double payment = paymentRepository.sumAmountByStatus();
        model.addAttribute("totalPayment", payment);
        Double order = orderRepository.findTotalSumOrder();
        model.addAttribute("totalOrder", order);
        model.addAttribute("totalMargin", order - payment);
        model.addAttribute("page", "home.jsp");
        return "admin/index";
    }
}
