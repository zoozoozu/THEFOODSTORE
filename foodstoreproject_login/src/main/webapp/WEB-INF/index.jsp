<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<!-- Mobile Metas -->
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Site Metas -->
<title>The Food Store</title>

<meta name="keywords" content="">
<meta name="description" content="">
<meta name="author" content="">

<!-- Bootstrap CSS -->
<link rel="stylesheet" href="resources/css/bootstrap.min.css">
<!-- Site CSS -->
<link rel="stylesheet" href="resources/css/style.css">
<!-- Responsive CSS -->
<link rel="stylesheet" href="resources/css/responsive.css">
<!-- Custom CSS -->
<link rel="stylesheet" href="resources/css/custom.css">

<!-- <link
	href="https://fonts.googleapis.com/css?family=Black+Han+Sans|Do+Hyeon&display=swap"
	rel="stylesheet">
<link type="text/css" href="resources/css/board.css" rel="stylesheet" />
<link type="text/css" href="resources/css/reply.css" rel="stylesheet" />
<script src="resources/js/bootstrap.min.js"></script> -->

</head>
<body>
	<%@ include file="pages/header.jsp"%>
	<!-- <div class="clear"></div> -->
	<c:if test="${ not empty param.body }">
		<jsp:include page="${ param.body }" />
	</c:if>
	<div class="clear"></div>
	<%@ include file="pages/footer.jsp"%>

	<!-- ALL JS FILES -->
	<script type="text/javascript" src="resources/js/jquery-3.2.1.min.js"></script>
	<script type="text/javascript" src="resources/js/popper.min.js"></script>
	<script type="text/javascript" src="resources/js/bootstrap.min.js"></script>
	
	<!-- ALL PLUGINS -->
	<script type="text/javascript" src="resources/js/jquery.superslides.min.js"></script>
	<script type="text/javascript" src="resources/js/bootstrap-select.js"></script>
	<script type="text/javascript" src="resources/js/inewsticker.js"></script>
	<script type="text/javascript" src="resources/js/bootsnav.js"></script>
	<script type="text/javascript" src="resources/js/images-loded.min.js"></script>
	<script type="text/javascript" src="resources/js/isotope.min.js"></script>
	<script type="text/javascript" src="resources/js/owl.carousel.min.js"></script>
	<script type="text/javascript" src="resources/js/baguetteBox.min.js"></script>
	<script type="text/javascript" src="resources/js/form-validator.min.js"></script>
	<script type="text/javascript" src="resources/js/contact-form-script.js"></script>
	<script type="text/javascript" src="resources/js/custom.js"></script>

	<script type="text/javascript" src="resources/js/formcheck.js"></script>
	<script type="text/javascript" src="resources/js/member.js"></script>
	<script type="text/javascript" src="resources/js/jquery-1.11.3.min.js"></script>
	<script type="text/javascript"
		src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
</body>
</html>