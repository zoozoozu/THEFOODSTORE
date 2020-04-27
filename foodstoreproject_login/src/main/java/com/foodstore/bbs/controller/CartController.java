package com.foodstore.bbs.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.foodstore.bbs.domain.Cart;
import com.foodstore.bbs.domain.Member;
import com.foodstore.bbs.domain.Product;
import com.foodstore.bbs.service.CartService;
import com.foodstore.bbs.service.ProductService;

@Controller
@SessionAttributes({ "cart" })
public class CartController {

	private CartService cartService;
	private ProductService productService;

	@Autowired
	public void setCartService(CartService cartService) {
		this.cartService = cartService;
	}
	
	@Autowired
	public void setProductService(ProductService productService) {
		this.productService = productService;
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
		
		Product product = productService.getProduct(productNo);
			
		//DB에 저장할 필요가 없으므로
		//cartService.addCart(cart);
		String id = (String)session.getAttribute("id");
		model.addAttribute("sessionTest", id);
		model.addAttribute("userId", userId);
		model.addAttribute("product", product);
		model.addAttribute("amount", amount);
		return "cart/goOrder";
	}
	
	@RequestMapping(value = {"test","payments/complete"}, method=RequestMethod.POST)
	public String test(Model model,HttpServletRequest httpServletRequest) {
		//Product product = productService.getProduct(productNo);
		
		int productNo = Integer.parseInt(httpServletRequest.getParameter("productNo"));
		
		Product product = productService.getProduct(productNo);
		model.addAttribute("product", product);
		return "cart/test";
	}
}
