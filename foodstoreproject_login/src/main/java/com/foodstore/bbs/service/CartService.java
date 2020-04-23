package com.foodstore.bbs.service;

import java.util.List;

import com.foodstore.bbs.domain.Cart;

public interface CartService {
	public List<Cart> cartList(String userId);
	public void addCart(Cart cart);
	
}
