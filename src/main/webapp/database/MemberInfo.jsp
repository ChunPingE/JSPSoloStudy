<%@page import="model.MemberDAO"%>
<%@page import="model.MemberBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	<!--1 db에서 한회원의 정보 가져오기 2. 테이블태그를 이용하여 한회원정보출력  -->
	<%
		String id = request.getParameter("id"); //Memverlist에서 받은값
		MemberDAO mdao = new MemberDAO();
		MemberBean mBean = mdao.oneSelectMember(id);//해당하는 id의 회원정보값
	%>
	
	<div align="center">
		<h2>회원 정보 보기</h2>
		<table border="1">
			<tr height="50">
				<td align="center" width="150px"> 아이디 </td>
				<td width="250px"> <%= mBean.getId() %> </td>
			</tr>
			
			<tr height="50">
				<td align="center" width="150px"> 이메일 </td>
				<td width="250px"> <%= mBean.getEmail()%> </td>
			
			<tr height="50">
				<td align="center" width="150px"> 전화 </td>
				<td width="250px"> <%= mBean.getTel() %> </td>
			</tr>	
			
			<tr height="50">
				<td align="center" width="150px"> 취미 </td>
				<td width="250px"> <%= mBean.getHobby() %> </td>
			</tr>	
			
			<tr height="50">
				<td align="center" width="150px"> 직업 </td>
				<td width="250px"> <%= mBean.getJob() %> </td>
			</tr>	
				
			<tr height="50">
				<td align="center" width="150px"> 나이 </td>
				<td width="250px"> <%= mBean.getAge() %></td>
			</tr>	
			
			<tr height="50">
				<td align="center" width="150px">정보</td>
				<td width="250px"><%= mBean.getInfo()%></td>
			</tr>
			
			<tr height="50">
				<td align="center" colspan="2">
				<button onclick="location.href='MemberUpdateForm.jsp?id=<%=mBean.getId()%>'" >회원수정</button>
				<button onclick="location.href='MemberDeleteForm.jsp?id=<%=mBean.getId()%>'" >회원삭제</button>
				<button onclick="location.href='MemberList.jsp'">목록보기</button>
				<button onclick="location.href='MemberJoin.jsp'">회원가입</button>
				
				</td>
				
			</tr>
		</table>
	</div>
</body>
</html>