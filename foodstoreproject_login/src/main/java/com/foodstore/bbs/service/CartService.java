package com.foodstore.bbs.service;

import java.util.List;

import com.foodstore.bbs.domain.Cart;

public interface CartService {
	// 장바구니 리스트
	public List<Cart> cartList(String userId);

	// 장바구니 추가
	public void addCart(Cart cart);

	// 장바구니 삭제(한 개)
	void delete(int cartId);

	// 장바구니 전체 삭제
	void deleteAll(String userId);

	// 장바구니 금액 합계
	int sumMoney(String userId);

	// 장바구니 상품 갯수
	int countCart(String userId, int productId);
}
