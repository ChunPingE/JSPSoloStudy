<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div align="center">
		<h2>쿠키 로그인</h2>
		<form action="CookieLoginProc.jsp" method="post">
			<table width="400px" border="1">
				<tr height="50px">
					<td witdh="150px">아이디</td>
					<td witdh="250px"><input type="text" name="id"/></td>
				</tr>
				
				<tr height="50px">
					<td witdh="150px">패스워드</td>
					<td witdh="250px"><input type="password" name="pass"/></td>
				</tr>
				
				<tr height="50px">
					<td colspan="2" align="center"><input type="checkbox" name="save"/>아이디저장</td>
				</tr>
				
				<tr height="50px">
					<td colspan="2" align="center"><input type="submit" value="로그인"/></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>