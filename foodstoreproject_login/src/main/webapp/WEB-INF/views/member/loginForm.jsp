<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>    
<article>
	<h2 class="memberTitle">로그인 페이지</h2>
	<form name="loginForm" id="loginForm" action="login" method="post">
		<div>아 이 디 : <input type="text" name="id" /></div>
		<div>비밀번호 : <input type="password" name="pass" /></div>
		<div class="btnSubmit"><input type="submit" value="로그인" /></div>
	</form>
	<a href="joinForm">회원가입</a>
</article>