$(function(){
	$("#amount").change(function(){
		var amount = $("amount").val();
		var price = $("productPrice").val();
		var total = amount * price;
		$("#total").text(total)
	})
})