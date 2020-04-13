$(function() {
	$("#thank").click(
			function() {
				$.ajax({
					url : "thank.ajax",
					type : "post",
					data : {	thank : "thank",	no : $("#no").val()	},	
					dataType : "json",
					success : function(data, status, xhr) {
						alert("좋아요가 반영되었습니다.");
						$("#recommend > .recommend").text(" (" + data.thank + ") ");
					},
					error : function(xhr, status, error) {
						alert("error : " + xhr.statusText + ", " + status
								+ ", " + error);
					}
				});
		}).hover(function() {
			$(this).css({
					cursor : "pointer"
			});
		});

	// 댓글 쓰기 호버시 이벤트 처리
	$("#replyWrite").hover(function() {
		$(this).css({cursor : "pointer"});
	});

	
	
	// 댓글 쓰기 클릭시 이벤트 처리
	$(document).on("click", "#replyWrite",	function() {
		
		//console.log("#replyWrite clicked");	
		
		if($("#replyForm").css("display")=="block"){
			var $next = $(this).parent().next();
			if(! $($next).is("#replyForm")){
				$("#replyForm").slideUp(300);
			}	setTimeout(function(){
				$("#replyForm").insertBefore("#replyTitle").slideDown(300);
			}, 300);
		}else{
			$("#replyForm").insertBefore("#replyTitle").slideDown(300);
		}
		$("#replyForm").find("form")
			.attr("id", "replyWriteForm").removeAttr("data-no");
		$("#replyContent").val("");
	});

	// 댓글 쓰기 완료시
	$(document).on("submit",	"#replyWriteForm",	function() {
			if ($("#replyContent").val().length <= 5) {
				alert("댓글은 5자 이상 입력해야 합니다.");
				return false;
			}
			var params = $(this).serialize();
				$.ajax({
							url : "replyWrite.ajax",
							type : "post",
							data : params,
							dataType : "json",
							success : function(resultData, status, xhr) {
				$("#replyTable").empty();
					$.each(resultData, function(index, value) {
					// 날짜 데이터를 출력 포맷에 맞게/ 수정
					var date = new Date(value.regDate);
					var strDate = date.getFullYear()+ "-"
									+ ((date.getMonth() + 1 < 10) ? "0"
									+ (date.getMonth() + 1) : (date.getMonth() + 1))
									+ "-"+ date.getDate()
									+ "-"+ ((date.getHours() < 10) ? "0"
									+ date.getHours(): date.getHours())
									+ ":"+ (date.getMinutes() < 10 ? "0"
									+ date.getMinutes(): date.getMinutes())
									+ ":"+ (date.getSeconds() < 10 ? "0"
									+ date.getSeconds(): date.getSeconds());
										var result = "<tr class='reply_"+ value.no+ "'>"
												+ "<td>"
												+ " <div class='replyUser'>"
												+ " <span class='member'>"
												+ value.replyWriter
												+ "</span>"
												+ " </div>"
												+ " <div class='replyModify'>"
												+ " <span class='replyDate'>"
												+ strDate
												+ "</span>"
												+ " <a href='#' class='modifyReply' data-no='"
												+ value.no + "'>"
												+ " <img src='resources/images/reply_btn_modify.gif' alt='댓글 수정하기'/>"
												+ " </a>"
												+ " <a href='#' class='deleteReply' data-no='"
												+ value.no	+ "'>"
												+ " <img src='resources/images/reply_btn_delete.gif' alt='댓글 삭제하기'/>"
												+ " </a>"
												+ " <a href='javascript:reportReply('div_"+ value.no + "');'>"
												+ " <img src='resources/images/reply_btn_notify.gif' alt='신고하기'/>"
												+ " </a>"
												+ " </div>"
												+ " <div class='replyContent' id='div_"
												+ value.no + "'>"
												+ " <pre><span>"
												+ value.replyContent
												+ "</span></pre>"
												+ " </div>"
												+ "</td>"
												+ "</tr>";
							// 댓글을 추가한다
							$("#replyTable").append(result);
							});// 댓글 쓰기가 완료되면 댓글 쓰기 폼을 숨긴다.
								$("#replyForm").slideUp(300).add(	"#replyContent").val("");
								console.log("write : "+ $("#replyForm").length);
									},
									error : function(xhr, status, error) {
										alert("ajax 실패 : " + status + " - "
												+ xhr.status);
									}
								});
						// 폼이 submit 되는 것을 취소한다.
						return false;
					});

	$(document).on(
			"click",
			".modifyReply",
			function() {
				// 현재 수정하기가 클릭된 부모 요소의 다음 형제 요소를 구한다.
				var $next = $(this).parent().next();
				if ($($next.children()[1]).attr("id") == undefined) {
					//
					console.log(".modifyReply click : visible - "
							+ $("#replyForm").is(":visible") + ", hidden - "
							+ $("#replyForm").is(":hidden") + ", length - "
							+ $("#replyForm").length);
					//
					var reply = $next.first().text();
					if ($("#replyForm").css("display") == 'block') {
						$("#replyForm").slideUp(300);
					}
					setTimeout(function() {
						$("#replyContent").val($.trim(reply));
						$("#replyForm").appendTo($next).slideDown(300);
					}, 300);
					// 댓글 쓰기폼을 동적으로 수정폼으로 id 변환
					$("#replyForm").find("form").attr({
						"id" : "replyUpdateForm",
						"data-no" : $(this).attr("data-no")
					});
				}
				// 앵커 태그의 기본 기능인 링크로 연결되는 것을 취소한다.
				return false;
			});

	// 수정완료
	$(document).on("submit",	"#replyUpdateForm",
		function() {
			if ($("#replyContent").val().length <= 5) {
				alert("댓글은 5자 이상 입력해야 합니다.");
				// Ajax 요청을 취소한다.
				return false;
				}
				// 댓글 번호 전송
				var params = $(this).serialize() + "&no="
						+ $(this).attr("data-no");
				var updateForm;
				$.ajax({
						url : "replyUpdate.ajax",
						type : "post",
						data : params,
						dataType : "json",
						success : function(resultData, status, xhr) {
						$updateForm = $("#replyForm");
						console.log("update - before empty() : "
								+ $updateForm.length);
						// 기존에 화면에 출력되었던 댓글을 비운다.
						$("#replyTable").empty();
						$.each(resultData, function(index, value) {
						// 날짜 데이터를 출력 포맷에 맞게수정
						var date = new Date(	value.regDate);
						var strDate = date.getFullYear() + "-"
							+ ((date	.getMonth() + 1 < 10) ? "0"
							+ (date.getMonth() + 1): (date.getMonth() + 1))
							+ "-"+ date.getDate()+ "-"+ ((date.getHours() < 10) ? "0"
							+ date.getHours(): date.getHours())+ ":"+ (date.getMinutes() < 10 ? "0"
							+ date.getMinutes(): date.getMinutes())+ ":"
							+ (date.getSeconds() < 10 ? "0"+ date.getSeconds()
								: date.getSeconds());
						var result = "<tr class='reply_"+ value.no+ "'>"
										+ "<td>"
										+ " <div class='replyUser'>"
										+ " <span class='member'>"
										+ value.replyWriter
										+ "</span>"
										+ " </div>"
										+ " <div class='replyModify'>"
										+ " <span class='replyDate'>"
										+ strDate
										+ "</span>"
										+ " <a href='#' class='modifyReply' data-no='"
										+ value.no + "'>"
										+ " <img src='resources/images/reply_btn_modify.gif' alt='댓글 수정하기'/>"
										+ " </a>"
										+ " <a href='#' class='deleteReply' data-no='"
										+ value.no + "'>"
										+ " <img src='resources/images/reply_btn_delete.gif' alt='댓글 삭제하기'/>"
										+ " </a>"
										+ " <a href='javascript:reportReply('div_"+ value.no+ "');'>"
										+ " <img src='resources/images/reply_btn_notify.gif' alt='신고하기'/>"
										+ " </a>"
										+ " </div>"
										+ " <div class='replyContent' id='div_"+ value.no+ "'>"
										+ " <pre><span>"
										+ value.replyContent
										+ "</span></pre>"
										+ " </div>"
										+ "</td>"
										+ "</tr>";
						// 댓글 테이블의 기존 내용을 삭제하고 다시 추가한다.
						$("#replyTable").append(result);});
										console.log("update after empty() : #replyForm - "
										+ $("#replyForm").length
										+ ", $updateFrom : "
										+ $updateForm.length);
						$updateForm.find("form").attr("id",
										"replyWriteForm").removeAttr(
										"data-no").end().css("display",
										"none").appendTo("article")
										.find("#replyContent").val("");
					},
					error : function(xhr, status, error) {
						alert("ajax 실패 : " + status + " - "+ xhr.status);
					}
			});
					// 폼이 submit 되는 것을 취소한다.
					return false;
		});
	$(document).on("click", ".deleteReply", function() {
		var no = $(this).attr("data-no");
		var writer = $(this).parent().prev().find(".member").text();
		var bbsNo = $("#replyForm input[name=bbsNo]").val();
		var result = confirm(writer + "님이 작성한 " + no +"번 댓글을 삭제하시겠습니까?");
		var params = "no=" + no + "&bbsNo=" + bbsNo;
		if(result) {
			$.ajax({
					url: "replyDelete.ajax",
					type: "post",
					data: params,
					dataType: "json",
					success: function(resultData, status, xhr) {
						
						$("#replyForm").find("form")
						.attr("id", "replyWriteForm").removeAttr("data-no")
						.end().css("display", "none").appendTo("article")
						.find("#replyContent").val("");
						// 기존에 화면에 출력되었던 댓글을 비운다.
						$("#replyTable").empty();
			
						$.each(resultData, function(index, value) {
							// 날짜 데이터를 출력 포맷에 맞게 수정
							var date = new Date(value.regDate);
							var strDate = date.getFullYear() + "-" + ((date.getMonth() + 1 < 10)
									? "0" + (date.getMonth() + 1) : (date.getMonth() + 1)) + "-"
									+ date.getDate() + "-" + ((date.getHours() < 10)
											? "0" + date.getHours() : date.getHours()) + ":"
											+ (date.getMinutes() < 10 ? "0" + date.getMinutes()
													: date.getMinutes()) + ":" + (date.getSeconds() < 10
															? "0" + date.getSeconds() : date.getSeconds());
							var result =
								"<tr class='reply_" + value.no + "'>"
								+ "<td>"
								+ " <div class='replyUser'>"
								+ " <span  class='member'>"  +  value.replyWriter  +
								"</span>"
								+ " </div>"
								+ " <div class='replyModify'>"
								+ " <span class='replyDate'>" + strDate + "</span>"
								+ " <a href='#' class='modifyReply' data-no='" + value.no
								+ "'>"
								+ " <img  src='resources/images/reply_btn_modify.gif' alt='댓글 수정하기'/>"
								+ " </a>"
								+ " <a href='#' class='deleteReply' data-no='" + value.no +"'>"
								+ " <img  src='resources/images/reply_btn_delete.gif' alt='댓글 삭제하기'/>"
								+ " </a>"
								+ " <a  href='javascript:reportReply('div_"  +  value.no  
								+"');'>"
								+ " <img  src='resources/images/reply_btn_notify.gif' alt='신고하기'/>"
								+ " </a>"
								+ " </div>"
								+ " <div class='replyContent' id='div_" + value.no + "'>"
								+ " <pre><span>" + value.replyContent + "</span></pre>"
								+ " </div>"
								+ "</td>"
								+ "</tr>";
							// 댓글 테이블의 기존 내용을 삭제하고 다시 추가한다.
							$("#replyTable").append(result);
						});
					},
					error: function(xhr, status, error) {
						alert("ajax 실패 : " + status + " - " + xhr.status);
					}
			});
		}
		// 앵커 태그에 의해 페이지가 이동되는 것을 취소한다.
		return false;
	});

});