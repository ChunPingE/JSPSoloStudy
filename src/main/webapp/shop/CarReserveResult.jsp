<%@page import="db.CarListBean"%>
<%@page import="db.RentcarDAO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
#table {
	width: 1000px
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
	%>
	<jsp:useBean id="rbean" class="db.CarReserveBean">
		<jsp:setProperty name="rbean" property="*"/>
	</jsp:useBean>
	
	<%
		String id = (String) session.getAttribute("id");
		if (id == null){
	%>	
		<script type="text/javascript">
			alert("로그인 후 예약이 가능합니다.");
			location.href='RentcarMain.jsp?center=MemberLogin.jsp';
		</script>
	<%
		}
		//날짜비교
		Date d1 = new Date();
		Date d2 = new Date();
		//날짜를 2016-4-4 포맷해주는 클래스 선언
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		d1 = sdf.parse(rbean.getRday());
		d2 = sdf.parse(sdf.format(d2));
		//날짜비교 메소드
		int compare = d1.compareTo(d2);
		//예약하려는 날짜보다 현재 날짜가 크다면 -1
		if (compare < 0 ){ //오늘보다 이전 날짜 선택시
	%>
		<script type="text/javascript">
			alert("현재 시스템 날짜보다 이전 날짜는 선택할수 없습니다.");
			history.go(-1);
		</script>
	<%
		}
		
		//결과적으로 아무런 문제가 없다면 데이터 저장후 결과 보여주기
		//아이디 값이 빈클래스에 없기에 가져오기
		String uid = (String) session.getAttribute("id");
		rbean.setId(uid);
		
		//db에 저장
		RentcarDAO rdao = new RentcarDAO();
		rdao.setReserveCar(rbean);
		
		//차량정보 얻어오기
		CarListBean cbean = rdao.getOneCar(rbean.getNo()); 
		
		System.out.println(rbean.getNo());
		System.out.println(rbean.getQty());
		System.out.println(rbean.getUsein());
		//차량금액
		int totalCar = cbean.getPrice() * rbean.getQty() * rbean.getDday();
		//욥션금액
		int usein = 0;
		if (rbean.getUsein() == 1 ){
			usein = 10000;
		}
		int usewifi = 0;
		if (rbean.getUsein() == 1 ){
			usewifi = 10000;
		}
		int useseat = 0;
		if (rbean.getUsein() == 1 ){
			useseat = 10000;
		}
		int totalOption = rbean.getQty() * rbean.getDday() * (usein + usewifi + useseat);
	%>
	
	<div align="center">
		<table id="table">
			<tr height="100">
				<td align="center" >
					<font size="6" color="gray">차량 예약 완료 화면</font>
				</td>
			</tr>
			
			<tr>
				<td align="center" >
					<img src="img/<%=cbean.getImg() %>" width="470" alt="" />
				</td>
			</tr>
			
			<tr height="50">
				<td align="center" >
					<font size="5" color="red">차량 총 예약 금액<%= totalCar%></font>
				</td>
			</tr>
			
			<tr height="50">
				<td align="center" >
					<font size="5" color="red">차량 총 옵션 금액<%= totalOption %></font>
				</td>
			</tr>
			
			<tr height="50">
				<td align="center" >
					<font size="5" color="red">차량 총 금액<%= totalCar + totalOption %></font>
				</td>
			</tr>
		</table>
	</div>
</body>
</html>