package com.foodstore.bbs.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.foodstore.bbs.domain.Cart;
import com.foodstore.bbs.domain.Member;
import com.foodstore.bbs.service.CartService;

@Controller
@SessionAttributes({ "cart" })
public class CartController {

	private CartService cartService;

	@Autowired
	public void setCartService(CartService cartService) {
		this.cartService = cartService;
	}

	@RequestMapping({"order/cartAdd", "/cartAdd" })
	public String addCart(Model model, HttpSession session, @RequestParam(value = "userId") String userId,
			@RequestParam(value = "productNo") int productNo, @RequestParam(value = "amount") int amount) {
			Cart cart = new Cart();
			cart.setUserId(userId);
			cart.setProductId(productNo);
			cart.setAmount(amount);
			cartService.addCart(cart);

			// 장바구니에 기존 상품이 있는지 검사
		/* cartService.addCart(cart); */
		/*
		 * model.addAttribute("amount", amount); model.addAttribute("productNo",
		 * productNo);
		 */
		return "cart/cart";
	}
	
	@RequestMapping("goOrder")
	public String cartList(Model model,
			HttpSession session,
			@RequestParam(value = "userId") String userId,
			@RequestParam(value = "productNo") int productNo, 
			@RequestParam(value = "amount") int amount) {
		/*
		 * // List<Cart> cartList = cartService.cartList(userId); //
		 * model.addAttribute("cartList", cartList);
		 */		
		Cart cart = new Cart();
		cart.setUserId(userId);
		cart.setProductId(productNo);
		cart.setAmount(amount);
		
		//DB에 저장할 필요가 없으므로
		//cartService.addCart(cart);
		String id = (String)session.getAttribute("id");
		model.addAttribute("sessionTest", id);
		model.addAttribute("userId", userId);
		model.addAttribute("productNo", productNo);
		model.addAttribute("amount", amount);
		return "cart/goOrder";
	}
	
	@RequestMapping({"payments/complete","test"})
	public String test(Model model) {
		return "cart/test";
	}
}
