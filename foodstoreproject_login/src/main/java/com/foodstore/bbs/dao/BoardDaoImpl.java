package com.foodstore.bbs.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.foodstore.bbs.domain.Board;
import com.foodstore.bbs.domain.FileName;
import com.foodstore.bbs.domain.Reply;

//데이터 엑세스 계층의 Bean임을 선언
@Repository
public class BoardDaoImpl implements BoardDao {
	//Mapper namespace를 상수로 정의
	private final String NAME_SPACE ="com.foodstore.bbs.mapper.BoardMapper";
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession=sqlSession;
	}
	
	//게시글 리스트 요청 메서드
	@Override
	public List<Board> boardList(
			int startRow, int num, String type, String keyword) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("startRow", startRow);
		params.put("num", num);
		params.put("type", type);
		params.put("keyword", keyword);
		
		return sqlSession.selectList(NAME_SPACE+".boardList", params);
	}
	
	//게시글 수 계산하는 메서드
	@Override
	public int getBoardCount(String type, String keyword) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("type", type);
		params.put("keyword", keyword);
		return sqlSession.selectOne(NAME_SPACE+".getBoardCount", params);
	}

	//게시글 상세보기 요청 메서드
	@Override
	public Board getBoard(int no, boolean isCount) {
		//상세보기 요청시 조회수 증가 메서드
		if(isCount) {
			sqlSession.update(NAME_SPACE+".incrementReadCount", no);
		}
		return sqlSession.selectOne(NAME_SPACE+".getBoard", no);
	}
	
	//다중 파일정보를 가저오는 메서드??
	@Override
	public List<FileName> getFiles(int no) {
		
		return sqlSession.selectList(NAME_SPACE+".getFiles", no);
	}

	//게시글 쓰기 메서드
	@Override
	public void insertBoard(Board board) {
		sqlSession.insert(NAME_SPACE+".insertBoard", board);
	}
	
	//다중 파일 정보를 테이블에 저장하는 메서드
	@Override
	public void insertFiles(List<FileName> fileNames) {
		sqlSession.insert(NAME_SPACE+".insertFileNames", fileNames);
	}
	
	//게시글 비밀번호 체크
	@Override
	public boolean isPassCheck(int no, String pass) {
		boolean result = false;
		//게시글 번호인 no파라미터 지정
		String dbpass=sqlSession.selectOne(NAME_SPACE+".isPassCheck", no);
		//비밀번호가 맞으면 true 반환
		if(dbpass.equals(pass)) {
			result=true;
		}
		return result;
	}


	//게시글 수정
	@Override
	public void updateBoard(Board board) {
		sqlSession.update(NAME_SPACE+".updateBoard", board);
	}


	//게시글 삭제
	@Override
	public void deleteBoard(int no) {
		sqlSession.delete(NAME_SPACE+".deleteBoard", no);

	}
	
	//게시글 다중 첨부파일 삭제
	@Override
	public void deleteFiles(int no) {
		sqlSession.delete(NAME_SPACE+".deleteFiles", no);
	}

	//댓글 리스트를 가져오는 
	@Override
	public List<Reply> replyList(int no) {
		return sqlSession.selectList(NAME_SPACE+".replyList", no);
	}
	//좋아요 업데이트 메서드
	@Override
	public void updateThank(int no) {
		sqlSession.update(NAME_SPACE+".updateThank", no);
	}
	//좋아요 정보를 가져오는 메서드
	@Override
	public int getThank(int no) {
		return sqlSession.selectOne(NAME_SPACE+".getThank", no);
	}
	//댓글을 추가하는 메서드
	@Override
	public void addReply(Reply reply) {
		sqlSession.insert(NAME_SPACE+".addReply", reply);
	}

	//댓글 수정 메서드
	@Override
	public void updateReply(Reply reply) {
		sqlSession.update(NAME_SPACE + ".updateReply", reply);
		
	}
	
	//댓글 삭제 메서드
	@Override
	public void deleteReply(int no) {
		sqlSession.delete(NAME_SPACE + ".deleteReply", no);
		
	}
	
	
	

}
