package com.poly.interceptors;

import com.poly.entities.Customer;
import com.poly.services.CookieService;
import com.poly.services.SessionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.HandlerInterceptor;


import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Service
public class AuthInterceptor implements HandlerInterceptor {
    @Autowired
    SessionService sessionService;
    @Autowired
    CookieService cookieService;

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
            throws Exception {
        String uri = request.getRequestURI();
        Customer user = sessionService.get("customer"); // lấy từ session
        String cookie = cookieService.getValue("email");
        System.out.println(cookie);
        if (cookie == null) {
            String error = "";
            if (user == null) { // chưa đăng nhập
                error = "Please login!";
            }
            // không đúng vai trò
            else if (!user.getRole() && uri.startsWith("/admin/")) {
                error = "Access denied!";
            }
            if (!error.isEmpty()) { // có lỗi
                response.sendRedirect("/login?error=" + error);
                return false;
            }
        }
        return true;
    }
}
