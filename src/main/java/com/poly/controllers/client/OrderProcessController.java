package com.poly.controllers.client;

import com.poly.entities.*;
import com.poly.repositories.*;
import com.poly.services.SessionService;
import org.aspectj.weaver.ast.Or;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import java.util.List;

@Controller
public class OrderProcessController {

    @Autowired
    OrderRepository orderRepository;
    @Autowired
    OrderItemRepository orderItemRepository;
    @Autowired
    PaymentRepository paymentRepository;
    @Autowired
    CartItemRepository cartItemRepository;
    @Autowired
    CartRepository cartRepository;
    @Autowired
    SessionService sessionService;
    @Autowired
    ProductItemRepository productItemRepository;

    @PostMapping("/order")
    public String order(Model model,
                        @RequestParam("total") Integer total,
                        @RequestParam("payment-method") String paymentMethod) {
        Payment payment = new Payment();
        if (paymentMethod.equals("onl")) {
            payment.setStatus("completed");
        } else {
            payment.setStatus("pending");
        }
        payment.setAmount(total);
        payment.setMethod(paymentMethod);
        paymentRepository.save(payment);
//
        Order order = new Order();
        Customer customer = sessionService.get("customer");
        order.setCustomer(customer);
        order.setStatus("Awaiting Confirmation");
        order.setTotal(total);
        order.setPayment(payment);
        orderRepository.save(order);
        List<CartItem> cartItemList = cartItemRepository.findAll();
        for (CartItem cartItem: cartItemList) {
            OrderItem orderItem = new OrderItem();
            orderItem.setOrder(order);
            orderItem.setProductItem(cartItem.getProductItem());
            orderItem.setQuantity(cartItem.getQuantity());
            orderItem.setPrice(cartItem.getProductItem().getPrice());
            ProductItem productItem = productItemRepository.findById(cartItem.getProductItem().getProductItemId()).orElse(null);
            productItem.setQuantity(productItem.getQuantity() - cartItem.getQuantity());
            productItemRepository.save(productItem);
            orderItemRepository.save(orderItem);
        }

        sessionService.remove("cart");
        sessionService.remove("itemNumber");
        cartItemRepository.deleteAll();
        cartRepository.deleteAll();
        return "redirect:/confirmation";
    }
}
