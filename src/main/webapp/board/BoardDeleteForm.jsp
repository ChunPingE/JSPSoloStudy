<%@page import="model.BoardBean"%>
<%@page import="model.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
table {
	width: 600px;
	background-color: skyblue;
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%
		//해당 게시글 번호를 통해 수정
		int num = Integer.parseInt(request.getParameter("num").trim());
		//하나의 게시글에 대한 정보를 리턴
		BoardDAO bdao = new BoardDAO();
		BoardBean bean = bdao.getOneUpdateBoard(num);
	%>
	<div align="center">
		<h2>게시글 수정</h2>

		<form action="BoardDeleteProc.jsp" method="post">
			<table border="1">
				<tr height="40">
					<td width="120px" align="center">작성자</td>
					<td width="180px" align="center"><%= bean.getWriter() %></td>
					<td align="center" width="120px"> 작성일 </td>
					<td align="center" width="180px"> <%=bean.getReg_date() %> </td>
				</tr>
				
				<tr height="40">
					<td width="120px" align="center">제목</td>
					<td colspan="3" align="left"><%= bean.getSubject() %></td>
				</tr>
				
				<tr height="40">
					<td width="120px" align="center">비밀번호</td>
					<td colspan="3" align="left"><input type="password" name="password" szie="60" /></td>
				</tr>
				
				<tr height="40">
					<td colspan="4" align="center">
						<input type="hidden" name="num" value="<%= bean.getNum() %>" />
						<input type="submit" value="글삭제" /> &nbsp;&nbsp;
						<input type="button" onclick="location.href='BoardList.jsp'" value="목록보기"/>
					</td>	
				</tr>
			</table>
		</form>
	</div>
</body>
</html>