<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<header>
	<div id="logo">
		<a href="${ pageContext.servletContext.contextPath }/"> <img
			src="resources/images/brand.png" alt="starbucks" width="120"
			height="120" /></a>
	</div>
	<div id="header_link">
		<ul>
			<c:if test="${sessionScope.isLoin}">
				<li><span id="message">안녕하세요 ${ sessionScope.member.name }님</span>
				</li>
			</c:if>
			<li><a
				href='${pageContext.servletContext.contextPath }/
				${sessionScope.isLogin ? "logout" : "loginForm"}'>
					${sessionScope.isLogin ? "로그아웃" : "로그인" } </a></li>
			<li><a href="boardList">게시글 리스트</a></li>
			<li><c:if test="${ not sessionScope.isLogin }">
					<a href="joinForm">회원가입</a>
				</c:if> <c:if test="${ sessionScope.isLogin }">
					<a href="memberUpdateForm?id=${ sessionScope.member.id }">정보수정</a>
				</c:if></li>
			<li><a href="#">주문/배송조회</a></li>
			<li class="no_line"><a href="FAQ">고객센터</a></li>
		</ul>

		<!-- <ul class=header>
			<li><a href="?requestPage=6">로그인</a></li>
			<li><a href="#">마이페이지</a></li>
			<li><a href="#">장바구니</a></li>
		</ul> -->
	</div>
	<br />
	<div class="container mt-3">
		<h2 style="text-align: center">Dynamic Tabs</h2>
		<br>
		<!-- Nav tabs -->
		<div class="w3-bar w3-theme-d3">
			<div class="container w3-center">
				<div class="w3-bar w3-theme-d3">
					<div class="w3-dropdown-hover">
						<button class="w3-button w3-theme-d3 w3-hover-theme">가공식품</button>
						<div class="w3-dropdown-content w3-bar-block w3-border">
							<a href="ProductList.mvc?code=c1000"
								class="w3-bar-item w3-button w3-hover-theme">치킨/함박/돈까스</a> <a
								href="ProductList.mvc?code=c1001"
								class="w3-bar-item w3-button w3-hover-theme">스낵</a>
						</div>
					</div>
					<div class="w3-dropdown-hover">
						<button class="w3-button w3-theme-d3 w3-hover-theme">신선식품</button>
						<div class="w3-dropdown-content w3-bar-block w3-border">
							<a href="ProductList.mvc?code=c1002"
								class="w3-bar-item w3-button w3-hover-theme">과일/채소</a> <a
								href="ProductList.mvc?code=c1003"
								class="w3-bar-item w3-button w3-hover-theme">축산</a>
						</div>
					</div>
					<div class="w3-dropdown-hover">
						<button class="w3-button w3-theme-d3 w3-hover-theme">고객의소리</button>
						<div class="w3-dropdown-content w3-bar-block w3-border">
							<a href="boardList" class="w3-bar-item w3-button w3-hover-theme">게시판</a>
							<a href="FAQ" class="w3-bar-item w3-button w3-hover-theme">Q&amp;A</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</header>