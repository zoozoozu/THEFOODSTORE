package com.foodstore.bbs.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.foodstore.bbs.domain.Cart;
import com.foodstore.bbs.domain.Member;
import com.foodstore.bbs.exception.MemberNotFoundException;
import com.foodstore.bbs.exception.MemberPassCheckFailException;
import com.foodstore.bbs.service.CartService;
import com.foodstore.bbs.service.MemberService;

// 스프링 MVC의 컨트롤러임을 선언하고 있다.
@Controller
@SessionAttributes({"member", "m"})
public class MemberController {

	private MemberService memberService;
	private CartService cartService;

	@Autowired
	public void setMemberService(MemberService memberService) {
		this.memberService = memberService;
	}
	
	@Autowired
	public void setCartService(CartService cartService) {
		this.cartService = cartService;
	}

	// 로그인 컨트롤
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(Model model, @RequestParam("id") String id, @RequestParam("pass") String pass,
			HttpSession session, HttpServletResponse response) throws ServletException, IOException {

		int result = memberService.login(id, pass);

		if (result == -1) {
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("	alert('존재하지 않는 아이디 입니다.');");
			out.println("	history.back();");
			out.println("</script>");

			return null;

		} else if (result == 0) {
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("	alert('비밀번호가 다릅니다.');");
			out.println("	location.href='loginForm'");
			out.println("</script>");

			return null;
		}

		Member member = memberService.getMember(id);
		session.setAttribute("isLogin", true);
		session.setAttribute("id", id);

		// 모델에 저장
		model.addAttribute("member", member);
		System.out.println("member.name : " + member.getName());

		List<Cart> cartList = cartService.cartList(id);
		//로그인 할때 그 로그인하는 사람의 카트도 가져온다.
		if(cartList != null) {
			member.setCartList(cartList);
			session.setAttribute("cartList", cartList);	
		}
		
		// 뷰 리다이랙트 호출
		return "redirect:/main";
	}

	// 로그아웃 컨트롤
	@RequestMapping("/logout")
	public String logout(HttpSession session) {

		// 현재 세션을 종료하고 새로운 세션을 시작한다.
		session.invalidate();

		// 리다이렉트
		return "redirect:/main";
	}
	
	@RequestMapping("/joinInfo")
	public String joinInfo(Model model, Member member,
			String pass1, String emailId, String emailDomain,
			String mobile1, String mobile2, String mobile3,
			String phone1, String phone2, String phone3,
			@RequestParam(value="emailGet", required=false,
			defaultValue="false")boolean emailGet) {
		System.out.println("/joinInfo");
		
		member.setPass(pass1);
		member.setEmail(emailId + "@" + emailDomain);
		member.setMobile(mobile1 + "-" + mobile2 + "-" + mobile3);
		
		if(phone2.equals("") || phone3.equals("")) {
			member.setPhone("");
		} else {
			member.setPhone(phone1 + "-" + phone2 + "-" + phone3);
		}
		
		member.setEmailGet(Boolean.valueOf(emailGet));
		
		model.addAttribute("m", member);
		return "member/memberInfo";
	}
	
	@RequestMapping("/overlapIdCheck")
	public String overlapIdCheck(Model model, String id) {
		boolean overlap = memberService.overlapIdCheck(id);
		model.addAttribute("id", id);
		model.addAttribute("overlap",overlap);
		return "forward:WEB-INF/views/member/overlapIdCheck.jsp";
	}
	
	@RequestMapping("/joinResult")
	public String joinResult(HttpSession session, 
			SessionStatus sessionStatus,
			@ModelAttribute("m") Member member) {
		System.out.println("joinResult : " + member.getName());
		memberService.addMember(member);
		sessionStatus.setComplete();
		return "redirect:boardList";
	}
	
	@RequestMapping("/memberUpdateForm")
	public String updateForm(Model model, String id) {
		Member member = memberService.getMember(id);
		model.addAttribute("member", member);
		
		return "member/memberUpdateForm";
	}
	
	@RequestMapping("/memberUpdateInfo")
	public String memberUpdateInfo(Model model, Member member,
			String pass1, String emailId, String emailDomain,
			String mobile1, String mobile2, String mobile3,
			String phone1, String phone2, String phone3,
			@RequestParam(value="emailGet", required=false,
			defaultValue="false")boolean emailGet) {
		System.out.println("/memberUpdateInfo");
		
		member.setPass(pass1);
		member.setEmail(emailId + "@" + emailDomain);
		member.setMobile(mobile1 + "-" + mobile2 + "-" + mobile3);
		
		if(phone2.equals("") || phone3.equals("")) {
			member.setPhone("");
		} else {
			member.setPhone(phone1 + "-" + phone2 + "-" + phone3);
		}
		
		member.setEmailGet(Boolean.valueOf(emailGet));
		
		model.addAttribute("m", member);
		return "member/memberUpdateInfo";
	}
	
	@RequestMapping("/memberUpdateResult")
	public String updateResult(HttpSession session, 
			SessionStatus sessionStatus,
			@ModelAttribute("m") Member member) {
		System.out.println("updateResult : " + member.getName());
		memberService.updateMember(member);
		return "redirect:boardList";
	}

	// 아이디가 다를 경우 예외 처리하는 메서드
	@ExceptionHandler(MemberNotFoundException.class)
	public String memberNotFound(Model model) {
		model.addAttribute("title", "존재하지 않는 아이디");
		return "errors/controllerException";
	}

	// 비밀번호가 다를 경우 예외처리 메서드
	@ExceptionHandler(MemberPassCheckFailException.class)
	public String memberPassCheckFail(Model model) {
		model.addAttribute("title", "비밀번호가 맞지 않음");
		return "errors/controllerException";
	}
}
