<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<article>
	<table class="listTable">
		<tr>
			<td class="boardTitle" colspan="6">
				<h2 id="boardTitle">게시판 리스트</h2>
			</td>
		</tr>
		<tr>
			<th class="listThNo">NO</th>
			<th class="listThTitle">제목</th>
			<th class="listThWriter">작성자</th>
			<th class="listThRegDate">작성일</th>
			<th class="listThReadCount">조회수</th>
			<th class="listThReadCount">좋아요</th>
		</tr>
		<!-- 검색리스트 -->
		<c:if test="${ searchOption and not empty boardList }">
			<c:forEach var="b" items="${ boardList }" varStatus="status">
				<tr class="listTr">
					<td class="listTdNo">${ b.no  }</td>
					<td class="listTdTitle"><a
						href="boardDetail?no=${ b.no }&pageNum=${ currentPage }
				&type=${ type }&keyword=${ keyword }">${ b.title }</a>
					</td>
					<td class="listTdWriter">${ b.writer }</td>
					<td class="listTdRegDate"><fmt:formatDate
							value="${ b.regDate }" pattern="yyyy-MM-dd HH:mm:ss" /></td>
					<td class="listTdReadCount">${ b.readCount }</td>
					<td class="listTdReadCount">${ b.thank }</td>
				</tr>
			</c:forEach>
			<%-- 검색 요청일 경우 글쓰기와 검색결과 리스트 --%>
			<c:if test="${ searchOption }">
				<tr>
					<td colspan="6">
						<form name="searchForm" id="searchForm">
							<select name="type" id="type">
								<option value="title">제목</option>
								<option value="writer">작성자</option>
								<option value="content">내용</option>
							</select> <input type="text" name="keyword" id="keyword" /> <input
								type="submit" value="검색" />
						</form>
					</td>
				</tr>
				<tr>
					<td colspan="6" id="searchComment" align="center">"${ word  }" 검색 결과</td>
				</tr>
			</c:if>
			<tr>
				<td colspan="6" class="listPage" align="center">
				<c:if	test="${ startPage > pageGroup }">
						<a 	href="boardList?pageNum=${ startPage - pageGroup }
					&type=${ type }&keyword=${ keyword }">[이전]</a>
				</c:if> <c:forEach var="i" begin="${ startPage }" end="${ endPage }">
				<c:if test="${ i == currentPage }">
					[ ${ i } ]
				</c:if>
				<c:if test="${ i != currentPage }">
					<a href="boardList?pageNum=${ i }&type=${ type }
						&keyword=${ keyword }">[${ i } ]</a>
				</c:if>
				</c:forEach> 
				<c:if test="${ endPage < pageCount }">
						<a href="boardList?pageNum=${ startPage + pageGroup }&type=${ type }&keyword=${ keyword }">[다음]</a>
				</c:if>
				</td>
			</tr>
			<tr>
			<td colspan="6" align="center">
				<a href="writeForm" type="button">글쓰기</a>&nbsp;&nbsp;|&nbsp;&nbsp;
				<a href="writeFormMulti" type="button">글쓰기(다중업로드)</a>&nbsp;&nbsp;|&nbsp;&nbsp;
				<a href="boardList">리스트</a>
			</td>
		</tr>
		</c:if>
		<!-- 일반 리스트 -->
		<c:if test="${ not searchOption and not empty boardList }">
			<c:forEach var="b" items="${ boardList }" varStatus="status">
				<tr class="listTr">
					<td class="listTdNo">${ b.no  }</td>
					<td class="listTdTitle"><a
						href="boardDetail?no=
				${ b.no }&pageNum=${ currentPage }">${ b.title }</a>
					</td>
					<td class="listTdWriter">${ b.writer }</td>
					<td class="listTdRegDate"><fmt:formatDate
							value="${ b.regDate }" pattern="yyyy-MM-dd HH:mm:ss" /></td>
					<td class="listTdReadCount">${ b.readCount }</td>
					<td class="listTdReadCount">${ b.thank }</td>
				</tr>
			</c:forEach>
			<!-- 일반리스트 글쓰기 -->
			<c:if test="${ not searchOption }">
				<tr>
					<td colspan="5">
						<form name="searchForm" id="searchForm">
							<select name="type" id="type">
								<option value="title">제목</option>
								<option value="writer">작성자</option>
								<option value="content">내용</option>
							</select> <input type="text" name="keyword" id="keyword" /> <input
								type="submit" value="검색" />
						</form>
					</td>
				</tr>
			</c:if>
			<tr>
				<td colspan="6" class="listPage" align="center">
					<c:if	test="${ startPage > pageGroup }">
						<a href="boardList?pageNum=${ startPage - pageGroup }"> [이전]</a>
					</c:if> 
						<c:forEach var="i" begin="${ startPage }" end="${ endPage }">
							<c:if test="${ i == currentPage }">[ ${ i } ]</c:if>
							<c:if test="${ i != currentPage }">
								<a href="boardList?pageNum=${ i }">[ ${ i } ]</a>
							</c:if>
						</c:forEach> 
					<c:if test="${ endPage < pageCount }">
						<a href="boardList?pageNum=${ startPage + pageGroup }"> [다음]</a>
					</c:if></td>
			</tr>
			<tr>
			<td colspan="6" align="center">
				<a href="writeForm" type="button">글쓰기</a>&nbsp;&nbsp;|&nbsp;&nbsp;
				<a href="writeFormMulti" type="button">글쓰기(다중업로드)</a>
			</td>
		</tr>
		</c:if>
		<%-- 검색 요청이면서 검색된 리스트가 존재하지 않을 경우 --%>
		<c:if test="${ searchOption and empty boardList }">
			<tr>
				<td colspan="6" class="listTdSpan">"${ word }"가 포함된 게시 글이 존재하지
					않습니다.</td>
			</tr>
		</c:if>
		<%-- 일반 게시 글 리스트 요청이면서 게시 글 리스트가 존재하지 않을 경우 --%>
		<c:if test="${ not searchOption and empty boardList }">
			<tr>
				<td colspan="6" class="listTdSpan">게시 글이 존재하지 않습니다.</td>
			</tr>
		</c:if>
	</table>
</article>



