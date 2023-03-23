<%@page import="model.MemberBean"%>
<%@page import="java.util.Vector"%>
<%@page import="model.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
	//가변길이인 벡터르 이용하여 데이터를 저장해줌
	Vector<MemberBean> vec = mdao.allSelcetMember();
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
			<%
				for(int i = 0; i < vec.size(); i++){
					MemberBean bean = vec.get(i);
			
			%>
			<tr height="50">
				<td align="center" width="150px"> 
				<a href="MemberInfo.jsp?id=<%=bean.getId()%>"><%=bean.getId()%></a></td>
				<td align="center" width="250px"> <%= bean.getEmail() %> </td>
				<td align="center" width="200px"> <%= bean.getTel() %></td>
				<td align="center" width="200px"> <%= bean.getHobby() %> </td>
			</tr>
			<%
				}
			%>
		</table>
	</div>
</body>
</html>