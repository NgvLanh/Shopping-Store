package com.poly.controllers.client;

import com.poly.entities.*;
import com.poly.repositories.*;
import com.poly.services.ParamService;
import com.poly.services.SessionService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.*;

@Controller
public class SingleProductController {
    @Autowired
    SessionService sessionService;
    @Autowired
    ProductItemRepository productItemRepository;
    @Autowired
    ProductRepository productRepository;
    @Autowired
    CartRepository cartRepository;
    @Autowired
    CartItemRepository cartItemRepository;
    @Autowired
    SizeRepository sizeRepository;
    @Autowired
    ColorRepository colorRepository;
    @Autowired
    ParamService paramService;

    @GetMapping("/single-product")
    public String singleProduct(Model model,
                                @RequestParam("product_id") Long id) {
        ProductItem productItem = productItemRepository.findProductItemByProductProductId(id).get(0);
        model.addAttribute("productItem", productItem);

        model.addAttribute("page", "single-product.jsp");
        return "client/index";
    }

    @PostMapping("/add-to-cart")
    public String addToCart(Model model,
                            @ModelAttribute("productItem") ProductItem productItem) {
        System.out.println(productItem);

//        ProductItem productItemAddToCart = productItemRepository.
//                findByProductAndColorAndSize(productItem.getProduct().getProductId(),
//                        productItem.getColor().getColorId(), productItem.getSize().getSizeId());
//        if (productItemAddToCart != null) {
//            model.addAttribute("outOfStock", "Add to cart success.");
//
//        } else {
//            model.addAttribute("outOfStock", "The product is out of stock.");
//        }

        ProductItem productItem1 = productItemRepository.findProductItemByProductProductId(productItem.getProduct().getProductId()).get(0);
        model.addAttribute("productItem", productItem1);
        model.addAttribute("page", "single-product.jsp");
        return "client/index";
    }


    @ModelAttribute("colors")
    public Set<Color> getAllColors(@RequestParam("product_id") Long id) {
        List<ProductItem> productItemList = productItemRepository.findProductItemByProductProductId(id);
        Set<Color> colors = new HashSet<>();
        for (ProductItem pi : productItemList) {
            colors.add(pi.getColor());
        }
        return colors;
    }

    @ModelAttribute("sizes")
    public List<Size> getAllSizes(@RequestParam("product_id") Long id) {
        return sizeRepository.findAll();
    }

}
