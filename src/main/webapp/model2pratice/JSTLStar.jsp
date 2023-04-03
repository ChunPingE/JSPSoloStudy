<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- *
		***
	 -->
	<!-- 내풀이 -->
	<c:forEach var="i" begin="1" end="5">
		<c:forEach begin="${i}" end="4">
		 	&nbsp; 
		</c:forEach>
		<c:forEach begin="1" end="${i*2-1}">
			*
		</c:forEach>
		<br />
	</c:forEach>

	<hr />

	<!-- 강사님풀이 -->
	<c:forEach var="i" begin="0" end="4">
		<c:forEach var="j" begin="${i+1}" end="5">
		 	&nbsp; 
		</c:forEach>
		<c:forEach var="k" begin="1" end="${i*2+1}">
			*
		</c:forEach>
		<br />
	</c:forEach>

</body>
</html>