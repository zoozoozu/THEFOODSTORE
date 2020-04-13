package com.foodstore.bbs.domain;

import java.sql.Timestamp;

public class ProductReply {
	private int no;
	private int productNo;
	private String reply;
	private String writer;
	private Timestamp regDate;
	private String gcode;
	
	public ProductReply() {}
	
	public ProductReply(String writer, String reply, int productNo, String gcode) {
		this.writer = writer;
		this.reply = reply;
		this.productNo = productNo;
		this.gcode = gcode;
	}
	public ProductReply(int no, int productNo, 
			String reply, String writer, Timestamp regDate, String gcode) {
		this.no = no;
		this.productNo = productNo;
		this.reply = reply;
		this.writer = writer;
		this.regDate = regDate;
		this.gcode = gcode;
		
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getProductNo() {
		return productNo;
	}
	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}
	public String getReply() {
		return reply;
	}
	public void setReply(String reply) {
		this.reply = reply;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public Timestamp getRegDate() {
		return regDate;
	}
	public void setRegDate(Timestamp regDate) {
		this.regDate = regDate;
	}
	public String getGcode() {
		return gcode;
	}
	public void setGcode(String gcode) {
		this.gcode = gcode;
	}


}
