package com.foodstore.bbs.service;

import com.foodstore.bbs.domain.Member;

public interface MemberService {
	
	//	로그인 처리 메서드
	public int login(String id, String pass);	
	
	//회원 정보 반환
	public Member getMember(String id);
	
	public void addMember(Member member);
	public boolean overlapIdCheck(String id);
	public boolean memberPassCheck(String id, String pass);
	public void updateMember(Member member);
}
