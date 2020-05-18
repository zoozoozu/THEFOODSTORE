<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link type="text/css" href="resources/css/product.css" rel="stylesheet" />
<script type="text/javascript" src="resources/js/order.js"></script>
<script type="text/javascript" src="resources/js/jquery-3.2.1.min.js"></script>
<body>
	<!-- Start Shop Detail  -->
	<div class="shop-detail-box-main">
		<div class="container">
			<div class="row">
				<div class="col-xl-5 col-lg-5 col-md-6">
					<div id="carousel-example-1"
						class="single-product-slider carousel slide" data-ride="carousel">
						<div class="carousel-inner" role="listbox">
							<div class="carousel-item active">
								<img class="d-block w-100" src="${product.filePath}"
									alt="First slide">
							</div>

						</div>
						<a class="carousel-control-prev" href="#carousel-example-1"
							role="button" data-slide="prev"> <i class="fa fa-angle-left"
							aria-hidden="true"></i>

						</a> <a class="carousel-control-next" href="#carousel-example-1"
							role="button" data-slide="next"> <i class="fa fa-angle-right"
							aria-hidden="true"></i>

						</a>
						<ol class="carousel-indicators">
							<li data-target="#carousel-example-1" data-slide-to="0"
								class="active"><img class="d-block w-100 img-fluid"
								src="images/smp-img-01.jpg" alt="" /></li>
							<li data-target="#carousel-example-1" data-slide-to="1"><img
								class="d-block w-100 img-fluid" src="images/smp-img-02.jpg"
								alt="" /></li>
							<li data-target="#carousel-example-1" data-slide-to="2"><img
								class="d-block w-100 img-fluid" src="images/smp-img-03.jpg"
								alt="" /></li>
						</ol>
					</div>
				</div>
				<div class="col-xl-7 col-lg-7 col-md-6">
					<div class="single-product-details">
						<h2>${product.name }</h2>
						<h5>
							￦
							<fmt:formatNumber pattern="###,###,###" value="${product.price }" />
						</h5>
						<!-- 재고처리 부분 -->
						<!-- <p class="available-stock"><span> More than 20 available / <a href="#">8 sold </a></span><p> -->
						<h4>Short Description:</h4>
						<p>${product.intro }</p>
						<form method="post" name="productForm">
							<ul>
								<li>
									<div class="form-group quantity-box">
										<label class="control-label">수량</label> <input
											name="amount" id="amount"class="form-control" value="1" min="1" max="20"
											type="number">
									</div>
								</li>
							</ul>
							<!-- 다음 페이지로 값을 전달하기 위해서 만든 폼 -->
							<div id="total">
							<h2 class = "totalPrice">
								합계 : ￦
								<fmt:formatNumber pattern="###,###,###"
									value="${product.price }" />
							</h2>
							</div>
							
							<input type="hidden" name="userId"
								value="${ sessionScope.member.id }" /> 
							<input type="hidden"
								name="productNo" value="${product.no }" />
							<input type="hidden"
								name="productPrice" id="productPrice" value="${product.price }"/>
							<hr>
							<div class="price-box-bar">
								<div class="cart-and-bay-btn">
									<button class="btn hvr-hover" onclick="action='goOrder'"
										style="color: white">Buy New</button>
									<!-- <a class="btn hvr-hover" data-fancybox-close="" 
								 onclick="action='goOrder'">
									Buy New</a>  -->
									<a class="btn hvr-hover" data-fancybox-close="" href="#">Add
										to cart</a>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>

			<div class="row my-5">
				<div class="card card-outline-secondary my-4">
					<div class="card-header">
						<h2>상품댓글</h2>
					</div>
					<div class="card-body">
						<!-- 여기서부터 댓글 반복 -->
						<c:if test="${empty productReplyList }">
							<div class="media mb-3">
								<div class="mr-2">
									<img class="rounded-circle border p-1"
										src="data:image/svg+xml;charset=UTF-8,%3Csvg%20width%3D%2264%22%20height%3D%2264%22%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20viewBox%3D%220%200%2064%2064%22%20preserveAspectRatio%3D%22none%22%3E%3Cdefs%3E%3Cstyle%20type%3D%22text%2Fcss%22%3E%23holder_160c142c97c%20text%20%7B%20fill%3Argba(255%2C255%2C255%2C.75)%3Bfont-weight%3Anormal%3Bfont-family%3AHelvetica%2C%20monospace%3Bfont-size%3A10pt%20%7D%20%3C%2Fstyle%3E%3C%2Fdefs%3E%3Cg%20id%3D%22holder_160c142c97c%22%3E%3Crect%20width%3D%2264%22%20height%3D%2264%22%20fill%3D%22%23777%22%3E%3C%2Frect%3E%3Cg%3E%3Ctext%20x%3D%2213.5546875%22%20y%3D%2236.5%22%3E64x64%3C%2Ftext%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fsvg%3E"
										alt="Generic placeholder image">
								</div>
								<div class="media-body">
									<p>댓글이 존재하지 않습니다.</p>
									<small class="text-muted"></small>
									<!-- <small class="text-muted">날짜부분 구현하기</small> -->
								</div>
							</div>
							<hr>
						</c:if>
						<c:if test="${not empty productReplyList }">
							<c:forEach var="replyList" items="${productReplyList }">
								<div class="media mb-3">
									<div class="mr-2">
										<img class="rounded-circle border p-1"
											src="data:image/svg+xml;charset=UTF-8,%3Csvg%20width%3D%2264%22%20height%3D%2264%22%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20viewBox%3D%220%200%2064%2064%22%20preserveAspectRatio%3D%22none%22%3E%3Cdefs%3E%3Cstyle%20type%3D%22text%2Fcss%22%3E%23holder_160c142c97c%20text%20%7B%20fill%3Argba(255%2C255%2C255%2C.75)%3Bfont-weight%3Anormal%3Bfont-family%3AHelvetica%2C%20monospace%3Bfont-size%3A10pt%20%7D%20%3C%2Fstyle%3E%3C%2Fdefs%3E%3Cg%20id%3D%22holder_160c142c97c%22%3E%3Crect%20width%3D%2264%22%20height%3D%2264%22%20fill%3D%22%23777%22%3E%3C%2Frect%3E%3Cg%3E%3Ctext%20x%3D%2213.5546875%22%20y%3D%2236.5%22%3E64x64%3C%2Ftext%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fsvg%3E"
											alt="Generic placeholder image">
									</div>
									<div class="media-body">
										<p>${replyList.reply}</p>
										<small class="text-muted">${replyList.writer} Posted
											by Anonymous on 3/1/18</small>
									</div>
								</div>
								<hr>
							</c:forEach>
						</c:if>
						<!-- 댓글 샘플 부분 -->
						<!-- 	<div class="media mb-3">
							<div class="mr-2">
								<img class="rounded-circle border p-1"
									src="data:image/svg+xml;charset=UTF-8,%3Csvg%20width%3D%2264%22%20height%3D%2264%22%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20viewBox%3D%220%200%2064%2064%22%20preserveAspectRatio%3D%22none%22%3E%3Cdefs%3E%3Cstyle%20type%3D%22text%2Fcss%22%3E%23holder_160c142c97c%20text%20%7B%20fill%3Argba(255%2C255%2C255%2C.75)%3Bfont-weight%3Anormal%3Bfont-family%3AHelvetica%2C%20monospace%3Bfont-size%3A10pt%20%7D%20%3C%2Fstyle%3E%3C%2Fdefs%3E%3Cg%20id%3D%22holder_160c142c97c%22%3E%3Crect%20width%3D%2264%22%20height%3D%2264%22%20fill%3D%22%23777%22%3E%3C%2Frect%3E%3Cg%3E%3Ctext%20x%3D%2213.5546875%22%20y%3D%2236.5%22%3E64x64%3C%2Ftext%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fsvg%3E"
									alt="Generic placeholder image">
							</div>
							<div class="media-body">
								<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
									Omnis et enim aperiam inventore, similique necessitatibus neque
									non! Doloribus, modi sapiente laboriosam aperiam fugiat
									laborum. Sequi mollitia, necessitatibus quae sint natus.</p>
								<small class="text-muted">Posted by Anonymous on 3/1/18</small>
							</div>
						</div>
						<hr> -->
						<a href="#" class="btn hvr-hover">Leave a Review</a>
						<!-- 여기까지 -->
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- End Cart -->
	<script type="text/javascript" src="resources/js/order.js"></script>
</body>
