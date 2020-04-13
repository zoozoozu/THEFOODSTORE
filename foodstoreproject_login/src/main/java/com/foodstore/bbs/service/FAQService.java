package com.foodstore.bbs.service;

import java.util.List;
import java.util.Map;

import com.foodstore.bbs.domain.FAQ;

public interface FAQService {
	
	//FAQ의 리스트를 불러오는 메서드
	public abstract Map<String, Object> FAQList(
			int pageNum, String keyword);

}
