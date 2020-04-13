<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<article>
  <c:forEach var="p" items="${productList}" varStatus="status">
  <div class="responsive">
  	<div class="gallery">
  		<a target="_blank" href="productDetail?code=${p.code}&no=${p.no}">
      		<img src="${p.filePath}" alt="상품사진" width="600" height="400">
    	</a>
    	<div class="desc"><p class=w3-titlefont style="font-size:20px">${p.name }</p></div>
    	<div class="desc"><p class=w3-titlefont style="font-size:18px">₩ ${p.price}</p></div>
	</div>
  </div> 
  </c:forEach>
<div class="clearfix"></div>
</article>