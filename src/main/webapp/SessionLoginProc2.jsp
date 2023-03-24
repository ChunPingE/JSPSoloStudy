<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>세션 로그인 처리2</h2>
	<%
		request.setCharacterEncoding("UTF-8");
		
		//세션을 이용하여 데이터를 불러오기
		String id = (String) session.getAttribute("id");
		String pass = (String) session.getAttribute("pass");
	%>
	
	<h2>당신의 아이디는 <%=id %> 입니다.</h2>
</body>
</html>