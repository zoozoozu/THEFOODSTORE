package com.foodstore.bbs.dao;

import java.util.List;

import com.foodstore.bbs.domain.FAQ;

public interface FAQDao {
	
	//FAQ의 리스트를 불러오는 메서드
	public abstract List<FAQ> FAQList(
			int startRow, int num, String keyword);
	
	//FAQ의 게시글 수를 계산하는 메서드
	public abstract int getFAQCount(String keyword);

}
