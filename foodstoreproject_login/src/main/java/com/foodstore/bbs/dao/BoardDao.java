package com.foodstore.bbs.dao;

import java.util.List;

import com.foodstore.bbs.domain.Board;
import com.foodstore.bbs.domain.FileName;
import com.foodstore.bbs.domain.Reply;



public interface BoardDao {
	
	//게시글 리스트를 불러오는 메서드
	public abstract List<Board> boardList(
			int startRow, int num, String type, String keyword);
	
	//전체 게시글 수를 계산하는 메서드
	public abstract int getBoardCount(String type, String keyword);
	
	// 게시 글 상세보기 요청 시 호출되는 메서드
	public abstract Board getBoard(int no, boolean isCount);
	
	//다중파일의 정보를 요청 시 호출되는 메서드????
	public abstract List<FileName> getFiles(int no);

	
	// 게시 글쓰기 요청 시 호출되는 메서드
	public abstract void insertBoard(Board board);
	
	// 게시 글 수정, 삭제 시 비밀번호 입력을 체크하는 메서드
	public boolean isPassCheck(int no, String pass);
	
	// 게시 글 수정 요청 시 호출되는 메서드
	public abstract void updateBoard(Board board);
	
	// 게시 글 삭제 요청 시 호출되는 메서드 
	public abstract void deleteBoard(int no);
	
	//다중 파일 정보를 files테이블에 저장하는 메서드
	public abstract void insertFiles(List<FileName> fileNames);
	
	//다중 파일 정보를 삭제하는 메서드
	public abstract void deleteFiles(int no);
	
	//게시글 번호에 해당하는 댓글 리스트 가져오는 메서드
	public abstract List<Reply> replyList(int no);

	// 게시 글 번호에 해당하는 좋아요를 업데이트 하는 메서드
	public abstract void updateThank(int no);
	
	// 게시 글 번호에 해당하는 좋아요 정보를 가져오는 메서드
	public abstract int getThank(int no);
	
	//댓글을 추가하는 메서드
	public abstract void addReply(Reply reply);
	
	//댓글을 수정하는 메서드
	public abstract void updateReply(Reply reply);
	
	//댓글을 삭제하는 메서드
	public abstract void deleteReply(int no);
	
}
