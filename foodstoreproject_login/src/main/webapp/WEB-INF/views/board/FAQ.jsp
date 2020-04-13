<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>


<style>
.accordion {
	background-color: #8fb7a5;
	color: #FFF;
	cursor: pointer;
	padding: 18px;
	width: 100%;
	text-align: left;
	border: 1px solid white;
	outline: none;
	transition: 0.4s;
	font: 20px Lato, sans-serif;
}

.active, .accordion:hover {
	background-color: #527e6a;
}

.panel {
	padding: 0 18px;
	background-color: white;
	display: none;
	overflow: hidden;
}

p {
	font: 16px Lato, sans-serif;
}

.accordion:after {
	content: '\02795'; /* Unicode 글자 "plus" 표시 (+) */
	font-size: 15px;
	float: right;
	margin-left: 5px;
}

.active:after {
	content: "\2796"; /* Unicode 글자 "minus" 표시 (-) */
}

.FAQhead{
	font-size:25px;
}

</style>

<article>
	<div>
		<!-- FAQ게시판의 제목 -->
		<div class="FAQhead">
			<h2 align="center" font face="Consolas">
				<b>고객센터<b>(Q&A)
			</h2>
		</div>

		<!-- FAQ게시판 내용 -->
		<div>
			<c:if test="${ searchOption and not empty FAQList }">
				<c:forEach var="f" items="${ FAQList }" varStatus="status">
					<button class="accordion">${ f.asking }</button>
					<div class="panel">
						<p>${f.answer}</p>
					</div>
				</c:forEach>
				<div></div>
				<div class="searchForm" align="center" font-size="14px">
					<form name="searchForm"
						action="FAQ?pageNum=${pageNum}&keyword=${keyword}">
						<input type="text" name="keyword" id="keyword" /> <input
							type="submit" value="검색" /> <input type="button" value="돌아가기"
							oneclick="javascript:window.location.href=	'FAQ'" />
					</form>
				</div>
				<div></div>
				<div class="pageNum" align="center" font-size="14px">
					<c:if test="${ startPage > pageGroup }">
						<a
							href="FAQ?pageNum=${ startPage - pageGroup } 
									&keyword=${ keyword }">[이전]</a>
					</c:if>
					<c:forEach var="i" begin="${ startPage }" end="${ endPage }">
						<c:if test="${ i == currentPage }"> [ ${ i } ] </c:if>
						<c:if test="${ i != currentPage }">
							<a href="FAQ?pageNum=${ i }&keyword=${ keyword }">[${ i } ]</a>
						</c:if>
					</c:forEach>
					<c:if test="${ endPage < pageCount }">
						<a
							href="FAQ?pageNum=${ startPage + pageGroup }
							&keyword=${ keyword }">[다음]</a>
					</c:if>
				</div>
			</c:if>
			<!-- 검색아니면서 내용이 있을경우 -->
			<c:if test="${ not searchOption and not empty FAQList }">
				<c:forEach var="f" items="${ FAQList }" varStatus="status">
					<button class="accordion">${ f.asking }</button>
					<div class="panel">
						<p>${f.answer}</p>
					</div>
				</c:forEach>
				<h5></h5>
				<div class="searchForm" align="center" font-size="14px">
					<form name="searchForm"
						action="FAQ?pageNum=${pageNum}&keyword=${keyword}">
						<input type="text" name="keyword" id="keyword" /> <input
							type="submit" value="검색" />
					</form>
				</div>
				<h5></h5>
				<div class="pageNum" align="center" font-size="14px">
					<c:if test="${ startPage > pageGroup }">
						<a href="FAQ?pageNum=${ startPage - pageGroup } ">[이전]</a>
					</c:if>
					<c:forEach var="i" begin="${ startPage }" end="${ endPage }">
						<c:if test="${ i == currentPage }"> [ ${ i } ] </c:if>
						<c:if test="${ i != currentPage }">
							<a href="FAQ?pageNum=${ i }">[${ i } ]</a>
						</c:if>
					</c:forEach>
					<c:if test="${ endPage < pageCount }">
						<a href="FAQ?pageNum=${ startPage + pageGroup }">[다음]</a>
					</c:if>
				</div>
			</c:if>
			<%-- 검색 요청이면서 검색된 리스트가 존재하지 않을 경우 --%>
			<c:if test="${ searchOption and empty FAQList }">
				<li class="qa_li"><span>${word}검색된 내용이 없습니다.</span></li>
			</c:if>
			<%-- 검색 요청이면서 검색된 리스트가 존재하지 않을 경우 --%>
			<c:if test="${ not searchOption and empty FAQList }">
				<li class="qa_li"><span>내용이 없습니다.</span></li>
			</c:if>
		</div>
	</div>

	<!-- 고객센터 스크립트 -->
	<script type="text/javascript">
		var acc = document.getElementsByClassName("accordion");
		var i;
		for (i = 0; i < acc.length; i++) {
			acc[i].addEventListener("click", function() {
				this.classList.toggle("active");
				var panel = this.nextElementSibling;
				if (panel.style.display === "block") {
					panel.style.display = "none";
				} else {
					panel.style.display = "block";
				}
			});
		}
	</script>

</article>