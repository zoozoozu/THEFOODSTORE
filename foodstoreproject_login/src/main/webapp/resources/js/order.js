function goOrder(userId, productNo, amount){
	var form = document.productForm;	// 폼 name
	form.userId.value = userId;
	form.productNo.value = productNo;
	form.amount.value = amount;
	form.action = goOrder;
	form.method = "post";
	form.submit();
}

$(document).ready(function(){
	$("select#option").change(function(){
		if($("#option").val() == "6"){
			$("#displaydiv").slideDown();	
	}
})
})
