<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
table{
	width: 1000px;
}
a {
	text-decoration: none;
	color: white;
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 세션을 이용한 로그인 처리 -->
	<%
		String id = (String) session.getAttribute("id");
		//로그인이 되어 있지 않다면
		if (id == null){
			id = "GUEST";
		}
	
	%>

	<div align="center">
		<table>
			<tr height="70">
				<td colspan="4">
					<img src="img/RENT.png"  height="65"/>
				</td>
				<td width="200px" align="center">
					<%= id %> 님 반갑습니다.
				</td>
			</tr>
			
			<tr height="50">
				<td align="center" width="200" bgcolor="red">
					<font size="5"><a href="#">예약하기</a></font>
				</td>
				
				<td align="center" width="200" bgcolor="red">
					<font size="5"><a href="#"> 예약확인 </a></font>
				</td>
				
				<td align="center" width="200" bgcolor="red">
					<font size="5"><a href="#">자유게시판</a></font>
				</td>
				
				<td align="center" width="200" bgcolor="red">
					<font size="5"><a href="#">이벤트</a></font>
				</td>
				
				<td align="center" width="200" bgcolor="red">
					<font size="5"><a href="#">고객센터</a></font>
				</td>
			</tr>
		</table>
	</div>

</body>
</html>