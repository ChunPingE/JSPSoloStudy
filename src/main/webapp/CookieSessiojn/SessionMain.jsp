<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
	//Center값을 변경해주기 위해서 requeset객체를 이용하여 center값을 받아오기
	String center = request.getParameter("center");
	//처음 SessionMain.jsp를 실행하면 null값이 실행되니 null처리
	if (center == null){
		center = "Center.jsp";
	}
%>
	<div align="center">
		<table border="1" width = "800">
			<!-- Top -->
			<tr height="150">
	 			<td align="center" colspan="2">
	 				<jsp:include page="Top.jsp" />			
				</td>
			</tr>
			
			<tr height="400">
				<!-- Left -->
				 <td align="center" width = "200"><jsp:include page="Left.jsp"/></td>
				 <!-- Center -->	
				 <td align="center" width = "600"><jsp:include page="<%=center %>"/></td>
			</tr>
			
			<!--Buttom-->
			<tr height="100">
	 			<td align="center" colspan="2"><jsp:include page= "Buttom.jsp" /></td>
			</tr>
		</table>
	</div>

</body>
</html>