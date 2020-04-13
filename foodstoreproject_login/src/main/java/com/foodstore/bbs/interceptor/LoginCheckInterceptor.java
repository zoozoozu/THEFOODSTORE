package com.foodstore.bbs.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

//접속자가 로그인 상태인지 체크하는 인터셉터
public class LoginCheckInterceptor implements HandlerInterceptor {
	// 1컨트롤러 실행전
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// session에 isLogin으로 id데이터가 없으면 로그인 상태가 아님
		if (request.getSession().getAttribute("isLogin") == null) {
			response.sendRedirect("loginForm");
			return false;
		}
		return true;
	}

	// 2컨트롤러 실행후
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub

	}

	// 3뷰가 생성되고 클라이언트가 전송된후
	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		// TODO Auto-generated method stub

	}
	// HandlerInterceptor는 공통적으로 처리해야 할 것이 있을 때 주로 사용

}
