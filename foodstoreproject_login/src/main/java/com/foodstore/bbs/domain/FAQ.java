package com.foodstore.bbs.domain;

public class FAQ {
	private int no;
	private String asking;
	private String answer;
	
	public FAQ() {	}
	public FAQ(int no, String asking, String answer) {
		this.no=no;
		this.asking=asking;
		this.answer=answer;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getAsking() {
		return asking;
	}
	public void setAsking(String asking) {
		this.asking = asking;
	}
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}

}
