<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<body>
	<!-- Start All Title Box -->
	<div class="all-title-box">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<h2>Cart</h2>
					<ul class="breadcrumb">
						<li class="breadcrumb-item"><a href="main">Shop</a></li>
						<li class="breadcrumb-item active">Cart</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<!-- End All Title Box -->
	<!-- hidden -->
	<!--  -->
	<!-- Start Cart  -->
	<div class="cart-box-main">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="table-main table-responsive">
						<input type="hidden" id="userId"
							value="${sessionScope.member.id }" />
						<table class="table" id="cartTable">
							<!-- <thead>
                                <tr>
                                    <th>Images</th>
                                    <th>Product Name</th>
                                    <th>Price</th>
                                    <th>Quantity</th>
                                    <th>Total</th>
                                    <th>Remove</th>
                                </tr>
                            </thead> -->
							<tbody>
								<c:forEach var="c" items="${cartList }" varStatus="status">
								 <input type="hidden" id="cartNumber" value="${c.cartId }" />
									<tr id="cartId_${c.cartId }">
										<td id="cartId">${c.cartId }</td>
										<td class="thumbnail-img"><a href="#"> <img
												class="img-fluid" src="${c.productFilePath }" alt="" />
										</a></td>
										<td class="name-pr"><a href="productDetail?code=${c.productCode}&no=${c.productId}">${c.productName } </a></td>
										<td class="price-pr"><input type="hidden"
											name="productPrice" id="productPrice_${c.cartId }"
											value="${c.productPrice }" />
											<p>${c.productPrice }</p></td>
										<td class="quantity-box"><input type="number" class="dynamic_amount"
											name="amount" id="amount_${c.cartId }" size="4" value="${c.amount }"
											min="0" step="1" class="c-input-text qty text">
											<input type="hidden" id="cartId_input" value="${c.cartId }" /></td>
										<td class="total-pr_${c.cartId }">합계 : ￦ <fmt:formatNumber
												pattern="###,###,###" value="${c.totalPrice }" />
										</td>
										<td class="remove-pr"><a href="#" class=remove
											data-no="${c.cartId }"><i class="fas fa-times"
												id="remove"></i>
										</a></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>

			<div class="row my-5">
				<div class="col-lg-8 col-sm-12"></div>
				<div class="col-lg-4 col-sm-12">
					<div class="order-box">
						<h3>결제정보</h3>
						<!-- <div class="d-flex">
							<h4>결제예상금액</h4>
							<div class="ml-auto font-weight-bold">$ 130</div>
						</div> -->
						<!-- <div class="d-flex">
							<h4>Discount</h4>
							<div class="ml-auto font-weight-bold">$ 40</div>
						</div>
						<hr class="my-1">
						<div class="d-flex">
							<h4>Coupon Discount</h4>
							<div class="ml-auto font-weight-bold">$ 10</div>
						</div>
						<div class="d-flex">
							<h4>Tax</h4>
							<div class="ml-auto font-weight-bold">$ 2</div>
						</div>
						<div class="d-flex">
							<h4>Shipping Cost</h4>
							<div class="ml-auto font-weight-bold">Free</div>
						</div> -->
						<hr>
						<div class="d-flex gr-total">
							<h5>결제예상금액</h5>
							<div class="ml-auto h5">
								<c:out value="${cartTotalPrice}" />
							</div>
						</div>
						<hr>
					</div>
				</div>
				<div class="col-12 d-flex shopping-box">
					<a href="test" class="ml-auto btn hvr-hover">구매하기</a>
				</div>
			</div>

		</div>
	</div>
	<!-- End Cart -->
</body>