<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
#table {
	width: 300px;
	border-color: gray;
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="MemberLoginProc.jsp" method="post">
		<table id="table" border="1" >
			<tr height="100">
				<td align="center" colspan="2">
					<font size="6" color="gray">로그인</font>
				</td>
			</tr>
		
			<tr height="40">
				<td width="120" align="center">아이디</td>
				<td width="180"> <input type="text" name="id" size="15" /></td>
			</tr>
			
			<tr height="40">
				<td width="120" align="center">패스워드</td>
				<td width="180"> <input type="password" name="pass" size="15" /></td>
			</tr>
			
			<tr height="40">
			 	<td colspan="2" align="center">
			 		<input type="submit"  value="로그인"/>
			 	</td>
			</tr>
		</table>
	</form>
</body>
</html>