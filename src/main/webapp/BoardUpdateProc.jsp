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
		request.setCharacterEncoding("UTF-8");
	%>
	<!-- 사용자 데이터를 읽어들이는 빈클래스 설정 -->
	<jsp:useBean id="boardBean" class="model.BoardBean">
		<jsp:setProperty name="boardBean" property="*"/>
	</jsp:useBean>
	
	<%
		//데이터베이스 연결
		BoardDAO bdao = new BoardDAO();
		//해당게시글의 패스워드 값을 얻어옴
		String pass = bdao.getPass(boardBean.getNum());
		
		//기존패스워드 값과 update시 작성햇던 pass값 같은지 비교
		if (pass.equals(boardBean.getPassword())){
			//데이터 수정 메소드호출
			bdao.updateBoard(boardBean);
			response.sendRedirect("BoardList.jsp");
		} else {
			//패스워드 틀리면 돌아가기
	%>
	<script type="text/javascript">
		alert("패스워드가 일치하지 않습니다 다시 확인후 수정해주세요");
		history.go(-1);
	</script>
	<%
		}
	%>

</body>
</html>