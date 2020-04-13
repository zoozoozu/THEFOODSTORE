package com.foodstore.bbs.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.foodstore.bbs.service.FAQService;

@Controller
public class FAQController {
	
	@Autowired
	private FAQService fAQService;
	
	public void setFAQServic(FAQService fAQService) {
		this.fAQService=fAQService;
	}
	//FAQ리스트를 뿌리는 컨트롤러
	@RequestMapping("/FAQ")
	public String FAQList(Model model,
			@RequestParam(value="pageNum",required = false, defaultValue="1") int pageNum,
			@RequestParam(value="keyword",required = false, defaultValue="null") String keyword) {
		Map<String, Object> modelMap = fAQService.FAQList(pageNum, keyword);
		
		model.addAllAttributes(modelMap);
		
		return "board/FAQ";
	}

}
