<%@page import="model.MemberDAO"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
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
	request.setCharacterEncoding("UTF-8");

	//취미 부분은 별도로 읽어서 다시 빈클래스에 저장해야한다.
	String[] hobby = request.getParameterValues("hobby");
	//배열에 있는 내용을 하나의 스트링으로 저장
	String textHobby="";
	for(int i = 0; i < hobby.length ; i++){
		textHobby += hobby[i] + " ";
	}
%>
	<!-- useBean으르 이용하여 한꺼번에 데이터를 받아옴 -->
	<jsp:useBean id="mbean" class="model.MemberBean">
		<jsp:setProperty name="mbean" property="*" /> <!-- 매핑시키시오 -->
	</jsp:useBean>
	
<% 
	//기존 취미는 주소 번지가 저장되기에 배열의 내용을 하나의 스트링으로 저장한 변수를 다시입력
	mbean.setHobby(textHobby);

	//데이터베이스 클래스 객체 생성
	MemberDAO mdao = new MemberDAO();
	mdao.insertMember(mbean);
	
	//회원가입이 되었다면 회원정보를 보여주는 페이지로 이동
	response.sendRedirect("MemberList.jsp");
%>
	오라클에 완료~

</body>
</html>