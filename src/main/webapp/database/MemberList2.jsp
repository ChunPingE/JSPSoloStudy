<%@page import="model.MemberBean"%>
<%@page import="java.util.Vector"%>
<%@page import="model.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<style>
table {
   width: 800px;
 }

</style>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 1. db에서 모든 회원의 정보를 가져오기 2.테이블태그로 화면에 회원들의 정보를 출력 -->
	<%
	MemberDAO mdao = new MemberDAO();
	//가변길이인 벡터를 이용하여 데이터를 저장해줌
	Vector<MemberBean> vec = mdao.allSelcetMember();
	request.setAttribute("vec", vec);
	%>

	<div align="center">
		<h2>모든회원보기</h2>
		<table border="1">
			<tr height="50">
				<td align="center" width="150px"> 아이디 </td>
				<td align="center" width="250px"> 이메일 </td>
				<td align="center" width="200px"> 전화번호</td>
				<td align="center" width="200px"> 취미 </td>
			</tr>
		
			<c:forEach var="bean" items="${vec}">
				<tr height="50">
				<td align="center" width="150px"> 
				<a href="MemberInfo.jsp?id=${bean.id} }">${bean.id}</a></td>
				<td align="center" width="250px">${bean.email} </td>
				<td align="center" width="200px"> ${bean.tel} </td>
				<td align="center" width="200px"> ${bean.hobby}  </td>
			</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>