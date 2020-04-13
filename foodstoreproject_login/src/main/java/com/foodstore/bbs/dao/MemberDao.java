package com.foodstore.bbs.dao;

import com.foodstore.bbs.domain.Member;

public interface MemberDao {
	
	//로그인 처리 메서드	
	public int login(String id, String pass);		
	
	//회원 정보를 불러오는 메서드
	public Member getMember(String id);
	
	public void addMember(Member member);
	
	public boolean memberPassCheck(String id, String pass);
	
	public void updateMember(Member member);
}
