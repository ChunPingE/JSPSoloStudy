<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2 align = "center">로그인 페이지 </h2>
	<div align = "center">
		<form action= "RequestLoginProc.jsp" method="post">
		<table width="400" border="1">
			<tr height = "60">
				<td align="center" width ="150">아이디</td>
				<td align="left" width= "250">
					<input type="text" name="id">
				</td>
			</tr>
			
			<tr height ="60">
				<td align = "center" width="150">패스워드</td>
				<td align = "left" width="250">
					<!-- ***으로 보임 -->
					<input type ="password" name="pass">
				</td>
			</tr>
			<tr height ="60">
				<td colspan = "2" align = "center">
					<input type ="submit" value="전송">
				</td>
			</tr>
		</table>
		</form>
	</div>
</body>
</html>