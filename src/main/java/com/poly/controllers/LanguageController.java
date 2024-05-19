package com.poly.controllers;

import jakarta.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import java.util.Locale;

@Controller
public class LanguageController {
    @GetMapping("/{lang}")
    public String changeLanguage(@PathVariable String lang, HttpServletRequest request) {
        // Xử lý yêu cầu thay đổi ngôn ngữ
        Locale locale = new Locale(lang);
        request.getSession().setAttribute("locale", locale);
        return "redirect:/home"; // Chuyển hướng về trang chính
    }
}
