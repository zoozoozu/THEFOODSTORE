<%@ page language="java" contentType="text/html; charset=utf-8" 
	pageEncoding="utf-8" %>
<%@ page isErrorPage="true" %>	
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<article>	
	<h2>런타임 익셉션</h2>	
	<div id="testId">		
		<p>${title}<br/>
		<% exception.getClass().getName(); %></p>
	</div>
	errors/commonException.jsp
</article>