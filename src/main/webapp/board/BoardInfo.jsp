<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div align="center">
		<h2>게시글 보기</h2>
		<table border="1">
			<tr height="40">
				<td align="center" width="120px"> 글번호 </td>
				<td align="center" width="180px"> ${bean.num } </td>
				<td align="center" width="120px"> 조회수 </td>
				<td align="center" width="180px"> ${bean.readcount } </td>
			</tr>
			
			<tr height="40">
				<td align="center" width="120px"> 작성자 </td>
				<td align="center" width="180px"> ${bean.writer } </td>
				<td align="center" width="120px"> 작성일 </td>
				<td align="center" width="180px"> ${bean.reg_date } </td>
			</tr>
			
			<tr height="40">
				<td align="center" width="120px"> 이메일 </td>
				<td align="center" colspan="3"> ${bean.email } </td>
			</tr>
			
			<tr height="40">
				<td align="center" width="120px"> 제목 </td>
				<td align="center" colspan="3"> ${bean.subject } </td>
			</tr>
			
			<tr height="80">
				<td align="center" width="120px"> 글내용 </td>
				<td align="center" colspan="3"> ${bean.content } </td>
			</tr>
			
			<tr height="40">
				<td align="center" colspan="4">
					<input type="button" value="답글쓰기" onclick="location.href='BoradReWriteCon.do?num=${bean.num }&ref=${bean.ref}&re_step=${bean.re_step}&re_level=${bean.re_step }'"/>
					<input type="button" value="수정하기" onclick="location.href='BoardUpdateCon.do?num=${bean.num}'"/>
					<input type="button" value="삭제하기" onclick="location.href='BoardDeleteCon.do?num=${bean.num}'"/>
					<input type="button" value="목록보기" onclick="location.href='BoardListCon.do'"/>
				</td>
			</tr>
		</table>
	</div>

</body>
</html>