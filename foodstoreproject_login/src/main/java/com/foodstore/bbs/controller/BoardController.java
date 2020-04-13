package com.foodstore.bbs.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.TypeMismatchException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.foodstore.bbs.domain.Board;
import com.foodstore.bbs.domain.FileName;
import com.foodstore.bbs.domain.Reply;
import com.foodstore.bbs.service.BoardService;
import com.foodstore.bbs.exception.BoardPassCheckFailException;

@Controller
public class BoardController {
	
	private final static String DEFAULT_PATH="/resources/upload/";
	
	@Autowired
	private BoardService boardService;
	
	public void setBoardService(BoardService boardService) {
		this.boardService=boardService;
	}
	
	//게시판 리스트 불러오기
	@RequestMapping({"/boardList","/list"})
	public String boardList(Model model, 
			@RequestParam(value="pageNum",required = false, defaultValue="1") int pageNum,
			@RequestParam(value="type",required = false, defaultValue="null") String type,
			@RequestParam(value="keyword",required = false, defaultValue="null") String keyword) {
		//service 클래스를 이용 게시글 리스트 호출
		Map<String, Object> modelMap = boardService.boardList(pageNum, type, keyword);
		
		//모델 객체에 저장
		model.addAllAttributes(modelMap);
		
		//뷰이름 반환
		return "board/boardList";
	}
	
	//게시판 상세보기 
	@RequestMapping("/boardDetail")
	public String boardDetail(Model model, int no,
			@RequestParam(value="pageNum", required = false, defaultValue="1") int pageNum,
			@RequestParam(value="type",required = false, defaultValue="null") String type,
			@RequestParam(value="keyword",required = false, defaultValue="null") String keyword)
			throws Exception{
		//검색여부 체크
		boolean searchOption = (type.equals("null") || keyword.equals("null")) ? false : true;
		
		//no에 해당하는 게시글 내용 가져오기 트잭션처리 메서드 호출
		Board board= boardService.getBoard(no, true);
		//현제 게시글에 대한 댓글 리스트 
		List<Reply> replyList =boardService.replyList(no);
		List<FileName> files = boardService.getFiles(no);
		//모델 객체에 저장
		model.addAttribute("board", board);
		model.addAttribute("replyList", replyList);
		model.addAttribute("files", files);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("searchOption", searchOption);
		
		//검색요청시 인코딩?
		if(searchOption) {
			model.addAttribute("keyword", URLEncoder.encode(keyword, "utf-8"));
			model.addAttribute("type", type);
			model.addAttribute("word", keyword);
		}
		
		if(board.getFile1() != null) {			
			board.setFile1(URLEncoder.encode(board.getFile1(), "utf-8"));
		}
		
		for(FileName fileName : files) {			
			fileName.setFile2(URLEncoder.encode(fileName.getFile2(), "utf-8"));
			System.out.println(fileName.getFile2());
		}
		
		model.addAttribute("files", files);
		
		return "board/boardDetail";
	}
	
	//게시물 쓰기
	@RequestMapping(value="/writeProcess", method=RequestMethod.POST)
	public String insertBoard(HttpServletRequest request,
			String title, String writer, String content, String pass,
			@RequestParam(value="file1", required=false) MultipartFile multipartFile) 
			throws IOException{
		
		System.out.println("originName : " + multipartFile.getOriginalFilename());
		System.out.println("name : " + multipartFile.getName());
		
		//서비스 클래스를 이용 폼에서 넘어온 정보를 테이블에 추가
		Board board = new Board();
		board.setTitle(title);
		board.setWriter(writer);
		board.setContent(content);
		board.setPass(pass);
		
		//업로드한 멀티파트파일 데이터에 접근
		if(! multipartFile.isEmpty()) {
			String filePath=
					request.getServletContext().getRealPath(DEFAULT_PATH);
			//범용고유식별자 생성
			UUID uid = UUID.randomUUID();
			String saveName = 
					uid.toString()+"_"+multipartFile.getOriginalFilename();
			
			File file = new File(filePath, saveName);
			System.out.println("insertBoard - newName : " + file.getName());
			
			//업로드 되는 파일을 upload 폴더로 저장
			multipartFile.transferTo(file);
			
			//업로드 파일 명을 Board 객체에 저장
			board.setFile1(saveName);

		}
		boardService.insertBoard(board);
		
		//게시물을 쓰고 리스트로 리다이렉트
		return "redirect:boardList";
	}
	//다중 파일 업로드 폼에서 들어오는 게시글 쓰기 처리 메서드
	@RequestMapping(value="/writeMultiFile", method=RequestMethod.POST)
	public String insertBoardMulti(
			HttpServletRequest request,
			String title, String writer, String content, String pass,
			@RequestParam(value="file1", required=false) MultipartFile multipartFile,
			@RequestParam(value="files", required=false) MultipartFile[] multiFiles) 
					throws Exception {	
		
		System.out.println("files : " + multiFiles.length);
		System.out.println("originName : " + multipartFile.getOriginalFilename());
		System.out.println("name : " + multipartFile.getName());
		
		Board board = new Board();
		board.setTitle(title);
		board.setWriter(writer);
		board.setContent(content);
		board.setPass(pass);
				
		// Request 객체를 이용해 파일이 저장될 실제 경로를 구한다.
		String filePath = 
				request.getServletContext().getRealPath(DEFAULT_PATH);
		
		//애노테이션을 이용한 트랜잭션 처리 메서드 호출
		boardService.insertBoardMulti(filePath, board, multipartFile, multiFiles);
		
		//리다이랙트
		return "redirect:boardList";
	}
	
	//수정하기 클릭
	@RequestMapping("/update")
	public String updateBoard(Model model, HttpServletResponse response,
			PrintWriter out, int no, String pass,
			@RequestParam(value="pageNum", required = false,
			defaultValue="1") int pageNum,
			@RequestParam(value="type",required = false,
			defaultValue="null") String type,
			@RequestParam(value="keyword",required = false,
			defaultValue="null") String keyword)
			throws Exception{
		//서비스 클래스를 이용 비밀번호 확인
		boolean result = boardService.isPassCheck(no, pass);
		//비밀번호가 틀릴경우
		if(! result) {
			response.setContentType("text/html; charset=utf-8");
			out.println("<script>");
			out.println("alert('비밀번호가 맞지 않습니다.');");
			out.println("history.back();");
			out.println("</script>");
			return null;
		}
		//검색여부 체크
		boolean searchOption = (type.equals("null") 
				|| keyword.equals("null")) ? false : true;
		
		//수정할 no에 해당하는 게시글 수정폼에 출력
		Board board = boardService.getBoard(no , false);
		
		//뷰로 보낼 모델 저장
		model.addAttribute("board", board);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("searchOption", searchOption);
		
		//검색요청시 인코딩?
		if(searchOption) {
			model.addAttribute("keyword", URLEncoder.encode(keyword, "utf-8"));
			model.addAttribute("type", type);
			model.addAttribute("word", keyword);
		}
		
		//수정폼으로 이동
		return "board/updateForm";
	}
	
	//수정을 요청
	@RequestMapping(value="update", method=RequestMethod.POST)
	public String updateBoard(HttpServletResponse response, PrintWriter out,
			Board board,RedirectAttributes reAttrs,
			@RequestParam(value="pageNum", required = false, 
			defaultValue="1") int pageNum,
			@RequestParam(value="type",required = false, 
			defaultValue="null") String type,
			@RequestParam(value="keyword",required = false, 
			defaultValue="null") String keyword)
			throws Exception{
		//서버클래스를 이용 비밀번호 확인
		boolean result = boardService.isPassCheck(board.getNo(), board.getPass());
		//비밀번호가 틀릴경우
		if(! result) {
			response.setContentType("text/html; charset=utf-8");
			out.println("<script>");
			out.println("alert('비밀번호가 맞지 않습니다.');");
			out.println("history.back();");
			out.println("</script>");
			return null;
		}
		//검색여부 체크
		boolean searchOption = (type.equals("null") || keyword.equals("null")) ? false : true;
		
		//서비스 클래스를 이용 테이블의 게시글 수정
		boardService.updateBoard(board);
		reAttrs.addAttribute("pageNum", pageNum);
		//reAttrs.addAttribute("searchOption", searchOption);
		//검색요청시 인코딩?
		if(searchOption) {
			reAttrs.addAttribute("type", type);
			reAttrs.addAttribute("keyword", keyword);
		}
		
		return "redirect:boardList";
	}
	
	//삭제요청
	@RequestMapping({"/delete","deleteBoard"})
	public String deleteBoard(HttpServletResponse response, PrintWriter out,
			int no, String pass, RedirectAttributes reAttrs,
			@RequestParam(value="pageNum", required = false,
			defaultValue="1") int pageNum,
			@RequestParam(value="type",required = false, 
			defaultValue="null") String type,
			@RequestParam(value="keyword",required = false, 
			defaultValue="null") String keyword)
			throws Exception {
		//서비스 클래스를 이용 비밀번호 확인
		boolean result = boardService.isPassCheck(no, pass);
		//비밀번호가 틀릴경우
		if(! result) {
			response.setContentType("text/html; charset=utf-8");
			out.println("<script>");
			out.println("alert('비밀번호가 맞지 않습니다.');");
			out.println("history.back();");
			out.println("</script>");
			return null;
		}
		//검색여부 체크
		boolean searchOption = (type.equals("null") 
				|| keyword.equals("null")) ? false : true;
		//서비스 클래스를이용 다중파일 삭제
		boardService.deleteFiles(no);
		//서비스클래스를 이용 테이블 데이터 삭제
		boardService.deleteBoard(no);
		
		reAttrs.addAttribute("pageNum", pageNum);
		
		//검색요청시 인코딩?
		if(searchOption) {
			reAttrs.addAttribute("type", type);
			reAttrs.addAttribute("keyword", keyword);
		}
		
		return "redirect:boardList";
	}
	
	// 게시 글 상세보기에서 들어오는 파일 다운로드 요청을 처리하는 메서드	
		@RequestMapping("/fileDownload")
		public void download(HttpServletRequest request, 
				HttpServletResponse response) throws Exception {

			String fileName = request.getParameter("fileName");
			System.out.println("beforeFileName : " + fileName);		
			
			String filePath = 
					request.getServletContext().getRealPath(DEFAULT_PATH);		
						
			System.out.println("afterFileName : " + fileName);
			
			File file = new File(filePath, fileName);
			System.out.println("file.getName() : " + file.getName());
			
			// 응답 데이터에 파일 다운로드 관련 컨텐츠 타입 설정이 필요하다.
			response.setContentType("application/download; charset=UTF-8");
			response.setContentLength((int) file.length());
			
			// 한글 파일명을 클라이언트로 바로 내려 보내기 때문에 URLEncoding		
			fileName = URLEncoder.encode(file.getName(), "UTF-8");
			System.out.println("다운로드 fileName : " + fileName);
			
			// 전송되는 파일 이름을 한글 그대(원본파일 이름 그대로)로 보내주기 위한 설정
			response.setHeader("Content-Disposition", 
					"attachment; filename=\"" + fileName + "\";");
			
			// 파일로 전송되야 하므로 전송되는 데이터 인코딩은 바이너리로 설정
			response.setHeader("Content-Transfer-Encoding", "binary");
			
			// 파일을 클라이언트로 보내기 위해 응답 스트림을 구한다.
			OutputStream out = response.getOutputStream();
			FileInputStream fis = null;
			
			//데이터를 읽고 
			fis = new FileInputStream(file);

			// 스프링이 제공하는 FileCopyUtils를 이용해 응답 스트림에 파일을 복사한다.
			FileCopyUtils.copy(fis,  out);
			
			if(fis != null) {
				fis.close();
			}
			
			//데이터 출력
			out.flush();	
		}
		
		//400Exception 처리 매서드
		@ExceptionHandler(TypeMismatchException.class)
		public String bedRequestException(Model model) {
			model.addAttribute("title", "요청 파라미터가 잘못 되었습니다.");
			return "errors/controllerException";
		}
		//게시판 수정 삭제 시에 비밀번호가 맞지 않으면 발생하는 Exception 처리
		@ExceptionHandler(BoardPassCheckFailException.class)
		public String boardPassCheckFaill(Model model) {
			model.addAttribute("title", "비밀번호가 맞지 않음");
		return "errors/controllerException";
		}
}