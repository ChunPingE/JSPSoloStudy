<%@page import="db.CarListBean"%>
<%@page import="java.util.List"%>
<%@page import="db.RentcarDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	//카테고리 분류값을 받아오기
	int category = Integer.parseInt(request.getParameter("category"));
	String temp = "";
	if ( category == 1){
		temp = "소형";
	} else if (category == 2){
		temp = "중형";
	} else {
		temp = "대형";
	}
%>
	<div align="center">
		<table>
			<tr height="100">
				<td align="center" colspan="3">
					<font size="6" color="gray"><%=temp %> 자동차 </font>
				</td>
			</tr>
			<%
				RentcarDAO rdao = new RentcarDAO();
				
				List<CarListBean> list = rdao.getCategoryCar(category); 
				//tr을 3개씩 보여주고 다시 tr을 실행할 수 있도록 적용하는 변수
				int j = 0;
				for (int i = 0; i < list.size(); i++){
					CarListBean bean = list.get(i);
					if (j%3==0){
			%>		
				<tr height="220">
			<%
				}
			%>
				<td width="333" align="center">
					<a href="RentcarMain.jsp?center=CarReserveInfo.jsp?no=<%= bean.getNo()%>"> 
						<img src="img/<%=bean.getImg() %>" width="300" height="200"/>
					</a> <p>
					<font size="3" color="black">차량명 : <%= bean.getName() %></font></p>		
				</td>
			
			<%
				j = j + 1;	//j값을 증가하여 하나의 행에 총 3개의 차량 정보 보여주기
				}
			%>
		</table>
	</div>
</body>
</html>