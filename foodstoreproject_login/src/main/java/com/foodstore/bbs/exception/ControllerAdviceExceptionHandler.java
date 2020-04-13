package com.foodstore.bbs.exception;

import org.springframework.beans.TypeMismatchException;
import org.springframework.ui.Model;
import org.springframework.web.HttpRequestMethodNotSupportedException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.mvc.multiaction.NoSuchRequestHandlingMethodException;

// 컨트롤러에서 발생하는 공통 Exception 처리 클래스
@ControllerAdvice("com.foodstore.bbs")
public class ControllerAdviceExceptionHandler {
	
	// Spring MVC 지원 Exception 처리
	@ExceptionHandler(RuntimeException.class)
	public String runtimeExceptionHandler(Model model) {		
		model.addAttribute("title", "서버에서 처리중 에러 발생");
		return "errors/runtimeException";
	}
	
	// Not Found(404)
	@ExceptionHandler(NoSuchRequestHandlingMethodException.class)
	public String notFoundException(Model model) {
		model.addAttribute("title", "요청한 페이지를 찾을 수 없습니다.");
		return "errors/commonException";
	}
	
	// Bad Request(400)
	@ExceptionHandler(TypeMismatchException.class)
	public String bedRequestException(Model model) {
		model.addAttribute("title", "요청 파라미터가 잘못 되었습니다."); 
		return "errors/commonException";
	}
	
	// Bad Request(405)
	@ExceptionHandler(HttpRequestMethodNotSupportedException.class)
	public String methodNotSupported(Model model) {
		model.addAttribute("title", "지원하지 않는 요청 방식"); 
		return "errors/runtimeException";
	}
}
