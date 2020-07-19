$(function() {
	$("#amount").change(function() {
		var amount = $("#amount").val();
		var price = $("#productPrice").val();
		var total = amount * price;
		$("#total > .totalPrice").text("합계 : ￦" + comma(total));
		$(".total-pr").text("합계 : ￦" + comma(total));
		// $("#total").text("<h2>" + "<fmt:formatNumber pattern='###,###,###'
		// value=" + total + "/>")
	})

$(document).ready(function() {
		var $num = $(".dynamic_amount");
		
		/*  $num.change(function(){ for(var i = 0; i < $num.length; i++){
		  console.log(i + 'index input-'+$num.eq(i).val()); 
		  } )
		  */
		$num.change(function() {
			for(var i = 0; i < $num.length; i++){
			var cartId = i + 1;
			var amount = $num.eq(i).val();
			var price = $("#productPrice_" + cartId).val();
			var total = amount * price;
			// $("#total > .totalPrice").text("합계 : ￦" + comma(total));
			$(".total-pr_" + cartId).text("합계 : ￦" + comma(total));
			}
			// $("#total").text("<h2>" + "<fmt:formatNumber
			// pattern='###,###,###'
			// value=" + total + "/>")
		})
	})

	
	 // 장바구니 수정부분 나중에 수정하기 
	/*$(".dynamic_amount").on("propertychange change keyup paste input",function() {
		var cartNumber = $("#cartNumber").val();
	 var cartId = $("#cartId").text();
	 var amount = $("#amount_"+cartId).val(); 
	 var price = $("#productPrice_"+cartId).val();
	 var total = amount * price; 
	 // $("#total > .totalPrice").text("합계 : ￦" + comma(total)); 
	 $(".total-pr_"+cartId).text("합계 : ￦" + comma(total)); 
	 $("#total").text("<h2>" + "<fmt:formatNumber pattern='###,###,###'value=" + total + "/>") 
	 });*/
	 
	function getId(id) {
		$("#" + id).val();
	}

	/*
	 * $("#cartAmount").change(function(){ $.ajax({ url:"cartUpdate.ajax",
	 * type:"post", data : { amount : $("#cartAmount").val(), productNo :
	 * $("productNo").val() }, dataType : "json", success : function(data,
	 * status, xhr){ }, error : function(xhr, status, error){ alert("error : " +
	 * xhr.statusText + ", " + status +", " + error); } }) })
	 */

	$("#addCart").click(
			function() {
				$.ajax({
					url : "cartAdd.ajax",
					type : "post",
					data : {
						userId : $("#userId").val(),
						productNo : $("#productNo").val(),
						amount : $("#amount").val()
					},
					dataType : "json",
					success : function(data, status, xhr) {
						if (data.redirect) {
							window.location.href = data.redirect;
						} else {
							alert("장바구니에 추가되었습니다.");
						}
					},
					error : function(xhr, status, error) {
						alert("error : " + xhr.statusText + ", " + status
								+ ", " + error);
					}
				});
			});

	$(document)
			.on(
					"click",
					".remove",
					function() {
						var userId = $("#userId").val();
						var cartId = $(this).attr("data-no");
						var params = "userId=" + userId + "&cartId=" + cartId;
						$
								.ajax({
									url : "deleteCart.ajax",
									type : "post",
									data : params,
									dataType : "json",
									success : function(resultData, status, xhr) {
										$("#cartTable").empty();
										$
												.each(
														resultData,
														function(index, value) {
															console
																	.log(value.productFilePath);
															var result = "<tbody><tr>"
																	+ "<td class='thumbnail-img'>"
																	+ "<a href='#'>"
																	+ "<img class='img-fluid' src='"
																	+ value.productFilePath
																	+ "alt='' />"
																	+ "</a></td>"
																	+ "<td class='name-pr'><a href='#'>"
																	+ value.productName
																	+ "</a></td>"
																	+ "<td class='price-pr'><p>"
																	+ value.productPrice
																	+ "</p></td>"
																	+ "<td class='quantity-box'><input type='number' id='amount' size='4' value='"
																	+ value.amount
																	+ "min='0' step='1' class='c-input-text qty text'></td>"
																	+ "<td class='total-pr' id='totalPrice'>"
																	+ "합계 : ￦ <fmt:formatNumber pattern='###,###,###' value='"
																	+ "value.price'/></td>"
																	+ "<td class='remove-pr'><a href='#'><i class='fas fa-times' id='remove'></i>"
																	+ "</a></td></tr></tbody>";
															$("#cartTable")
																	.append(
																			result);
														});
										location.reload();
									},
									error : function(xhr, status, error) {
										alert("error : " + xhr.statusText
												+ ", " + status + ", " + error);
									}
								});
					})

	function comma(str) {
		str = String(str);
		return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
	}
})

function cartAdd(productNo, userId, amount) {
	$.ajax({
		url : "cartAdd.ajax",
		type : 'post',
		data : {
			userId : userId,
			productNo : productNo,
			amount : amount
		},
		dataType : "json",
		success : function(data) {
			alert("장바구니에 추가되었습니다.");

		},
		error : function(xhr, status, error) {
			alert("error : " + xhr.statusText + ", " + status + ", " + error);
		}
	});
	/*
	 * console.log(id); console.log(user); console.log(amount);
	 */
};
