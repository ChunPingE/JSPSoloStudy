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
	
	//오라클에 접속하는 소스
	String dbID = "chun"; //접속아이디 비밀번호
	String dbPwd = "1234";
	String dbURL = "jdbc:mysql://localhost:3306/jspshop"; //접속url
	
	try {
		//1. 해당 데이터 베이스를 사용한다고 선언(클래스등록)
		Class.forName("com.mysql.cj.jdbc.Driver");
		//2. 해당데이터베이스에 접속
		Connection con = DriverManager.getConnection(dbURL, dbID, dbPwd);
		//3.접속 후 쿼리준비하여 쿼리를 사용호도록 설정
		String sql = "INSERT INTO MEMBER VALUES(?,?,?,?,?,?,?,?)";
		//쿼리를 사용하도록 설정
		PreparedStatement pstmt = con.prepareStatement(sql);
		//?에 맞게 데이터 설정
		pstmt.setString(1, mbean.getId());
		pstmt.setString(2, mbean.getPass1());
		pstmt.setString(3, mbean.getEmail());
		pstmt.setString(4, mbean.getTel());
		pstmt.setString(5, mbean.getHobby());
		pstmt.setString(6, mbean.getJob());
		pstmt.setString(7, mbean.getAge());
		pstmt.setString(8, mbean.getInfo());
		//4.오라클에서 쿼리를 실행하시오
		pstmt.executeUpdate(); // insert update delet시 사용하는메소드
		
		//5. 자원반납
		con.close();
		
	} catch (Exception e) {
		e.printStackTrace();
	}
	
%>
	오라클에 완료~

</body>
</html>