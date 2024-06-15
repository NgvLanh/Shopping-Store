package com.poly.controllers.client;

import com.poly.services.VNPayService;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

@Controller
public class VnPaymentController {
    @Autowired
    VNPayService vnPayService;
    @GetMapping("/vnpay-payment")
    public String viewBill(HttpServletRequest request, Model model) throws ParseException {
        int paymentStatus = vnPayService.orderReturn(request);

        String orderInfo = request.getParameter("vnp_OrderInfo");
        String paymentTime = request.getParameter("vnp_PayDate");
        String transactionId = request.getParameter("vnp_TransactionNo");
        String totalPrice = request.getParameter("vnp_Amount");

        // Định dạng mẫu của chuỗi thời gian
        SimpleDateFormat inputFormat = new SimpleDateFormat("yyyyMMddHHmmss");
        // Chuyển đổi chuỗi thành đối tượng Date
        Date date = inputFormat.parse(paymentTime);

        model.addAttribute("orderId", orderInfo);
        model.addAttribute("totalPrice", totalPrice);
        model.addAttribute("paymentTime", date);
        model.addAttribute("transactionId", transactionId);

        return paymentStatus == 1 ? "orderSuccess" : "orderFail";
    }
}
