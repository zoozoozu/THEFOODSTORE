$(function(){
	$("#amount").change(function(){
		var amount = $("#amount").val();
		var price = $("#productPrice").val();
		var total = amount * price;
		$("#total > .totalPrice").text("합계 : ￦"  + comma(total));
		//$("#total").text("<h2>" + "<fmt:formatNumber pattern='###,###,###' value=" + total + "/>")
	})
	
	 function comma(str) {
        str = String(str);
        return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
    }
})