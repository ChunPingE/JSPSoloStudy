<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
table {
   width: 600px;
   background-color: skyblue;
}

</style>
</head>
<body>
	<div align="center">
		<h2>게시글 쓰기</h2>
		
		<form action="BoardWriteProc.jsp" method="post">
			<table border="1">
				<tr height="40">
					<td align="center" width="150px">작성자</td>
					<td width="450px"><input type="text" name="writer" size="60"/> </td>
				</tr>
				
				<tr height="40">
					<td align="center" width="150px">제목</td>
					<td width="450px"><input type="text" name="subject" size="60"/> </td>
				</tr>
				
				<tr height="40">
					<td align="center" width="150px">이메일</td>
					<td width="450px"><input type="email" name="email" size="60"/> </td>
				</tr>
				
				<tr height="40">
					<td align="center" width="150px">비밀번호</td>
					<td width="450px"><input type="password" name="writer" size="60"/> </td>
				</tr>
				
				<tr height="40">
					<td align="center" width="150px">내용</td>
					<td width="450px"><textarea rows="10" cols="50" name="content"></textarea> </td>
				</tr>
				
				<tr height="40">
					<td align="center" colspan="2">
						<input type="submit" value="글쓰기"> &nbsp;&nbsp;
						<input type="reset" value="다시작성"> &nbsp;&nbsp;
						<button onclick="location.href='BoardList.jsp'">전체 글 보기</button>
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>