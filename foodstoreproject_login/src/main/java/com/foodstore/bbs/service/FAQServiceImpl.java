package com.foodstore.bbs.service;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.foodstore.bbs.dao.FAQDao;
import com.foodstore.bbs.domain.FAQ;;

@Service
public class FAQServiceImpl implements FAQService {
	
	//한페이지에 보여줄 상수 선언
	private static final int PAGE_SIZE = 10;
	
	//한페이지에 보여줄 그룹의 수를 상수로 선언
	private static final int PAGE_GROUP=10;
	
	@Autowired
	private FAQDao fAQDao;
	
	@Override
	public Map<String, Object> FAQList(int pageNum, String keyword) {
		int currentPage = pageNum;
		int startRow=(currentPage-1)*PAGE_SIZE;
		int listCount=0;
		//검색여부확인
		boolean searchOption = keyword.equals("null") ? false : true;
		listCount = fAQDao.getFAQCount(keyword);
		System.out.println("lsitCount : "+listCount+", keyword : "+keyword);
		
		if(listCount > 0) {
			List<FAQ> FAQList = fAQDao.FAQList(startRow, PAGE_SIZE, keyword);
			System.out.println("listsize : "+ FAQList);
			int pageCount = listCount / PAGE_SIZE + (listCount % PAGE_SIZE == 0 ? 0 : 1);
			int startPage = (currentPage / PAGE_GROUP) * PAGE_GROUP + 1
					- (currentPage % PAGE_GROUP == 0 ? PAGE_GROUP : 0);
			int endPage = startPage + PAGE_GROUP - 1;
			if (endPage > pageCount) {
				endPage = pageCount;
			}
			Map<String, Object> modelMap = new HashMap<String, Object>();
			
			modelMap.put("FAQList", FAQList);
			modelMap.put("pageCount", pageCount);
			modelMap.put("startPage", startPage);
			modelMap.put("endPage", endPage);
			modelMap.put("currentPage", currentPage);
			modelMap.put("listCount", listCount);
			modelMap.put("pageGroup", PAGE_GROUP);
			modelMap.put("searchOption", searchOption);
			
			if (searchOption) {
				try {
					modelMap.put("keyword", URLEncoder.encode(keyword, "utf-8"));
				} catch (UnsupportedEncodingException e) {
					e.printStackTrace();
				}
				modelMap.put("word", keyword);
			}
			
			return modelMap;
		}else {
			return null;
		}
	}



}
