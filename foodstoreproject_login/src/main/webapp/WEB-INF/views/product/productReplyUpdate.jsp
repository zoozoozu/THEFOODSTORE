<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<article>
	<div class="container" id="replyForm" style=" margin: 50px auto">
		<form name="replyWriteForm" id="replyWriteForm">				
			<input type="hidden" name="productNo" value="${ product.no }"/>
			<input type="hidden" name="replyWriter" value="${ sessionScope.member.id }" />	 --%>		
			<input type="hidden" name="gcode" value="${product.code }"/>
			<textarea name="replyContent" id="replyContent">${productReply.content}</textarea>
			<button class="w3-button w3-theme-d3 w3-round-small w3-right">등록</button>
		</form>	
</div>
</article>