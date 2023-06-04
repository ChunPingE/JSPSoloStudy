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
		<form action="BoardUpdateProcCon.do" method="post">
			<table border="1">
				<tr height="40">
					<td align="center" width="120px"> 작성자 </td>
					<td align="center" width="180px"> ${bean.writer } </td>
					<td align="center" width="120px"> 작성일 </td>
					<td align="center" width="180px"> ${bean.reg_date } </td>
				</tr>
				
				<tr height="40">
					<td align="center" width="120px"> 제목 </td>
					<td width="480px" colspan="3"> &nbsp; <input type="text" name="subject" size="60" value=" ${bean.subject } "/> </td>
				</tr>
				
				<tr height="40">
					<td align="center" width="120px"> 패스워드 </td>
					<td width="480px" colspan="3"> &nbsp; <input type="password" name="password" size="60"/> </td>
				</tr>
				
				<tr height="40">
					<td align="center" width="120px"> 글내용 </td>
					<td width="480px" colspan="3"> <textarea rows="10" cols="60" name="content" align="left"/>${bean.content }</textarea></td>
				</tr>
				
				<tr height="40">
					<td align="center" colspan="4">
						<input type="hidden" name="num" value="${bean.num}"/>
						<input type="hidden" name="dbpassword" value="${bean.password}"/>
						<input type="submit" value="글수정" /> &nbsp;&nbsp;
						<input type="button" value="전체글보기" onclick="location.href='BoardListCon.do'"/>
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>