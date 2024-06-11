package com.poly.controllers.client;

import com.poly.entities.CartItem;
import com.poly.entities.Discount;
import com.poly.repositories.CartItemRepository;
import com.poly.repositories.DiscountRepository;
import com.poly.services.ParamService;
import com.poly.services.SessionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/cart")
public class CartController {
    @Autowired
    CartItemRepository cartItemRepository;
    @Autowired
    ParamService paramService;
    @Autowired
    SessionService sessionService;
    @Autowired
    DiscountRepository discountRepository;

    @GetMapping
    public String cart(Model model) {
        model.addAttribute("page", "cart.jsp");
        return "client/index";
    }

    @PostMapping("/update-quantity/{cartItemId}")
    public String updateQuantity(Model model, @PathVariable Long cartItemId) {
        CartItem cartItem = cartItemRepository.findById(cartItemId).orElse(null);
        Integer quantity = paramService.getInt("qty", 0);
        cartItem.setQuantity(quantity);
        cartItemRepository.save(cartItem);
        model.addAttribute("page", "cart.jsp");
        return "client/index";
    }

    @GetMapping("/delete")
    public String delete(@RequestParam("cart_item_id") Long cartItemId) {
        cartItemRepository.deleteById(cartItemId);
        sessionService.remove("itemNumber");
        Long itemNumber = cartItemRepository.count();
        sessionService.set("itemNumber", itemNumber);
        return "redirect:/cart";
    }

    @PostMapping("/add-code")
    public String addCode(Model model,
                          @RequestParam("code") String code) {
        List<Discount> discounts = discountRepository.findAll();
        for (Discount discount: discounts) {
            if (code.trim().equals(discount.getCode())) {
                model.addAttribute("msgCode", "Your order gets " + discount.getPercentNumber() + "% discount. ");
                model.addAttribute("percent", discount.getPercentNumber());
                model.addAttribute("page", "cart.jsp");
                return "client/index";
            }
        }

        model.addAttribute("msgCode", "Code is incorrect.");
        model.addAttribute("page", "cart.jsp");
        return "client/index";
    }

    @ModelAttribute("cartItems")
    public List<CartItem> getCartItems() {
        return cartItemRepository.findAll();
    }
}
