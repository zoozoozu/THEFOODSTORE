<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>The Food Store</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link href="https://fonts.googleapis.com/css?family=Black+Han+Sans|Do+Hyeon&display=swap" rel="stylesheet">
<link type="text/css" href="resources/css/global.css" rel="stylesheet" />
<link type="text/css" href="resources/css/board.css" rel="stylesheet" />
<link type="text/css" href="resources/css/product.css" rel="stylesheet" />
<link type="text/css" href="resources/css/reply.css"  rel="stylesheet" />
<!-- <meta name="viewport" content="width=device-width, initial-scale=1"> -->
<script src="resources/js/bootstrap.min.js"></script>
<script type="text/javascript" src="resources/js/formcheck.js"></script>
<script type="text/javascript" src="resources/js/productreply.js"></script>
<script type="text/javascript" src="resources/js/member.js"></script>
<script type="text/javascript" src="resources/js/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
</head>
<body>
	<div id="wrap">		
		<%@ include file="pages/header.jsp"%>		
		<!-- <div class="clear"></div> -->
		<c:if test="${ not empty param.body }">
			<jsp:include page="${ param.body }" />
		</c:if>
		<div class="clear"></div>		
		<%@ include file="pages/footer.jsp"%>
	</div>
</body>
</html>