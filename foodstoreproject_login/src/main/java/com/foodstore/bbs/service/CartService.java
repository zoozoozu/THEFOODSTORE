package com.foodstore.bbs.service;

import java.util.List;

import com.foodstore.bbs.domain.Cart;

public interface CartService {
	// 장바구니 리스트
	public List<Cart> cartList(String userId);

	// 장바구니 추가
	public void addCart(Cart cart);

	// 장바구니 삭제(한 개)
	public void delete(int cartId);

	// 장바구니 전체 삭제
	public void deleteAll(String userId);

	// 장바구니 금액 합계
	public int sumMoney(String userId);

	// 장바구니 상품 갯수
	public int countCart(String userId, int productId);
	
	// 상품 갯수 변경
	public void updateAmount(int productId);
	
	
}
