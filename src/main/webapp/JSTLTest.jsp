<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 변수선언 -->
	<c:set var="i" value="4" />
	
	<!-- if문 사용법 -->
	<c:if test="${i>3}">
		안녕하세요
	</c:if>
	
	<!-- 반복문 for-->
	<c:forEach begin="1" end="10">
		점심시간입니다. <br />
	</c:forEach>
	
	<!-- 반복문 for-->
	<c:set var="sum" value="0" />
	
	<c:forEach var="j" begin="1" end="10">
		<c:set var="sum" value="${sum = sum + j}" />
	</c:forEach>
	${sum}
</body>
</html>