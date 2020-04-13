<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<script src="resources/js/reply.js"></script>
<article>
	<form name="checkForm" id="checkForm">
		<input type="hidden" name="no" id="no" value="${ board.no }" /> <input
			type="hidden" name="pass" id="rPass" /> <input type="hidden"
			name="pageNum" value="${pageNum }" />
		<c:if test="${searchOption }">
			<input type="hidden" name="type" value="${type }" />
			<input type="hidden" name="keyword" value="${word }" />
		</c:if>
	</form>
	<table class="contentTable">
		<tr>
			<td colspan="4" class="boardTitle">
				<h2>게시판 상세보기</h2>
			</td>
		</tr>
		<tr>
			<td colspan="4">&nbsp;</td>
		</tr>
		<tr>
			<td class="contentTh">제&nbsp;&nbsp;&nbsp;&nbsp;목</td>
			<td class="contentTd" colspan="3">${ board.title }</td>
		</tr>
		<tr>
			<td class="contentTh">글쓴이</td>
			<td class="contentTd">${ board.writer }</td>
			<td class="contentTh">작성일</td>
			<td class="contentTd"><fmt:formatDate value="${ board.regDate }"
					pattern="yyyy-MM-dd HH:mm:ss" /></td>
		</tr>
		<tr>
			<td class="contentTh">비밀번호</td>
			<td class="contentTd"><input type="password" name="pass"
				id="pass"></td>
			<td class="contentTh">조회수</td>
			<td class="contentTd">${ board.readCount }</td>
		</tr>
		<tr>
			<td class="contentTh">파&nbsp;&nbsp;&nbsp;&nbsp;일</td>
			<td class="contentTd" colspan="3">
		 		<c:if	test="${ empty board.file1 }">	첨부파일 없음 </c:if>
				<c:if test="${not empty board.file1}">
					<a href="fileDownload?fileName=${ board.file1 }">다운로드</a>
					<c:forEach var="f" items="${ files }" varStatus="status">
						<a href="fileDownload?fileName=${ f.file2 }">다운로드</a>
					</c:forEach>
				</c:if>				
			</td>
		</tr>
		<tr>
			<td class="readContent" colspan="4"><pre>${ board.content }</pre>
			</td>
		</tr>
		<tr>
			<td colspan="4">&nbsp;</td>
		</tr>
		<tr>
			<td colspan="4" class="tdSpan"><input type="button"
				id="detailUpdate" value="수정하기" /> &nbsp;&nbsp;<input type="button"
				id="detailDelete" value="삭제하기" /> <c:if test="${! searchOption }">
			&nbsp;&nbsp;<input type="button" value="목록보기"
						onclick="javascript:window.location.href='boardList?pageNum=${pageNum}'" />
				</c:if> <c:if test="${searchOption}">
			&nbsp;&nbsp;<input type="button" value="목록보기"
						onclick="javascript:window.location.href=
					'boardList?pageNum=${pageNum}&type=${type}&keyword=${keyword }'" />
				</c:if></td>
		</tr>
		<tr>
			<td colspan="4" class="replyHeader">
				<div id="recommend">
					<span id="thank"> <img alt="좋아요"
						src="resources/images/smile.png" />&nbsp;좋아요
					</span> <span class="recommend">(${board.thank})</span> | <span
						id="replyWrite"> &nbsp;댓글쓰기 </span>
				</div>
				<div>
					<h3 id="replyTitle"">댓글</h3>
				</div>
			</td>
		</tr>
		<c:if test="${ empty replyList }">
			<tr id="replyList">
				<td colspan="4">
					<div id="notReply">이 게시 글에 대한 댓글이 존재하지 않습니다.</div>
				</td>
			</tr>
		</c:if>
		<c:if test="${ not empty replyList }">
			<tr id="replyList">
				<td colspan="4">
					<table id="replyTable">
						<c:forEach var="reply" items="${ replyList }">
							<tr id="reply_${ reply.no }">
								<td>
									<div class="replyUser">
										<span class="member">${ reply.replyWriter }</span>
									</div>
									<div class="replyModify">
										<span class="reply_date"> 
											<fmt:formatDate value="${ reply.regDate}" pattern="yyyy-MM-dd HH:mm:ss" />
										</span>
										<a href="#" class="modifyReply" data-no="${ reply.no }"> <img
											src="resources/images/reply_btn_modify.gif" alt="댓글 수정하기" /></a>
										<a href="#" class=deleteReply data-no="${ reply.no }"> <img
											src="resources/images/reply_btn_delete.gif" alt="댓글 삭제하기" /></a>
										<a href="javascript:reportReply('${ reply.no }')"> <img
											src="resources/images/reply_btn_notify.gif" alt="신고하기" /></a>
									</div>
									<div class="replyContent" id="div_${ reply.no }">
										<pre>
											<span>${ reply.replyContent }</span>
										</pre>
									</div>
								</td>
							</tr>
						</c:forEach>
					</table>
				</td>
			</tr>
		</c:if>
	</table>
	<div id="replyForm">
		<form name="replyWriteForm" id="replyWriteForm">
			<input type="hidden" name="bbsNo" value="${ board.no }" /> <input
				type="hidden" name="replyWriter" value="${ sessionScope.member.id }" />
			<table id="replyWriteTable">
				<tr>
					<td id="replyWriteTitle" colspan="2"><span>악의적인 댓글은 예고
							없이 삭제될 수 있으며 글쓰기 제한과 아이 디 삭제 처리됩니다.</span></td>
				</tr>
				<tr>
					<td id="replyWriteContent"><textarea name="replyContent"
							id="replyContent" rows="4"></textarea></td>
					<td id="replyWriteImage"><input type="image"
						src="resources/images/reply_btn_write.gif" id="replyWriteButton"
						alt="댓글 입력" /></td>
				</tr>
			</table>
		</form>
	</div>

</article>