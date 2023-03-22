<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div align="center">
		<% 
			request.setCharacterEncoding("UTF-8");
		%>
		<!--request로 넘어온 데이터를 자바 빈즈랑 매핑 시켜주는 useBean  -->
		<!--객체생성 MemberBean mbean = new MemberBean()-->
		<jsp:useBean id="mbean" class="bean.MemberBean">
		<!--JSP내용을 자바 빈 클래스(MemberBean의미)에 데이터를 매핑(넣어줌)-->
			<jsp:setProperty name = "mbean" property="*"/> <!--자동으로 매핑해주세요-->
		</jsp:useBean>
		<h2>당신의 아이디는 <jsp:getProperty property="id" name="mbean"/></h2>
		<h2>당신의 패스는 <jsp:getProperty property="pass1" name="mbean"/></h2>
		<h2>당신의 이메일는 <jsp:getProperty property="email" name="mbean"/></h2>
		<h2>당신의 전화번호는 <%= mbean.getTel() %></h2>
	</div>
</body>
</html>