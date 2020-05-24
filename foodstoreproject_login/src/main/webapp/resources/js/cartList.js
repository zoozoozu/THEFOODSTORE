$(document).ready(function(){
	$(".side-menu").click(function(){
		var values = [];
		$.ajax({
			url:"cartList.ajax",
			type:"post",
			// 데이터 설정을 따로 안해주고 바로 함수로 넘어가 본다.
			function(cartMap){
				values = cartMap.cartList;
				
				$.each(values, function(index, value){
					console.log(index + " : " + value.productName);
				});
				alert("성공");
			}
		})
	})
})