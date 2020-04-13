package com.foodstore.bbs.domain;

public class Product {
	private int no;
	private String code;
	private String name;
	private String intro;
	private int sell;
	private int price;
	private int stock;
	private String filePath;
	private int recommend;
	private int thank;
	
	public Product() {}
	public Product(int no, String code, String name, String intro,
				int sell, int price, int stock, String filePath,
				int recommend, int thank)
	{
		this.no = no;
		this.code = code;
		this.name = name;
		this.intro = intro;
		this.sell = sell;
		this.price = price;
		this.stock = stock;
		this.filePath = filePath;
		this.recommend = recommend;
		this.thank = thank;
	}
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getIntro() {
		return intro;
	}
	public void setIntro(String intro) {
		this.intro = intro;
	}
	public int getSell() {
		return sell;
	}
	public void setSell(int sell) {
		this.sell = sell;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getStock() {
		return stock;
	}
	public void setStock(int stock) {
		this.stock = stock;
	}
	public String getFilePath() {
		return filePath;
	}
	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}
	public int getRecommend() {
		return recommend;
	}
	public void setRecommend(int recommend) {
		this.recommend = recommend;
	}
	public int getThank() {
		return thank;
	}
	public void setThank(int thank) {
		this.thank = thank;
	}
}
