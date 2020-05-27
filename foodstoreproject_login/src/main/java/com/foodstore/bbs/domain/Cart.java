package com.foodstore.bbs.domain;

public class Cart {
	private int cartId;
	private String userId;
	private int productId;
	private String productCode;

	private String productName;
	private String productFilePath;
	private int productPrice;
	private int amount;
	private int totalPrice;
	
	public Cart() {}

	/*
	 * public Cart(int cartId, String userId, int productId, int productPrice, int
	 * amount) { this.cartId = cartId; this.userId = userId; this.amount = amount; }
	 */
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
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public String getProductFilePath() {
		return productFilePath;
	}
	public void setProductFilePath(String productFilePath) {
		this.productFilePath = productFilePath;
	}
	
	public String getProductCode() {
		return productCode;
	}

	public void setProductCode(String productCode) {
		this.productCode = productCode;
	}
}
