package com.foodstore.bbs.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.foodstore.bbs.domain.FAQ;

@Repository
public class FAQDaoImpl implements FAQDao {

	//Mapper namespace를 상수로 정의
	private final String NAME_SPACE ="com.foodstore.bbs.mapper.FAQMapper";
	
	//
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession=sqlSession;
	}
	
	//FAQ게시판 리스트 요청 메서드
	@Override
	public List<FAQ> FAQList(int startRow, int num, String keyword) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("startRow", startRow);
		params.put("num", num);
		params.put("keyword", keyword);
		
		return sqlSession.selectList(NAME_SPACE+".FAQList", params);
	}
	//FAQ게시판 리스트의 갯수를 세는 요청 메서드
	@Override
	public int getFAQCount(String keyword) {
		Map<String, String> params = new HashMap<String, String>();		
		//params.put("type", type);
		params.put("keyword", keyword);
		
		//System.out.println("getFAQCount : " +sqlSession.selectOne(NAME_SPACE+".getFAQCount", params));
		return sqlSession.selectOne(NAME_SPACE+".getFAQCount", params);
	}

}
