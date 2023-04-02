<%@page import="db.CarViewBean"%>
<%@page import="db.CarReserveBean"%>
<%@page import="java.util.List"%>
<%@page import="db.RentcarDAO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
#table{
	width: 1000px;
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String id = (String) session.getAttribute("id");
		if (id == null){
	%>	
		<script type="text/javascript">
			alert("로그인을 먼저 해주세요");
			location.href='RentcarMain.jsp?center=MemberLogin.jsp';
		</script>
	<%
		} 
		//로그인 되어 있는 아이디 읽어줌
		RentcarDAO rdao = new RentcarDAO();
		List<CarViewBean> list= rdao.getAllReserve(id);
	%>
		<div align="center">
		<table id="table" border="1">
			<tr height="100">
				<td align="center" colspan="11">
					<font size="6" color="gray">차량 예약 확인</font>
				</td>
			</tr>
			
			<tr height="40">
				<td width="150" align="center">이미지</td>
				<td width="150" align="center">이름</td>
				<td width="150" align="center">대여일</td>
				<td width="60" align="center">대여기간</td>
				<td width="100" align="center">금액</td>
				<td width="60" align="center">수량</td>
				<td width="60" align="center">보험여부</td>
				<td width="60" align="center">와이파이</td>
				<td width="60" align="center">네비게이션</td>
				<td width="60" align="center">베이비시트</td>
				<td width="90" align="center">삭제</td>
			</tr>
	<%
		for (int i = 0; i <list.size(); i++){
			CarViewBean bean = list.get(i);
			
			String usein = "";
			if (bean.getUsein() == 1){
				usein = "보험가입";
			} else{
				usein = "보험미가입";
			}
			
			String usewifi = "";
			if (bean.getUsewifi() == 1){
				usewifi = "대여";
			} else{
				usewifi = "미대여";
			}
			
			String usenavi = "";
			if (bean.getUsenavi() == 1){
				usenavi = "대여";
			} else{
				usenavi = "미대여";
			}
			
			String useseat = "";
			if (bean.getUseseat() == 1){
				useseat = "대여";
			} else{
				useseat = "미대여";
			}
	%>		
		<tr height="60">
			<td width="150" align="center">
				<img src="img/<%=bean.getImg() %>" width="120" height="70" />
			</td>
			<td width="150" align="center"><%=bean.getName() %></td>
			<td width="150" align="center"><%=bean.getRday() %></td>
			<td width="60" align="center"><%=bean.getDday() %>일</td>
			<td width="100" align="center"><%=bean.getPrice() %>원</td>
			<td width="60" align="center"><%=bean.getQty() %></td>
			<td width="60" align="center"><%=usein %></td>
			<td width="60" align="center"><%=usewifi %></td>
			<td width="60" align="center"><%=usenavi %></td>
			<td width="60" align="center"><%=useseat %></td>
			<td width="90" align="center">
				<button onclick="location.href='CarReserveDel.jsp?rday=<%=bean.getRday()%>&id=<%=id%>">취소</button>
			</td>
	<%		
		}
	%>	
			
		</table>
	</div>
</body>
</html>