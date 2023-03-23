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
		<form action="MemberUpdateProc.jsp" method="post" >
			<tr height="50">
				<td align="center" width="150px"> 아이디 </td>
				<td width="250px"> <%= mBean.getId() %> </td>
			</tr>
			
			<tr height="50">
				<td align="center" width="150px"> 이메일 </td>
				<td width="250px"> <input type="email" name ="email" value="<%= mBean.getEmail()%>"/></td>
			
			<tr height="50">
				<td align="center" width="150px"> 전화 </td>
				<td width="250px"> <input type="tel" name ="tel" value="<%= mBean.getTel()%>"/></td>
			</tr>	
			
			<tr height="50">
				<td align="center" width="150px"> 패스워드 </td>
				<td width="250px"> <input type="password" name ="pass1"/></td>
			</tr>	
			
			<tr height="50">
				<td align="center" colspan="2">
					<input type="hidden" name="id" value="<%=mBean.getId() %>"/>
					<input type="submit" value = "회원수정하기"/> 
				</form>
					<button onclick="location.href='MemberList.jsp'">회원전체보기</button>
				</td>
			</tr>
		</table>
	
	</div>

</body>
</html>