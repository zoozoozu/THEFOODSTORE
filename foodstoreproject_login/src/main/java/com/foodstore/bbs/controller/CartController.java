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
		
		//이렇게 사용해도 된다. 어차피 session에서 id를 받아올거기때문
		String userId_session = (String)session.getAttribute("id");
		if(userId != null) {
		// 바로 결제이므로 클릭시 먼저 카트에 상품의 아이디와 수량 그리고 상품의 넘버를 넣는다.
		Product product = productService.getProduct(productNo);
		int totalPrice = product.getPrice() * amount;
		Cart cart = new Cart();
		cart.setUserId(userId);
		cart.setProductId(productNo);
		cart.setAmount(amount);
		/*
		 * cart.setProductPrice(product.getPrice()); cart.setTotalPrice(totalPrice);
		 */
		cartService.addCart(cart);
		
		List<Cart> cartList = cartService.cartList(userId);
	
		//DB에 저장할 필요가 없으므로
		//cartService.addCart(cart);
		session.setAttribute("cartList", cartList);
		
		model.addAttribute("userId", userId);
		model.addAttribute("product", product);
		model.addAttribute("cartList", cartList);
		return "cart/goOrder";
		
		} else {
			return "loginForm";
		}
	}
	
	@RequestMapping(value = {"test","payments/complete"})
	public String finalPay(Model model,HttpServletRequest httpServletRequest, HttpSession session) {
		String userId = (String)session.getAttribute("userId");
		int cartTotalPrice = cartService.sumMoney(userId);
		
		model.addAttribute("total", cartTotalPrice);
		
		return "cart/test";
	}
	
	@RequestMapping(value= {"goCart"})
	public String cartList(Model model, HttpSession session) {
		String userId = (String)session.getAttribute("userId");
		List<Cart> cartList = cartService.cartList(userId);
		model.addAttribute("cartList", cartList);
		return "cart/goCart";
	}
}
