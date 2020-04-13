package com.foodstore.bbs.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.foodstore.bbs.dao.CartDao;
import com.foodstore.bbs.domain.Cart;

@Service
public class CartServiceImpl implements CartService {
	
	private CartDao cartDao;
	
	@Autowired
	public void setCartDao(CartDao cartDao) {
		this.cartDao = cartDao;
	}

	
	@Override
	public List<Cart> cartList(String userId) {
		return cartDao.cartList(userId);
	}


	@Override
	public void addCart(Cart cart) {
		cartDao.addCart(cart);
	}

}
