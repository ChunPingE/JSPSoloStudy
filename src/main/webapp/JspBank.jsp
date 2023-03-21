<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%!
	public void inCrement(){
	}
%>

<%!
	int a = 10; //멤버변수
%>
<%
	int a = 100; //지역변수
%>
<%
	//int a = 1000; 같은 지역에서 만들기 때문에 에러
%>
</body>
</html>