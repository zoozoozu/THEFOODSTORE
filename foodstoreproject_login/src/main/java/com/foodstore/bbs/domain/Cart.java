package com.foodstore.bbs.domain;

public class Cart {
	private int cartId;
	private String userId;
	private int productId;
	private int productPrice;
	private int amount;
	private int totalPrice;
	
	public Cart() {}
	public Cart(int cartId, String userId, int productId, int productPrice, int amount) {
		this.cartId = cartId;
		this.userId = userId;
		this.productId = productId;
		this.productPrice = productPrice;
		this.amount = amount;
		this.totalPrice = productPrice * amount;
	}
	public int getCartId() {
		return cartId;
	}
	public void setCartId(int cartId) {
		this.cartId = cartId;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public int getProductId() {
		return productId;
	}
	public void setProductId(int productId) {
		this.productId = productId;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public int getProductPrice() {
		return productPrice;
	}
	public void setProductPrice(int productPrice) {
		this.productPrice = productPrice;
	}
	public int getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}
}
