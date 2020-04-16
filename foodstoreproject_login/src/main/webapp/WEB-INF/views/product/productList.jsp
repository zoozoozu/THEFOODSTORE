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
					<h2>Shop</h2>
					<ul class="breadcrumb">
						<li class="breadcrumb-item"><a href="#">Home</a></li>
						<li class="breadcrumb-item active">Shop</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<!-- End All Title Box -->
	<div class="shop-box-inner">
		<div class="container">
			<div class="row">
				<div
					class="col-xl-9 col-lg-9 col-sm-12 col-xs-12 shop-content-right">
					<div class="right-product-box">
						<div class="product-item-filter row">
							<div class="col-12 col-sm-8 text-center text-sm-left">
								<div class="toolbar-sorter-right">
									<span>Sort by </span> <select id="basic"
										class="selectpicker show-tick form-control"
										data-placeholder="$ USD">
										<option data-display="Select">Nothing</option>
										<option value="1">Popularity</option>
										<option value="2">High Price → High Price</option>
										<option value="3">Low Price → High Price</option>
										<option value="4">Best Selling</option>
									</select>
								</div>
								<p>Showing all 4 results</p>
							</div>
							<div class="col-12 col-sm-4 text-center text-sm-right">
								<ul class="nav nav-tabs ml-auto">
									<li><a class="nav-link active" href="#grid-view"
										data-toggle="tab"> <i class="fa fa-th"></i>
									</a></li>
									<li><a class="nav-link" href="#list-view"
										data-toggle="tab"> <i class="fa fa-list-ul"></i>
									</a></li>
								</ul>
							</div>
						</div>
						<!-- 창모드 카테고리 -->
						<div class="product-categorie-box">
							<div class="tab-content">
								<div role="tabpanel" class="tab-pane fade show active"
									id="grid-view">
									<div class="row">
										<!-- 여기부터 -->
										<c:forEach var="p" items="${productList}" varStatus="status">
											<div class="col-sm-6 col-md-6 col-lg-4 col-xl-4">
												<div class="products-single fix">
													<div class="box-img-hover">
														<!-- <div class="type-lb">
														<p class="sale">Sale</p>
													</div> -->
														<img src="${p.filePath}" class="img-fluid" alt="상품사진">
														<div class="mask-icon">
															<ul>
																<li><a
																	href="productDetail?code=${p.code}&no=${p.no}"
																	data-toggle="tooltip" data-placement="right"
																	title="View"><i class="fas fa-eye"></i></a></li>
																<li><a href="#" data-toggle="tooltip"
																	data-placement="right" title="Add to Wishlist"><i
																		class="far fa-heart"></i></a></li>
															</ul>
															<a class="cart" href="#">Add to Cart</a>
														</div>
													</div>
													<div class="why-text">
														<h4>${p.name }</h4>
														<h5>₩ ${p.price}</h5>
													</div>
												</div>
											</div>
										</c:forEach>
										<!-- 여기까지가 반복됨 -->
									</div>
								</div>

								<!-- List부분 -->
								<div role="tabpanel" class="tab-pane fade" id="list-view">
									<!-- 여기부터 -->
									<c:forEach var="p" items="${productList}" varStatus="status">
										<div class="list-view-box">
											<div class="row">
												<div class="col-sm-6 col-md-6 col-lg-4 col-xl-4">
													<div class="products-single fix">
														<div class="box-img-hover">
															<img src="${p.filePath}" class="img-fluid" alt="상품사진">
															<div class="mask-icon">
																<ul>
																	<li><a
																		href="productDetail?code=${p.code}&no=${p.no}"
																		data-toggle="tooltip" data-placement="right"
																		title="View"><i class="fas fa-eye"></i></a></li>
																	<li><a href="#" data-toggle="tooltip"
																		data-placement="right" title="Add to Wishlist"><i
																			class="far fa-heart"></i></a></li>
																</ul>
															</div>
														</div>
													</div>
												</div>
												<div class="col-sm-6 col-md-6 col-lg-8 col-xl-8">
													<div class="why-text full-width">
														<h4>${p.name }</h4>
														<h5>>₩ ${p.price}</h5>
														<p>${p.intro }</p>
														<a class="btn hvr-hover" href="#">Add to Cart</a>
													</div>
												</div>
											</div>
										</div>
									</c:forEach>
									<!-- 여기까지가 반복됨 -->
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>