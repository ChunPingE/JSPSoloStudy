<%@page import="db.RentcarDAO"%>
<%@page import="db.CarListBean"%>
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
		int no = Integer.parseInt(request.getParameter("no"));
		//차량 수량
		int qty = Integer.parseInt(request.getParameter("qty"));
		String img = request.getParameter("img");
	%>
	
	<div align="center">
		<form action="RentcarMain.jsp?center=CarReserveResult.jsp" method="post">
			<table>
				<tr height="100">
					<td align="center" colspan="3">
						<font size="6" color="gray">옵션 선택</font>
					</td>
				</tr>
			
				<tr>
					<td rowspan="7" align="center" width="500">
						<img src="img/<%=img %>" width="450" />
						<td width="250" align="center"> 대여기간 </td>
						<td>
							<select name="dday" >
								<option value="1">1일</option>
								<option value="2">2일</option>
								<option value="3">3일</option>
								<option value="4">4일</option>
								<option value="5">5일</option>
								<option value="6">6일</option>
								<option value="7">7일</option>
							</select>
						</td>
					</tr>
					
				
				<tr>
					<td width="250" align="center"> 대여일 </td>
					<td><input type="date" name="rday" size="15" /></td>
				</tr>
				
				<tr>
					<td width="250" align="center"> 보험적용 </td>
					<td>
						<select name="usein">
							<option value="1">적용 (1일 1만원) </option>
							<option value="2">비적용</option>
						</select>
					</td>
				</tr>
				
				<tr>
					<td width="250" align="center"> 와이파이 </td>
					<td>
						<select name="usewifi">
							<option value="1">적용 (1일 1만원)</option>
							<option value="2">비적용</option>
						</select>
					</td>
				</tr>
				
				<tr>
					<td width="250" align="center"> 네비게이션 적용 </td>
					<td>
						<select name="usenavi">
							<option value="1">적용 (무료)</option>
							<option value="2">비적용</option>
						</select>
					</td>
				</tr>
				
				<tr>
					<td width="250" align="center"> 베이비시트 적용 </td>
					<td>
						<select name="useseat">
							<option value="1">적용 (1일 1만원)</option>
							<option value="2">비적용</option>
						</select>
					</td>
				</tr>
				
				<tr>
					<td colspan="2" align="center">
						<input type="hidden" name="no" value="<%=no%>"/>
						<input type="hidden" name="qty" value="<%=qty%>"/>
						<input type="submit" value="차량예약하기" />
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>