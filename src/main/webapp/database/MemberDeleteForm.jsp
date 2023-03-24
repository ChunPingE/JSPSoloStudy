<%@page import="model.MemberBean"%>
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

	<%
		String id = request.getParameter("id"); //Memverlist에서 받은값
		MemberDAO mdao = new MemberDAO();
		MemberBean mBean = mdao.oneSelectMember(id);//해당하는 id의 회원정보값
	%>
	
	<div align="center">
		<h2>회원 정보 수정 하기</h2>
	
		<table border="1">
		<form action="MemberDeleteProc.jsp" method="post" >
			<tr height="50">
				<td align="center" width="150px"> 아이디 </td>
				<td width="250px"> <%= request.getParameter("id") %> </td>
			</tr>
			
			<tr height="50">
				<td align="center" width="150px"> 비밀번호 </td>
				<td width="250px"> <input type="password" name ="pass1"/></td>
			</tr>
			
			<tr height="50">
				<td align="center" colspan="2">
					<input type="hidden" name="id" value="<%= request.getParameter("id") %>"/>
					<input type="submit" value = "회원삭제하기"/> 
				</form>
					<button onclick="location.href='MemberList.jsp'">회원전체보기</button>
				</td>
			</tr>
		</table>
	
	</div>

</body>
</html>