<%@page import="db.CarListBean"%> 
<%@page import="java.util.List"%>
<%@page import="db.RentcarDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
	<!-- 데이터 베이스에 연결하여 최신순 자동차 3대만 뿌려주는 데이터를 가져옴 -->
	<%
		RentcarDAO rdao = new RentcarDAO();
		//리스트를 이용하여 데이터를 저장
		List<CarListBean> list = rdao.getSelectCar();
	%>
	<div align="center">
		<table>
			<tr height="100">
				<td align="center" colspan="3">
					<font size="6" color="gray">최신형 자동차</font>
				</td>
			</tr>
		
			<tr height = "240">
			<%
				for (int i =0 ; i < list.size(); i++){
					CarListBean bean = list.get(i);
			%>		
				<td width="333" align="center">
					<a href="RentcarMain.jsp?center=CarReserveInfo.jsp?no=<%=bean.getNo()%>">
						<img src="img/<%=bean.getImg() %>"  width="300" height="200" alt="" />
					</a><p>
					차량명 : <%= bean.getName() %>
					</p>
				</td>
			<%		
				}
			%>
			</tr>
		</table>
		
		<hr color="red" size="3"/>
		<p>
			<font size="4" color="black"> 차량검색하기 </font> <br /><br /><br />
			<form action="RentcarMain.jsp?center=CarCategoryList.jsp" method="post">
				<font size="3" color="black"> <b>차량검색하기</b></font> &nbsp;&nbsp;
				<select name="category">
					<option value="1">소형</option>
					<option value="2">중형</option>
					<option value="3">대형</option>
				</select> &nbsp;&nbsp;
				<input type="submit"  value="검색"/> &nbsp;&nbsp;
				<button type="button" onclick="location.href='RentcarMain.jsp?center=CarAllList.jsp'">전체 검색</button>
			</form>
	</div>
	
</body>
</html>