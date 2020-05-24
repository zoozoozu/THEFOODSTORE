$(function(){
	$("#amount").change(function(){
		var amount = $("#amount").val();
		var price = $("#productPrice").val();
		var total = amount * price;
		$("#total > .totalPrice").text("합계 : ￦"  + comma(total));
		// $("#total").text("<h2>" + "<fmt:formatNumber pattern='###,###,###'
		// value=" + total + "/>")
	})
	
	$("#addCart").click(function(){
		$.ajax({
			url:"cartAdd.ajax",
			type:"post",
			data : {userId : $("#userId").val(), productNo : $("#productNo").val(), amount : $("#amount").val()},
			dataType:"json",
			success: function(data){
				alert("장바구니에 추가되었습니다.");
			},
			error: function(xhr, status, error){
				alert("error : " + xhr.statusText + ", " + status + ", " + error);
			}
		});
		return false;
	});
	
	$("#remove").click(function(){
		$.ajax({
			url:"deleteCart.ajax",
			type:"post",
			data : {userId : $("#userId").val(), cartId : $("#cartId").val()},
			dataType:"json",
			success:function(resultData, status, xhr){
				$("#cartTable").empty();
				$.each(resultData, function(index, value){
					var result = "<tbody><tr>" 
						+ "<td class='thumbnail-img'>"
						+ "<a href='#'>"
						+ "<img class='img-fluid' src='" + value.productFilePath +  "alt='' />"
						+ "</a></td>"
						+ "<td class='name-pr'><a href='#'>"
						+ value.productName + "</a></td>"
						+ "<td class='price-pr'><p>"
						+ value.productPrice + "</p></td>"
						+ "<td class='quantity-box'><input type='number' id='amount' size='4' value='"
						+ value.amount 
						+ "min='0' step='1' class='c-input-text qty text'></td>"
						+ "<td class='total-pr' id='totalPrice'>"
						+ "합계 : ￦ <fmt:formatNumber pattern='###,###,###' value='" 
						+ "value.price'/></td>"
						+ "<td class='remove-pr'><a href='#'><i class='fas fa-times' id='remove'></i>"
						+ "</a></td></tr></tbody>";
					$("#cartTable").append(result);
				});
			},
			error: function(xhr, status, error){
				alert("error : " + xhr.statusText + ", " + status + ", " + error);
			}
		});
		return false;
	});
	
	function comma(str) {
        str = String(str);
        return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
    }
	
	
})

