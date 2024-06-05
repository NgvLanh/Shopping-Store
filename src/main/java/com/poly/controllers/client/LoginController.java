package com.poly.controllers.client;
import com.poly.entities.Customer;
import com.poly.services.ParamService;
import com.poly.services.UserService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("account")
public class LoginController {

    @Autowired
    private CookieService cookieService;

    @Autowired
    private ParamService paramService;

    @Autowired
    private SessionService sessionService;

    @Autowired
    private UserService userService;


    @PostMapping("/login")
    public String login(Customer customer, HttpSession session) {
        String email = "lanhnvpc06581@fpt.edu.vn";
        String password = "admin";
        if (customer.getPassword().equals(password) && customer.getEmail().equals(email)) {
            session.setAttribute("role", true);
            return "redirect:/admin";
        } else {
            return "redirect:/login";
        }
    }
}
