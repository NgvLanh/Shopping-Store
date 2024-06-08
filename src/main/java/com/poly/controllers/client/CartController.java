package com.poly.controllers.client;

import com.poly.entities.CartItem;
import com.poly.repositories.CartItemRepository;
import com.poly.services.ParamService;
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

    @GetMapping
    public String cart(Model model) {
        model.addAttribute("page", "cart.jsp");
        return "client/index";
    }

    @PostMapping("/update-quantity/{cartItemId}")
    public String updateQuantity(Model model, @PathVariable Long cartItemId) {
        CartItem cartItem = cartItemRepository.findById(cartItemId).orElse(null);
        Integer quantity = paramService.getInt("qty",0);
        System.out.println(quantity);
        cartItem.setQuantity(quantity);
        cartItemRepository.save(cartItem);
        model.addAttribute("page", "cart.jsp");
        return "client/index";
    }

    @GetMapping("/delete")
    public String delete(@RequestParam("cart_item_id") Long cartItemId) {
        cartItemRepository.deleteById(cartItemId);
        return "redirect:/cart";
    }



    @ModelAttribute("cartItems")
    public List<CartItem> getCartItems() {
        return cartItemRepository.findAll();
    }
}
