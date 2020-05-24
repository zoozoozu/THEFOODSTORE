package com.foodstore.bbs.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.foodstore.bbs.dao.ProductDao;
import com.foodstore.bbs.domain.Product;
import com.foodstore.bbs.domain.ProductReply;

@Service
public class ProductServiceImpl implements ProductService {
	
	private ProductDao productDao;
	
	@Autowired
	public void setProductDao(ProductDao productDao) {
		this.productDao = productDao;
	}

	@Override
	public List<Product> productList(String gcode) {
		return productDao.productList(gcode);
	}

	@Override
	public Product getProduct(String code, int no) {
		return productDao.getProduct(code, no);
	}
	
	@Override
	public Product getProduct(int no) {
		return productDao.getProduct(no);
	}

	@Override
	public List<ProductReply> getReplyList(String code, int productNo) {
		return productDao.getReplyList(code, productNo);
	}

	@Override
	public void addProductReply(ProductReply productReply) {
		productDao.addProductReply(productReply);
	}

	@Override
	public void updateProductReply(ProductReply productReply) {
		productDao.updateProductReply(productReply);
	}
	
}
