<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script type="text/javascript" src="resources/js/order.js"></script>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<body>
	<!-- Start Cart  -->
	<div class="cart-box-main">
		<div class="container">
			<!-- 로그인 부분 -->
			<!--             <div class="row new-account-login">
                <div class="col-sm-6 col-lg-6 mb-3">
                    <div class="title-left">
                        <h3>Account Login</h3>
                    </div>
                    <h5><a data-toggle="collapse" href="#formLogin" role="button" aria-expanded="false">Click here to Login</a></h5>
                    <form class="mt-3 collapse review-form-box" id="formLogin">
                        <div class="form-row">
                            <div class="form-group col-md-6">
                                <label for="InputEmail" class="mb-0">Email Address</label>
                                <input type="email" class="form-control" id="InputEmail" placeholder="Enter Email"> </div>
                            <div class="form-group col-md-6">
                                <label for="InputPassword" class="mb-0">Password</label>
                                <input type="password" class="form-control" id="InputPassword" placeholder="Password"> </div>
                        </div>
                        <button type="submit" class="btn hvr-hover">Login</button>
                    </form>
                </div>
                <div class="col-sm-6 col-lg-6 mb-3">
                    <div class="title-left">
                        <h3>Create New Account</h3>
                    </div>
                    <h5><a data-toggle="collapse" href="#formRegister" role="button" aria-expanded="false">Click here to Register</a></h5>
                    <form class="mt-3 collapse review-form-box" id="formRegister">
                        <div class="form-row">
                            <div class="form-group col-md-6">
                                <label for="InputName" class="mb-0">First Name</label>
                                <input type="text" class="form-control" id="InputName" placeholder="First Name"> </div>
                            <div class="form-group col-md-6">
                                <label for="InputLastname" class="mb-0">Last Name</label>
                                <input type="text" class="form-control" id="InputLastname" placeholder="Last Name"> </div>
                            <div class="form-group col-md-6">
                                <label for="InputEmail1" class="mb-0">Email Address</label>
                                <input type="email" class="form-control" id="InputEmail1" placeholder="Enter Email"> </div>
                            <div class="form-group col-md-6">
                                <label for="InputPassword1" class="mb-0">Password</label>
                                <input type="password" class="form-control" id="InputPassword1" placeholder="Password"> </div>
                        </div>
                        <button type="submit" class="btn hvr-hover">Register</button>
                    </form>
                </div>
            </div> -->
			<!-- 로그인 부분 끝 -->
			<div class="row">
				<div class="col-md-10 col-lg-10 mb-3">
					<div class="checkout-address">
						<div class="title-left">
							<h3>Billing address</h3>
						</div>
						<form class="needs-validation" novalidate>
							<div class="mb-3">
								<label for="username">받는 분 *</label>
								<div class="input-group">
									<input type="text" class="form-control" id="username"
										placeholder="${sessionScope.member.name }" required>
									<div class="invalid-feedback" style="width: 100%;"></div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-8 mb-3">
									<label for="address">주소 *</label> <input type="text"
										class="form-control" id="address"
										placeholder="${sessionScope.member.address1 }" required>
									<div class="invalid-feedback">Please enter your shipping
										address.</div>
								</div>
								<div class="col-md-4 mb-3">
									<label for="zip">Zip *</label> <input type="text"
										class="form-control" id="zip"
										placeholder="${sessionScope.member.zipcode }" required>
									<div class="invalid-feedback">Zip code required.</div>

								</div>
							</div>
							<div class="mb-3">
								<label for="address2">상세주소 *</label> <input type="text"
									class="form-control" id="address2"
									placeholder="${sessionScope.member.address2 }">
							</div>
							<div class="mb-3">
								<label for="option">요청사항 *</label> <select class="wide w-100"
									id="option">
									<option data-display="Select">요청사항선택</option>
									<option>부재시 경비실에 맡겨주세요.</option>
									<option>부재시 문앞에 놓아주세요.</option>
									<option>파손의 위험이 있는 상품이오니, 배송 시 주의해주세요.</option>
									<option>배송전에 연락주세요.</option>
									<option>택배함에 넣어주세요.</option>
									<option>직접입력(배송기사분께 전달할 메시지)</option>
								</select>
								<div style="display: none;" id="displaydiv">
									<span>쨔잔</span>
								</div>

							</div>

							<!-- 다음번 주문시에도 주소 저장 -->
							<hr class="mb-4">

							<div class="custom-control custom-checkbox">
								<input type="checkbox" class="custom-control-input"
									id="same-address"> <label class="custom-control-label"
									for="same-address">Shipping address is the same as my
									billing address</label>
							</div>
							<div class="custom-control custom-checkbox">
								<input type="checkbox" class="custom-control-input"
									id="save-info"> <label class="custom-control-label"
									for="save-info">Save this information for next time</label>
							</div>

							<hr class="mb-4">

							<div class="title-left">
								<h3>Payment</h3>
							</div>
							<div class="d-block my-3">
								<div class="custom-control custom-radio">
									<input id="credit" name="paymentMethod" type="radio"
										class="custom-control-input" checked required> <label
										class="custom-control-label" for="credit">Credit card</label>
								</div>
							</div>
						</form>
					</div>
				</div>

				<hr class="mb-4">


				<!-- 배송비 포함시 참고 할 것! -->
				<!-- <div class="col-md-12 col-lg-12">
						<div class="shipping-method-box">
							<div class="title-left">
								<h3>Shipping Method</h3>
							</div>
							<div class="mb-4">
								<div class="custom-control custom-radio">
									<input id="shippingOption1" name="shipping-option"
										class="custom-control-input" checked="checked" type="radio">
									<label class="custom-control-label" for="shippingOption1">Standard
										Delivery</label> <span class="float-right font-weight-bold">FREE</span>
								</div>
								<div class="ml-4 mb-2 small">(3-7 business days)</div>
								<div class="custom-control custom-radio">
									<input id="shippingOption2" name="shipping-option"
										class="custom-control-input" type="radio"> <label
										class="custom-control-label" for="shippingOption2">Express
										Delivery</label> <span class="float-right font-weight-bold">$10.00</span>
								</div>
								<div class="ml-4 mb-2 small">(2-4 business days)</div>
								<div class="custom-control custom-radio">
									<input id="shippingOption3" name="shipping-option"
										class="custom-control-input" type="radio"> <label
										class="custom-control-label" for="shippingOption3">Next
										Business day</label> <span class="float-right font-weight-bold">$20.00</span>
								</div>
							</div>
						</div>
					</div> -->
				<div class="col-md-10 col-lg-10">
					<div class="odr-box">
						<div class="title-left">
							<h3>Shopping cart</h3>
						</div>
						<c:forEach var="c" items="${cartList }" varStatus="status">
							<div class="rounded p-2 bg-light">
								<div class="media mb-2 border-bottom">
									<div class="media-body">
										<div class="row">
											<div class="col-md-2 mb-3">
												<a href="#"><img class="d-block"
													src="${c.productFilePath }" width=80, height=80></a>
											</div>
											<div class="col-md-4 mb-3">
												<div class="ml-auto font-weight-bold">${c.productName }</div>
											</div>
											<div class="col-md-4 mb-3">
												<div class="small text-muted">
													가격: ${c.productPrice }<span class="mx-2">|</span>수량:
													${c.amount } <span class="mx-2">|</span>합계 : ${c.totalPrice }
													<c:set var="cartTotlPrice"
														value="${cartTotlPrice + c.totalPrice }" />
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
				<hr class="mb-4">
				<div class="col-md-10 col-lg-10">
					<div class="title-left">
						<h3>Your order</h3>
					</div>
					<div class="d-flex gr-total">
						<h5>Grand Total</h5>
						<div class="ml-auto h5">
							<c:out value="${cartTotlPrice}" />
						</div>
					</div>
					<hr class="my-1">
					<!-- 배송비 포함시 참고 할 것! -->
					<!-- <div class="d-flex">
								<h4>Shipping Cost</h4>
								<div class="ml-auto font-weight-bold">Free</div>
							</div> -->
					<hr>
					<hr>
				</div>
			</div>


			<div class="col-10 d-flex shopping-box">
				<a href="test" class="ml-auto btn hvr-hover">Place Order</a>
			</div>
		</div>

	</div>
</body>