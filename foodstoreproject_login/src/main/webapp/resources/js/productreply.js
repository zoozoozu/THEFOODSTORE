$(document).ready(function() {
	$(document).on("submit", "#replyWriteForm", function(){
		
		if($("#replyContent").val().length <= 5){
			alert("댓글은 5자 이상 입력해야 합니다.");
			return false;
		}
		
		var params = $(this).serialize();
		
		$.ajax({
			url: "replyWrite.ajax",
			type: "post",
			data: params,
			dataType: "json",
			success: function(resultData, status, xhr){
				var replyTable = null;
				
				if($("#reply").length == 0){
					replyTable = $("#reply")
					$("#reply").empty();
					$("#reply").append(replyTable);
				} else{
					$("#reply").empty();
					replyTable = $("#reply");
				}
				
				$.each(resultData, function(index, value){
					var result = "<ul class='w3-ul w3-card'>"
								+ "<li class='w3-bar'"
								+ "<img src='images/img_avatar1.png' class='w3-abr-item w3-hide-small' style='width:85px"
								+ "<div class='w3-bar-item'>"
								+ "<span class='w3-large'>" + value.writer + "</span>"
								+ "<br>"
								+ "<span>" + value.reply + "</span>"
								+ "</div>"
								+ "</li>";
								+ "</ul>";
					replyTable.append(result);
	 					
				})
				
		
		$("#replyForm").slideUp(300).add(".w3-ul w3-card").val("");
		console.log("write : " + $("#replyForm").length);
		},
			error: function(xhr, status, error){
			alert("ajax 실패 : " + status + " - " + xhr.status);
			}
		});
		return false;
	});
});
