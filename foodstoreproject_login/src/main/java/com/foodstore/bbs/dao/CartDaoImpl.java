package com.foodstore.bbs.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.foodstore.bbs.domain.Cart;

@Repository
public class CartDaoImpl implements CartDao {

	private SqlSessionTemplate sqlSession;
	
	private final String NAME_SPACE = "com.foodstore.mappers.CartMapper";
	
	@Autowired
	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public List<Cart> cartList(String userId) {
		return sqlSession.selectList(NAME_SPACE + ".getCartList", userId);
	}

	@Override
	public void addCart(Cart cart) {
		sqlSession.insert(NAME_SPACE + ".addCart", cart);
	}

	@Override
	public void delete(int cartId) {
		sqlSession.delete(NAME_SPACE + ".deleteOne", cartId);
	}

	@Override
	public void deleteAll(String userId) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public int sumMoney(String userId) {
		return sqlSession.selectOne(NAME_SPACE + ".sumMoney", userId);
	}

	@Override
	public int countCart(String userId, int productId) {
		// TODO Auto-generated method stub
		return 0;
	}
	
}
