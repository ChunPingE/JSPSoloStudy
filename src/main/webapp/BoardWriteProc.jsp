<%@page import="model.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8"); //한글처리
	%>
	<!-- 게시글 작성한 데이터를 한번에 읽기 useBean -->
	<jsp:useBean id="boardBean" class="model.BoardBean" >
		<jsp:setProperty name="boardBean" property="*"/>
	</jsp:useBean>
	
	<%
		BoardDAO bddao = new BoardDAO();
		// 데이터 저장 메소드 호출
		bddao.insertBoard(boardBean);
		
		//게시글 저장후 전체 게시글 보기
		response.sendRedirect("BoardList.jsp");
	%>
</body>
</html>