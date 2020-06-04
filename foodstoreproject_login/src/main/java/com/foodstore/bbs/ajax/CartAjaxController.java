package com.foodstore.bbs.ajax;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.foodstore.bbs.domain.Cart;
import com.foodstore.bbs.service.CartService;

@Controller
public class CartAjaxController {

	@Autowired
	CartService cartService;

	// 장바구니에 추가 부분 ajax
	@RequestMapping("/cartAdd.ajax")
	@ResponseBody
	public List<Cart> cartAdd(Model model, String userId, int productNo, int amount) {
		List<Cart> tmpCart = cartService.cartList(userId);
		Cart cart = new Cart();
		for(int i = 0; i < tmpCart.size(); i++) {
			// 같은 상품이 있다면
			if(productNo == tmpCart.get(i).getProductId()) {
				cartService.updateAmount(tmpCart.get(i).getProductId());
			}else {
				// 같은 상품이 없다면
				cart.setUserId(userId);
				cart.setProductId(productNo);
				cart.setAmount(amount);
				cartService.addCart(cart);
			}		
		}
		model.addAttribute("cartList", cartService.cartList(userId));
		return cartService.cartList(userId);
	}
	
	@RequestMapping("/deleteCart.ajax")
	@ResponseBody
	public List<Cart> deleteCart(HttpSession session, String userId, int cartId) {
		cartService.delete(cartId);
		session.setAttribute("cartList", cartService.cartList(userId));
		return cartService.cartList(userId);
	}
	
	/*
	 * @RequestMapping("/updateCart.ajax")
	 * 
	 * @ResponseBody public List<Cart> updateCart(HttpSession session, int amount,
	 * int productNo){ String userId = (String) session.getAttribute("id"); return
	 * cartService.cartList(userId); }
	 */

	@RequestMapping("/cartList.ajax")
	@ResponseBody
	public List<Cart> cartList(HttpSession session, String userId) {
		session.setAttribute("cartList", cartService.cartList(userId));
		return cartService.cartList(userId);
	}
}
