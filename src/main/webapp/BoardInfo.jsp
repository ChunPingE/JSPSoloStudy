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
		String num_ = request.getParameter("num");
		int num = Integer.parseInt(num_.trim()); //공백제거후 정수형변환
		//데이터 베이스 접근
		BoardDAO bdao = new BoardDAO();
		//BoardBean 타입으로 하나의 게시글 리턴
		BoardBean bean = bdao.getOneBoard(num);
	%>
	
	<div align="center">
		<h2>게시글 보기</h2>
		<table border="1">
			<tr height="40">
				<td align="center" width="120px"> 글번호 </td>
				<td align="center" width="180px"> <%=bean.getNum() %> </td>
				<td align="center" width="120px"> 조회수 </td>
				<td align="center" width="180px"> <%=bean.getReadcount() %> </td>
			</tr>
			
			<tr height="40">
				<td align="center" width="120px"> 작성자 </td>
				<td align="center" width="180px"> <%=bean.getWriter() %> </td>
				<td align="center" width="120px"> 작성일 </td>
				<td align="center" width="180px"> <%=bean.getReg_date() %> </td>
			</tr>
			
			<tr height="40">
				<td align="center" width="120px"> 이메일 </td>
				<td align="center" colspan="3"> <%=bean.getEmail() %> </td>
			</tr>
			
			<tr height="40">
				<td align="center" width="120px"> 제목 </td>
				<td align="center" colspan="3"> <%=bean.getSubject() %> </td>
			</tr>
			
			<tr height="80">
				<td align="center" width="120px"> 글내용 </td>
				<td align="center" colspan="3"> <%=bean.getContent() %> </td>
			</tr>
			
			<tr height="40">
				<td align="center" colspan="45">
					<input type="button" value="답글쓰기" onclick="location.href='BoradReWriteForm.jsp?num=<%= bean.getNum() %>&ref=<%= bean.getRef()%>&re_step=<%= bean.getRe_step()%>&re_level=<%= bean.getRe_level()%>'"/>
					<input type="button" value="수정하기" onclick="location.href='BoardUpdateForm.jsp?num=<%= bean.getNum() %>'"/>
					<input type="button" value="삭제하기" onclick="location.href='BoardDeleteForm.jsp?num=<%= bean.getNum() %>'"/>
					<input type="button" value="목록보기" onclick="location.href='BoardList.jsp'"/>
				</td>
			</tr>
		</table>
	</div>
</body>
</html>