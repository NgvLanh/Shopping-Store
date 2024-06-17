package com.poly.controllers.client;

import com.poly.entities.*;
import com.poly.repositories.*;
import com.poly.services.SessionService;
import com.poly.services.VNPayService;
import jakarta.servlet.http.HttpServletRequest;
import org.aspectj.weaver.ast.Or;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.Collections;
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
    @Autowired
    VNPayService vnPayService;

    @PostMapping("/order")
    public String order(@RequestParam("total") Double total,
                        @RequestParam("payment-method") String paymentMethod,
                        HttpServletRequest request,
                        RedirectAttributes redirectAttributes) {
        Payment payment = new Payment();
        payment.setAmount(total);
        payment.setMethod(paymentMethod);
        payment.setStatus("pending");
        paymentRepository.save(payment);
//
        Order order = new Order();
        Customer customer = sessionService.get("customer");
        Discount discount = sessionService.get("discount");
        if (discount != null) {
            order.setDiscount(discount);
        }
        order.setCustomer(customer);
        order.setStatus("wait to confirmation");
        order.setTotal(total);
        order.setPayment(payment);
        orderRepository.save(order);
        List<Order> orders = orderRepository.findAll();
        Collections.reverse(orders);
        Order order1 = orders.get(0);

        Long orderId = order1.getOrderId();
//
        List<CartItem> cartItemList = cartItemRepository.findAll();
        for (CartItem cartItem : cartItemList) {
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
        if (paymentMethod.equals("onl")) {
            String baseUrl = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort();
            long vndTotal = Math.round(total) * 25000;
            String totalString = String.valueOf(vndTotal);
            System.out.println(totalString);
            String vnpayUrl = vnPayService.createOrder(Integer.parseInt(totalString), String.valueOf(orderId), baseUrl);
//
            cartItemRepository.deleteAll();
            sessionService.remove("itemNumber");
            redirectAttributes.addFlashAttribute(orderRepository.findAll().get(orderRepository.findAll().size() - 1).getOrderId());
            return "redirect:" + vnpayUrl;
        }
        cartItemRepository.deleteAll();
        sessionService.remove("discount");
        sessionService.remove("itemNumber");
        redirectAttributes.addFlashAttribute(orderRepository.findAll().get(orderRepository.findAll().size() - 1).getOrderId());
        return "redirect:/your-order";
    }


}
