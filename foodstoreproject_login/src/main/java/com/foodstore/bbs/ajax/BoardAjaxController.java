package com.foodstore.bbs.ajax;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.foodstore.bbs.domain.Reply;
import com.foodstore.bbs.service.BoardService;

@Controller
public class BoardAjaxController {
	@Autowired
	BoardService boardService;

	// 좋아요 에이작스
	@RequestMapping("/thank.ajax")
	@ResponseBody
	public Map<String, Integer> thank(int no) {
		
		Map<String, Integer> result = new HashMap<String, Integer>();		
		result.put("thank", boardService.thank(no));
		
		// {"thank": 10}
		return result;
	}

	// 댓글 쓰기 요청처리 컨트롤러
	@RequestMapping("/replyWrite.ajax")
	@ResponseBody
	public List<Reply> addReply(Reply reply) {
		// 댓글 작성
		boardService.addReply(reply);

		return boardService.replyList(reply.getBbsNo());
	}

	// 댓글 수정 요청 처리 메서드
	@RequestMapping("/replyUpdate.ajax")
	@ResponseBody
	public List<Reply> updateReply(Reply reply) {
		// 새로운 댓글 등록
		boardService.updateReply(reply);
		// 새롭게 갱신 댓글 리스트 반환.
		return boardService.replyList(reply.getBbsNo());
	}

	// 댓글 삭제 요청 메서드
	@RequestMapping("/replyDelete.ajax")
	@ResponseBody
	public List<Reply> deleteReply(int no, int bbsNo) {
		// 새로운 댓글을 등록한다.
		boardService.deleteReply(no);
		// 새롭게 갱신된 댓글 리스트를 가져와 반환한다.
		return boardService.replyList(bbsNo);
	}

}
