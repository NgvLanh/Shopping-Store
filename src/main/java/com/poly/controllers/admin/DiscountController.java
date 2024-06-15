package com.poly.controllers.admin;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.poly.entities.Discount;
import com.poly.repositories.DiscountRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/admin/discounts-management")
public class DiscountController {

    @Autowired
    DiscountRepository discountRepository;

    @GetMapping("/admin/discounts-management/form-data")
    @ResponseBody
    public String getFormData() {
        ObjectMapper mapper = new ObjectMapper();
        List<Discount> discounts = discountRepository.findAll();
        try {
            return mapper.writeValueAsString(discounts);
        } catch (JsonProcessingException e) {
            e.printStackTrace();
            return null;
        }
    }

    @GetMapping("")
    public String discountsManagement(@ModelAttribute("discount") Discount discount, Model model) {
        model.addAttribute("disabledUpdate", "disabled");
        model.addAttribute("page", "discountsManagement.jsp");
        return "admin/index";
    }

    @PostMapping("/create")
    public String create(@Validated @ModelAttribute("discount") Discount discount,
                         BindingResult result, Model model,
                         @RequestParam("endTime") String endTime) {
        // Kiểm tra ngày kết thúc
        try {
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            Date parsedDate = dateFormat.parse(endTime);
            Date currentDate = new Date();
            if (parsedDate.compareTo(currentDate) <= 0) {
                model.addAttribute("msgDate", "End date must be greater than current date");
                // Hiển thị lại trang form với thông báo lỗi
                model.addAttribute("page", "discountsManagement.jsp");
                return "admin/index";
            }
            discount.setEndTime(parsedDate);
            //test trùng
//            discount.setCode("cm52TIjc");
            if (discountRepository.existsByCode(discount.getCode())) {
                model.addAttribute("msgCode", "Duplicate discount code");
                // Hiển thị lại trang form với thông báo lỗi
                model.addAttribute("page", "discountsManagement.jsp");
                return "admin/index";
            }


            discountRepository.save(discount);

            // Lấy danh sách mới và gửi lại cho giao diện người dùng
            List<Discount> updatedDiscounts = discountRepository.findAll();
            model.addAttribute("discounts", updatedDiscounts);
        } catch (ParseException e) {
            e.printStackTrace();
        }

        model.addAttribute("page", "discountsManagement.jsp");
        return "admin/index";
    }


    @PostMapping("/update")
    public String update(@Validated @ModelAttribute("discount") Discount discount,
                         BindingResult result, Model model,
                         @RequestParam("endTime") String endTime) {

        System.out.println("end:" + endTime);
        if (endTime.trim().isEmpty()) {
            model.addAttribute("msgDate", " Please select an end time.");
        }

        if (!result.hasErrors()) {
            // Thiết lập thời gian kết thúc từ dữ liệu người dùng nhập vào
            try {
                SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
                Date parsedDate = dateFormat.parse(endTime);
                // Thiết lập thời gian kết thúc cho đối tượng Discount
                discount.setEndTime(parsedDate);
                discountRepository.save(discount);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        model.addAttribute("page", "discountsManagement.jsp");
        return "admin/index";
    }


    @GetMapping("/edit/{id}")
    public String edit(Model model, @PathVariable Long id) {
        model.addAttribute("disabledSave", "disabled");
        Discount discount = discountRepository.findById(id).orElse(null);
        model.addAttribute("discount", discount);
        model.addAttribute("page", "discountsManagement.jsp");
        return "admin/index";
    }

    @GetMapping("/delete/{id}")
    public String delete(Model model, @PathVariable Long id) {
        discountRepository.deleteById(id);
        return "redirect:/admin/discounts-management";
    }

    @ModelAttribute("discounts")
    public List<Discount> getAllDiscounts() {
        return discountRepository.findAll();
    }

}
