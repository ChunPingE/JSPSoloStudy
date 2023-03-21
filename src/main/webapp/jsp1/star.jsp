<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>피라미드 쌓기</h2>
	<%
	for (int i = 0; i <= 5; i++) {
		for (int j = 1; j <= i; j++) {
	%>	
		<%= "*" %>
	<%
		}
	%>	
		<br>
	<%
	}
	%>
</body>
</html>