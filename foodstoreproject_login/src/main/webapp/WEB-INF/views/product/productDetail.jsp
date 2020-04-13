<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link type="text/css" href="resources/css/product.css" rel="stylesheet" />
<script type="text/javascript" src="resources/js/product.js"></script>
<script type="text/javascript" src="resources/js/jquery-3.2.1.min.js"></script>
<article>
	<div class="w3-content" style="max-width: 1100px">

		<div class="w3-row w3-padding-64" id="about">
			<div class="w3-col m6 w3-padding-large w3-hide-small">
				<img src="${product.filePath}"
					class="w3-round w3-image w3-opacity-min" alt="Table Setting"
					width="600" height="750">
			</div>

			<div class="w3-col m6 w3-padding-middle">
				<h1 class="w3-center w3-titlefont" style="line-height: 1.3em">${product.name }</h1>
				<br>
				<p class="w3-center w3-large w3-contentfont">${product.intro }</p>
				<form method="post" name="productForm">
					<input type="hidden" name="userId" value="${ sessionScope.member.id }" />
					<input type="hidden" name="productNo" value="${product.no }">
					<select id="amount" name="amount">
						<c:forEach begin="1" end="5" var="i">
							<option value="${i}">${i}</option>
						</c:forEach>
					</select>
					<div id="output">1개</div>
					<p>${sessionScope.member.id}</p>
					<hr>
					<h5 class="w3-right w3-titlefont w3-text-indigo w3-xlarge"
						id="price">
						￦
						<fmt:formatNumber pattern="###,###,###" value="${product.price }" />
					</h5>
					<br>
					<br>
					<br>
					<br>
					<br>
					<br>
					<br>
					<div class="w3-center">
						<p>
							<button id="goCart" onclick="goCart()" class="w3-button w3-theme-d3" style="width: 30%" >
								장바구니
							</button>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<button id="goOrder" onclick="action='goOrder'" class="w3-button w3-teal w3-theme-d3" style="width: 30%" >바로구매</button>
							<!-- <button formaction="order/goOrder" class="w3-button w3-teal w3-theme-d3" style="width: 30%" >바로구매</button> -->
						</p>
					</div>
				</form>
			</div>
		</div>
	</div>

	<div class="container" style="margin: 50px auto">
		<form name="replyProductWriteForm" id="replyWriteForm">
			<input type="hidden" name="productNo" value="${ product.no }" /> <input
				type="hidden" name="replyWriter"
				value="${ sessionScope.member.id }" /> <input type="hidden"
				name="gcode" value="${product.code }" />
			<c:if test="${not sessionScope.isLogin }">
				<div>
					<pre>상품평을 입력하려면 <a href="loginForm">로그인</a>을 해주세요.</pre>
				</div>
			</c:if>
			<c:if test="${sessionScope.isLogin }">
				<textarea name="replyContent" id="replyContent"></textarea>
			</c:if>
			<button class="w3-button w3-theme-d3 w3-round-small w3-right">등록</button>
		</form>
	</div>

	<!-- 댓글 test -->
	<div class="container" id="reply">
		<c:if test="${empty productReplyList }">
			<ul class="w3-ul">
				<li>
					<p class="replyContent">댓글이 존재하지 않습니다.</p>
				</li>
			</ul>
		</c:if>
		<c:if test="${not empty productReplyList }">
			<c:forEach var="replyList" items="${productReplyList }">
				<ul class="w3-ul w3-card">
					<li class="w3-bar"><img src="resources/images/img_avatar1.png"
						class="w3-bar-item w3-hide-small" style="width: 85px">
						<div class="w3-bar-item">
							<span class="w3-large">${replyList.writer}</span><br> <span>${replyList.reply}</span>
						</div></li>
				</ul>
			</c:forEach>
		</c:if>
	</div>
	<br>
	<br>

</article>
