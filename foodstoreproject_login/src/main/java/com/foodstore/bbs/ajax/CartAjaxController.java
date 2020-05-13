package com.foodstore.bbs.ajax;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.foodstore.bbs.domain.Cart;
import com.foodstore.bbs.service.CartService;

@Controller
public class CartAjaxController {

	@Autowired
	CartService cartService;
	
	//장바구니에 추가 부분 ajax
	@RequestMapping("/cartAdd.ajax")
	@ResponseBody
	public List<Cart> addCart(Cart cart){
		cartService.addCart(cart);
		return cartService.cartList(cart.getUserId());
	}
	
	@RequestMapping("/cartList.ajax")
	@ResponseBody
	public List<Cart> cartList(String userId){
		return cartService.cartList(userId);
	}
}
