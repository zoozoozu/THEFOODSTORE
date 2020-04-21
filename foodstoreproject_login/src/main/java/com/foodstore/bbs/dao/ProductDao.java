package com.foodstore.bbs.dao;

import java.util.List;

import com.foodstore.bbs.domain.Product;
import com.foodstore.bbs.domain.ProductReply;

public interface ProductDao {
	public List<Product> productList(String gcode);
	public Product getProduct(String code, int no);
	public Product getProduct(int no);
	public List<ProductReply> getReplyList(String code, int productNo);
	
	/*상품평 관련*/
	public void addProductReply(ProductReply productReply);
	public void updateProductReply(ProductReply productReply);
}
