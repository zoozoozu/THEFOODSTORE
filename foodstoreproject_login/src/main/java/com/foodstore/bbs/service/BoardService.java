package com.foodstore.bbs.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import com.foodstore.bbs.domain.Board;
import com.foodstore.bbs.domain.FileName;
import com.foodstore.bbs.domain.Reply;

public interface BoardService {
	
	//게시글 리스트를 불러오는 메서드
	public abstract Map<String, Object> boardList(
			int pageNum, String type, String keyword);
	
	// 게시 글 상세보기 요청 시 호출되는 메서드
	public abstract Board getBoard(int no, boolean isCount);
	
	//다중파일의 정보를 요청 시 호출되는 메서드
	public abstract List <FileName> getFiles(int no);
	
	// 게시 글쓰기 요청 시 호출되는 메서드
	public abstract void insertBoard(Board board);
	
	// 게시 글 수정, 삭제 시 비밀번호 입력을 체크하는 메서드
	public boolean isPassCheck(int no, String pass);
	
	// 게시 글 수정 요청 시 호출되는 메서드
	public abstract void updateBoard(Board board);
	
	// 게시 글 삭제 요청 시 호출되는 메서드 
	public abstract void deleteBoard(int no);
	
	//에노테이션 기반 트랜잭션을 사용 다중 파일 정보를 테이블에 저장 메서드
	public abstract void insertBoardMulti(String filePath, Board board,
			MultipartFile multipartFile, MultipartFile[] multiFiles) throws Exception;
	
	//다중 파일 정보를 삭제하는 메서드s
	public abstract void deleteFiles(int no);
	
	//해당 게시물의 댓글 리스트를 반환하는 메서드
	public abstract List<Reply> replyList(int no);
	
	// 게시 글 번호에 해당하는 좋아요를 업데이트 하고 정보를 불러오는 메서드
	public abstract int thank(int no);
	
	// 댓글을 등록하는 메서드
	public abstract void addReply(Reply reply);
	
	//댓글 수정 메서드
	public abstract void updateReply(Reply reply);
	
	//댓들 삭제 메서드
	public abstract void deleteReply(int no);

}
