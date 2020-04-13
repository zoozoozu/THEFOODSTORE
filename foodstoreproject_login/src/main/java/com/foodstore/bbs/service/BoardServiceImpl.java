package com.foodstore.bbs.service;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.support.TransactionTemplate;
import org.springframework.web.multipart.MultipartFile;

import com.foodstore.bbs.dao.BoardDao;
import com.foodstore.bbs.domain.Board;
import com.foodstore.bbs.domain.FileName;
import com.foodstore.bbs.domain.Reply;

@Service
public class BoardServiceImpl implements BoardService {

	// 한페이지에 보여줄 게시글 수 상수 선언
	private static final int PAGE_SIZE = 10;
	// 한 페이지에 보여줄 그룹의 수를 상수로 선언
	private static final int PAGE_GROUP = 10;

	@Autowired
	private BoardDao boardDao;

	public void setBoardDao(BoardDao boardDao) {
		this.boardDao = boardDao;
	}

	@Autowired
	private TransactionTemplate transactionTemplate;

	// 게시판 리스트를 불러오는 메서드
	@Override
	public Map<String, Object> boardList(int pageNum, String type, String keyword) {
		// 요청 파라미터의 pageNum을 현제 페이지로 설정
		int currentPage = pageNum;
		// 요청한 페이지에 해당하는 게시글 리스트 첫번째 행값을 계산
		int startRow = (currentPage - 1) * PAGE_SIZE;
		// 게시글 수 에 대한 변수 선언
		int listCount = 0;

		// 검색여부 확인
		boolean searchOption = (type.equals("null")) || keyword.equals("null") ? false : true;
		// 게시글 전체 글수를 가져오기
		listCount = boardDao.getBoardCount(type, keyword);
		System.out.println("listCount : " + listCount + ", type : " + type + ", keyword : " + keyword);

		// 게시 글 리스트를 DB로 부터 객체를 저장하는 리스트에 저장한다.
		if (listCount > 0) {
			List<Board> boardList = boardDao.boardList(startRow, PAGE_SIZE, type, keyword);
			int pageCount = listCount / PAGE_SIZE + (listCount % PAGE_SIZE == 0 ? 0 : 1);
			int startPage = (currentPage / PAGE_GROUP) * PAGE_GROUP + 1
					- (currentPage % PAGE_GROUP == 0 ? PAGE_GROUP : 0);
			int endPage = startPage + PAGE_GROUP - 1;
			if (endPage > pageCount) {
				endPage = pageCount;
			}
			Map<String, Object> modelMap = new HashMap<String, Object>();

			modelMap.put("boardList", boardList);
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
				modelMap.put("type", type);
			}

			return modelMap;
		} else {
			return null;
		}

	}


	// 게시판 상세보기를 불러오는 메서드 트랜잭션 에너테이션을이용 처리
	@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.DEFAULT, rollbackFor = { Exception.class,
			RuntimeException.class })
	@Override
	public Board getBoard(int no, boolean isCount) {

		return boardDao.getBoard(no, isCount);
	}
	//다중 파일정보를 불러오는 메서드
	@Override
	public List<FileName> getFiles(int no) {
		return boardDao.getFiles(no);
	}
	

	// 게시판 쓰기 메서드
	@Override
	public void insertBoard(Board board) {
		boardDao.insertBoard(board);

	}

	// 다중 파일 정보를 에노테이션 트랜잭션을 이용한 테이블 저장 메서드
	@Transactional
	@Override
	public void insertBoardMulti(String filePath, Board board, 
			MultipartFile multipartFile, MultipartFile[] multiFiles)
			throws Exception {
		// 업로드한 다중 파일 접근
		if(!multipartFile.isEmpty()) {
			UUID uid = UUID.randomUUID();
			String saveName =
			uid.toString() + "_" + multipartFile.getOriginalFilename();
			File file = new File(filePath, saveName);
			System.out.println("insertBoardMulti - newName : " + file.getName());
			
			// 업로드 되는 파일을 upload 폴더로 저장
			multipartFile.transferTo(file);
			
			// 업로드된 파일 명을 Board 객체에 저장
			board.setFile1(saveName);
		}
		//Dao클래스를 이용 정보 추가
		boardDao.insertBoard(board);
		System.out.println("insert No : "+ board.getNo());
		
		//다중 파일 업로드 처리
		ArrayList<FileName> fileNames = new ArrayList<FileName>();
		
		for(int i = 0; i < multiFiles.length; i++) {
			
			MultipartFile uploadFile = multiFiles[i];
			
			// 다중 업로드된 파일 데이터가 존재하면
			if(! uploadFile.isEmpty()) { 

				UUID uid = UUID.randomUUID();
				String saveName = 
						uid.toString() + "_" + uploadFile.getOriginalFilename();
				
				File file = new File(filePath, saveName);
				System.out.println("multiNewName : " + file.getName());			
				
				// 업로드 되는 파일을 upload 폴더로 저장
				uploadFile.transferTo(file);
				
				// FileName 객체를 생성해 파일 하나의 정보를 저장 리스트에 담는다. 
				FileName fileName = new FileName(saveName, board.getNo());
				fileNames.add(fileName);
			}
		}
		if(! fileNames.isEmpty()) {
			boardDao.insertFiles(fileNames);
		}
	}

	// 게시글 비밀번호 체크하는 메서드
	@Override
	public boolean isPassCheck(int no, String pass) {
		return boardDao.isPassCheck(no, pass);
	}

	// 수정요청 메서드
	@Override
	public void updateBoard(Board board) {
		boardDao.updateBoard(board);

	}

	// 삭제요청 메서드
	@Override
	public void deleteBoard(int no) {
		boardDao.deleteBoard(no);

	}
	//다중 첨부파일 삭제 메서드
	@Override
	public void deleteFiles(int no) {
		boardDao.deleteFiles(no);
	}

	//게시글 번호에 해당하는 댓글리스트를 반환하는 메서드
	@Override
	public List<Reply> replyList(int no) {
		return boardDao.replyList(no);
	}

	// 게시 글 번호에 해당하는 좋아요를 업데이트 하고 정보를 불러오는 메서드
	@Override
	public int thank(int no) {
		//좋아요 업데이트
		boardDao.updateThank(no);
		//좋아요 정보 불러오기
		return boardDao.getThank(no);
	}

	//댓글을 등록하는 메서드
	@Override
	public void addReply(Reply reply) {
		boardDao.addReply(reply);
	}

	//댓글 수정 메서드
	@Override
	public void updateReply(Reply reply) {
		boardDao.updateReply(reply);
	}

	//댓글 삭제 메서드
	@Override
	public void deleteReply(int no) {
		boardDao.deleteReply(no);
		
	}
}
