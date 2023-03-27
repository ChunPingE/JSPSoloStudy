<%@page import="model.BoardBean"%>
<%@page import="model.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	<div align="center">
		<h2>게시글 수정</h2>
		<%
			//해당 게시글 번호를 통해 수정
			int num = Integer.parseInt(request.getParameter("num").trim());
			//하나의 게시글에 대한 정보를 리턴
			BoardDAO bdao = new BoardDAO();
			BoardBean bean = bdao.getOneUpdateBoard(num);
		%>
		<form action="BoardUpdateProc.jsp" method="post">
			<table border="1">
				<tr height="40">
					<td align="center" width="120px"> 작성자 </td>
					<td align="center" width="180px"> <%=bean.getWriter() %> </td>
					<td align="center" width="120px"> 작성일 </td>
					<td align="center" width="180px"> <%=bean.getReg_date() %> </td>
				</tr>
				
				<tr height="40">
					<td align="center" width="120px"> 제목 </td>
					<td width="480px" colspan="3"> &nbsp; <input type="text" name="subject" size="60" value=" <%=bean.getSubject() %> "/> </td>
				</tr>
				
				<tr height="40">
					<td align="center" width="120px"> 패스워드 </td>
					<td width="480px" colspan="3"> &nbsp; <input type="password" name="password" size="60"/> </td>
				</tr>
				
				<tr height="40">
					<td align="center" width="120px"> 글내용 </td>
					<td width="480px" colspan="3"> <textarea rows="10" cols="60" name="content" align="left"/><%= bean.getContent() %></textarea></td>
				</tr>
				
				<tr height="40">
					<td align="center" colspan="4">
						<input type="hidden" name="num" value="<%= bean.getNum()%>"/>
						<input type="submit" value="글수정" /> &nbsp;&nbsp;
						<input type="button" value="전체글보기" onclick="location.href='BoardList.jsp'"/>
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>