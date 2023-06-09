<%@page import="db.CarListBean"%> 
<%@page import="db.RentcarDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
table {
	width: 1000px;
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		int no = Integer.parseInt(request.getParameter("no"));
	
		RentcarDAO rdao = new RentcarDAO();
		
		//하나의 정보 얻기
		CarListBean bean = rdao.getOneCar(no);
		
		//카테고리 분류값을 받아오기
		int category = bean.getCategory();
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
		<form action="RentcarMain.jsp?center=CarOptionSelect.jsp" method="post">
			<table>
				<tr height="100">
					<td align="center" colspan="3">
						<font size="6" color="gray"><%=bean.getName() %> 차량 선택</font>
					</td>
				</tr>
			
				<tr>
					<td rowspan="6" align="center" width="500">
						<img src="img/<%=bean.getImg() %>" width="450" />
						<td width="250" align="center"> 차량이름 </td>
					<td width="250" align="center"> <%=bean.getName() %> </td>
				</tr>
				
				<tr>
					<td width="250" align="center"> 차량수량 </td>
					<td width="250" align="center"> 
						<select name="qty">
							<option value="1">1</option>
							<option value="1">2</option>
							<option value="1">3</option>
						</select>
					</td>
				</tr>
				
				<tr>
					<td width="250" align="center"> 차량분류 </td>
					<td width="250" align="center"> <%=temp %> </td>
				</tr>
				
				<tr>
					<td width="250" align="center"> 대여가격 </td>
					<td width="250" align="center"> <%= bean.getPrice() %>원 </td>
				</tr>
				
				<tr>
					<td width="250" align="center"> 제조회사 </td>
					<td width="250" align="center"> <%= bean.getCompany() %> </td>
				</tr>
				
				<tr>
					<td colspan="2" align="center">
						<input type="hidden" name="no" value="<%= bean.getNo() %>" />
						<input type="hidden" name="img" value="<%= bean.getImg() %>" />
						<input type="submit" value="옵션선택 후 구매하기"/> 
					 </td>
				</tr>
			</table>
			<br /><br /><br />
		<font size="5" color="gray">차량 정보 보기</font>
		<p>
		<%= bean.getInfo() %>
		</p>
		</form>
	</div>
</body>
</html>