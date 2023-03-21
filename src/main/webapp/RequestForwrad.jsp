<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String id = request.getParameter("id");
		String pass = request.getParameter("pass");
	%>
	<h2>
	RequestForward 페이지 입니다.<br>
	당신의 아이디는 <%= id %> 이고 패스워드는 <%= pass %>입니다.
	</h2>
</body>
</html>