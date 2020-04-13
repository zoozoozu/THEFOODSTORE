package com.foodstore.bbs.dao;

import java.util.List;

import com.foodstore.bbs.domain.Cart;

public interface CartDao {
	public List<Cart> cartList(String userId);
	public void addCart(Cart cart);
}
