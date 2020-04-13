package com.foodstore.bbs.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.foodstore.bbs.dao.MemberDao;
import com.foodstore.bbs.domain.Member;


 // 이 클래스가 서비스(비즈니스 로직) 계층의 컴포넌트임을 선언한다. 
@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private MemberDao memberDao;
	
	public void setMemberDao(MemberDao memberDao) {
		this.memberDao = memberDao;
	}
	
	// MemberDao를 이용해 로그인 요청 처리 결과를 반환하는 메서드
	@Override
	public int login(String id, String pass) {		
		return memberDao.login(id, pass);
	}
	
	// MemberDao를 이용해 no에 해당하는 회원 정보를 가져오는 메서드
	@Override
	public Member getMember(String id) {		
		return memberDao.getMember(id);
	}

	@Override
	public void addMember(Member member) {
		memberDao.addMember(member);
	}

	@Override
	public boolean overlapIdCheck(String id) {
		Member member = memberDao.getMember(id);
		System.out.println("overlapIdCheck - member : " + member);
		
		if(member == null) {
			return false;
		}
		return true;
	}

	@Override
	public boolean memberPassCheck(String id, String pass) {
		return memberDao.memberPassCheck(id, pass);
	}

	@Override
	public void updateMember(Member member) {
		memberDao.updateMember(member);
	}
}
