package com.foodstore.bbs.service;

import java.util.List;

import com.foodstore.bbs.domain.Product;
import com.foodstore.bbs.domain.ProductReply;

public interface ProductService {
	public List<Product> productList(String gcode);
	public Product getProduct(String code, int no);
	public List<ProductReply> getReplyList(String code, int productNo);
	public void addProductReply(ProductReply productReply);
	public void updateProductReply(ProductReply productReply);
}
