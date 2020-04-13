package com.foodstore.bbs.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.foodstore.bbs.domain.Product;
import com.foodstore.bbs.domain.ProductReply;

@Repository
public class ProductDaoImpl implements ProductDao {

	private final String NAME_SPACE = "com.foodstore.bbs.mapper.ProductMapper";
	
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public List<Product> productList(String gcode) {
		return sqlSession.selectList(NAME_SPACE + ".productList", gcode);
	}

	@Override
	public Product getProduct(String code, int no) {
		Map<String, Object> params = new HashMap<String, Object>();
		Product product = new Product();
		product.setCode(code);
		product.setNo(no);
		params.put("product", product);
		return sqlSession.selectOne(NAME_SPACE + ".getProduct", params);
	}

	@Override
	public List<ProductReply> getReplyList(String code, int productNo) {
		Map<String, Object> params = new HashMap<String, Object>();
		ProductReply productReply = new ProductReply();
		productReply.setGcode(code);
		productReply.setProductNo(productNo);
		params.put("productReply", productReply);
		return sqlSession.selectList(NAME_SPACE + ".getReplyList", params);
	}

	@Override
	public void addProductReply(ProductReply productReply) {
		sqlSession.insert(NAME_SPACE + ".addProductReply", productReply);
	
	}

	@Override
	public void updateProductReply(ProductReply productReply) {
		sqlSession.update(NAME_SPACE + ".updateProductReply", productReply);
		
	}

}
