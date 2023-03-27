<%@page import="model.BoardBean"%>
<%@page import="java.util.List"%>
<%@page import="model.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
table {
	width: 700px;
	background-color: skyblue;
}
</style>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	//전체 게시글 내용 jsp로 가져오기
	BoardDAO bdao = new BoardDAO();

	//전체 게시글을 리턴 받아주는 소스
	List<BoardBean> list = bdao.getAllBoard();
	%>
	<div align="center">
		<h2>전체 게시글 보기</h2>
		<table border="1">
			<tr height="40">
				<td align="center" width="50px"> 번호 </td>
				<td align="center" width="320px"> 제목 </td>
				<td align="center" width="100px"> 작성자 </td>
				<td align="center" width="150px"> 작성일 </td>
				<td align="center" width="80px"> 조회수 </td>
			</tr>
			
			<%
				for (int i = 0; i < list.size(); i++){
					BoardBean bean = list.get(i); //저장된걸 하나씩 가져오기
			%>		
				<tr height="40">
					<td align="center" width="50px"> <%= i + 1 %> </td>
					<td align="left" width="320px"> <a href="BoardInfo.jsp?num=<%= bean.getNum() %>"><%= bean.getSubject() %></a></td>
					<td align="center" width="100px"> <%= bean.getWriter() %> </td>
					<td align="center" width="150px"> <%= bean.getReg_date() %> </td>
					<td align="center" width="80px"> <%=bean.getReadcount() %> </td>
				</tr>
			<%	}%>
			<tr>
				<td align="center" colspan="5">
					<input type="button" value="글쓰기" onclick="location.href='BoardWriteForm.jsp'"/>
				</td>
			</tr>
		</table>
	</div>
</body>
</html>