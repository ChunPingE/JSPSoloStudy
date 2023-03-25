<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		//사용자 컴퓨터의 쿠키저장소로부터 쿠키값읽기
		Cookie[] cookies = request.getCookies();
		String id = "";
		//쿠키값이 없을 수도 있으니 null처리	
		if (cookies != null){
			for(int i =0 ; i < cookies.length ; i ++){
				if (cookies[i].getName().equals("id")){
					id = cookies[i].getValue();
					break;
				}
			}
		}
	%>

	<div align="center">
		<h2>쿠키 로그인</h2>
		<form action="CookieLoginProc.jsp" method="post">
			<table width="400px" border="1">
				<tr height="50px">
					<td witdh="150px">아이디</td>
					<td witdh="250px"><input type="text" name="id" value="<%= id %>" /></td>
				</tr>
				
				<tr height="50px">
					<td witdh="150px">패스워드</td>
					<td witdh="250px"><input type="password" name="pass"/></td>
				</tr>
				
				<tr height="50px">
					<td colspan="2" align="center"><input type="checkbox" name="save" value="1"/>아이디저장</td>
				</tr>
				
				<tr height="50px">
					<td colspan="2" align="center"><input type="submit" value="로그인"/></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>