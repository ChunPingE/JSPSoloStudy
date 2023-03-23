<%@page import="model.MemberBean"%>
<%@page import="java.util.Vector"%>
<%@page import="model.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 1. db에서 모든 회원의 정보를 가져오기 2.테이블태그로 화면에 회원들의 정보를 출력 -->
<%
	MemberDAO mdao = new MemberDAO();
	//가변길이인 벡터르 이용하여 데이터를 저장해줌
	Vector<MemberBean> vec = mdao.allSelcetMember();
%>
</body>
</html>