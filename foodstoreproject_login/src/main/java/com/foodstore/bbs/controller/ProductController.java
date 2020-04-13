package com.foodstore.bbs.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.foodstore.bbs.domain.Product;
import com.foodstore.bbs.domain.ProductReply;
import com.foodstore.bbs.service.ProductService;

@Controller
public class ProductController {
	
	private ProductService productService;

	@Autowired
	public void setProductService(ProductService productService) {
		this.productService = productService;
	}
	
	@RequestMapping(value= {"/main", "/default"})
	public String Title() {
		return "product/main";
	}
	
	@RequestMapping(value= {"/ProductList","/list"})
	public String productList(Model model, String code) {
		List<Product> productList = productService.productList(code);
		
		model.addAttribute("productList", productList);
		
		return "product/productList";
	}
	
	@RequestMapping(value= {"/productDetail", "/ProductDetail"})
	public String productDetail(Model model,
			@RequestParam(value="code", required=false, defaultValue="null")String code,
			@RequestParam(value="no", required=false, defaultValue="1")int no) {
		Product product = productService.getProduct(code, no);
		List<ProductReply> productReplyList = productService.getReplyList(code, no);
		
		model.addAttribute("product",product);
		model.addAttribute("productReplyList", productReplyList);
		return "product/productDetail";
	}
	
	@RequestMapping(value="/productReplyUpdate")
	public String updateProductReply(Model model,
			@RequestParam(value="productNo", required=false, defaultValue="1")int no,
			@RequestParam(value="gcode", required=false, defaultValue="null")String code,
			@RequestParam(value="id", required=false, defaultValue="null")String id){
		return "product/productDetail";
	}
}
