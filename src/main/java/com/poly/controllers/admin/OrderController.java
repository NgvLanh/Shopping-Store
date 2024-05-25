package com.poly.controllers.admin;

import com.poly.entities.Order;
import com.poly.entities.Supplier;
import org.eclipse.tags.shaded.org.apache.xpath.operations.Or;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/admin/order-management")
public class OrderController {
    @GetMapping("")
    public String ShowOrderManagement(@ModelAttribute("order") Order order, Model model) {
        model.addAttribute("page", "orderManagement.jsp");
        return "admin/index";
    }

    @GetMapping("/edit/{id}")
    public String edit(@PathVariable Long id,
                       Model model) {

        Order orderEdit = new Order();
        for (Order order : list) {
            if (order.getId() == id) {
                orderEdit = order;
                break;
            }
        }
        model.addAttribute("order", orderEdit);
        model.addAttribute("page", "orderManagement.jsp");
        model.addAttribute("formAction", "/admin/supplier-management/update/" + id);
        return "admin/index";
    }

    List<Order> list = new ArrayList<>(List.of(new Order(1L,1L,"18/05/2023","Cho xac nhan",5000000),
            new Order(2L,2L,"18/05/2023","Cho xac nhan",5000000),
            new Order(3L,3L,"05/05/2023","Cho xac nhan",425000),
            new Order(4L,4L,"18/08/2023","Xac nhan",502000)
            ));

    @ModelAttribute("orders")
    public List<Order> getAllOrders() {
        return list;
    }
}
