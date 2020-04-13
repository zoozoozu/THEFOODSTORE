$(function(){
	/*$("#goOrder").click(function goOrder(){
		document.productForm.method = "post";
		document.productForm.userId = $("#userId").val();
		document.productForm.productNo = $("#productNo").val();
		document.productForm.amount = $("#amount").val(); 
		location.href = "foodstoreproject_login/order/goOrder";
	});
	*/
	$("#goCart").click(function goCart(){
		location.href = "order/myCart"
	});
});
