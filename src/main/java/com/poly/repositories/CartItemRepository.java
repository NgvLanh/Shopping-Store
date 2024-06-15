package com.poly.repositories;

import com.poly.entities.Cart;
import com.poly.entities.CartItem;
import com.poly.entities.ProductItem;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface CartItemRepository extends JpaRepository<CartItem, Long> {
    CartItem findByCartAndProductItem(Cart cart, ProductItem productItem);
    List<CartItem> findCartItemByCartCartId(Long cartId);
}
