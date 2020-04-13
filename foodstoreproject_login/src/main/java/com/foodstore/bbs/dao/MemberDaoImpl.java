package com.foodstore.bbs.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.foodstore.bbs.domain.Member;

 // 이 클래스가 데이터 액세스(데이터 저장소) 계층의 컴포넌트임을 선언한다. 
@Repository
public class MemberDaoImpl implements MemberDao {
		
	private SqlSessionTemplate sqlSession;
	
	// Mapper namespace를 상수로 정의
	
	private final String NAME_SPACE = "com.foodstore.mappers.MemberMapper";
	
	@Autowired
	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	//로그인 처리 메서드
	@Override
	public int login(String id, String pass) {

		Member m = sqlSession.selectOne(NAME_SPACE + ".login", id);
		int result = -1;		
		
		// id가 존재하지 않으면
		if(m == null) {return result;} 
		
		// 로그인 성공
		if(m.getPass().equals(pass)) {result = 1;
		// 비밀번호가 틀리면	
		} else {	result = 0;	}
		return result;
	}
	
	// member 테이블에서 id에 해당하는 회원 정보를 읽어오는 메서드 
	@Override
	public Member getMember(String id) {
		return sqlSession.selectOne(NAME_SPACE + ".getMember", id);
	}

	@Override
	public void addMember(Member member) {
		sqlSession.insert(NAME_SPACE + ".addMember", member);
	}

	@Override
	public boolean memberPassCheck(String id, String pass) {
		boolean result = false;
		String dbPass = sqlSession.selectOne(NAME_SPACE + ".login", id);
		
		if(dbPass.equals(pass)) {
			return true;
		}
		return result;
	}

	@Override
	public void updateMember(Member member) {
		sqlSession.update(NAME_SPACE + ".updateMember", member); 
	}
	
	
}
