<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script type="text/javascript" src="resources/js/order.js"></script>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<article>
	<h2>Cart</h2>
	<%-- 	<c:forEach var="c" items="${cartList }" varStatus="status">
		<p>${c.cartId }</p>
		<p>${c.userId }</p>
		<p>${c.productId }</p>
		<p>${c.amount }</p>
	</c:forEach> --%>
	<form action="test">
		<p>주문자명 : ${sessionScope.member.name }</p>
		<p>배송지 설정</p>
		<!-- radiobutton을 이용해 구현 -->
		<p>기존 배송지</p>
		<p>받는 분 : ${sessionScope.member.name}</p>
		<p>주소 : ${sessionScope.member.address1 }</p>
		<p>상세주소 : ${sessionScope.member.address2 }</p>
		<p>일반배송 요청사항 : 요청사항선택 select로 구현</p>
		<!-- 그림 파일 가져다가 보여주기 (파일 위치랑 이름 가져오기)-->
		<p>productId : ${productNo }</p>
		<p>amount : ${amount }</p>

		<p>최종 결제정보</p>
		<p>상품금액</p>
		<p>최종 결제금액</p>
		<!-- 카카오톡 결제 -->
		<!-- 네이버페이 결제 -->
		<button>결제하기</button>
	</form>
</article>