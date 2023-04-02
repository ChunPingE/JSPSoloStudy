<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
table{
	width: 1000px;
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String center = request.getParameter("center");
		//처음 실행시에는 center값이 넘어오지 않기에 null처리
		if (center == null){
			center = "Center.jsp";
		}
	%>
	<div align="center">
		<table>
			<!-- Top -->
			<tr height="140" align="center">
				<td align="center" width="1000px"><jsp:include page="Top.jsp"/></td>
			</tr>
			
			<!-- center -->
			<tr align="center">
				<td align="center" width="1000px"><jsp:include page="<%=center %>"/></td>
			</tr>
			
			<!-- bottom -->
			<tr height="140" align="center">
				<td align="center" width="1000px"><jsp:include page="Bottom.jsp"/></td>
			</tr>
		</table>
	</div>
</body>
</html>