<%@page import="db.RentcarDAO"%>
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
	
		String id = request.getParameter("id");
		String pass = request.getParameter("pass");
		
		//회원아이디 패스워드 비교 그냥 RentCarDAO에서 쿼리받기
		RentcarDAO rdao = new RentcarDAO();
		//해당 회원이 있는지 여부를 숫자로 표현
		int result = rdao.getMember(id,pass);
		
		if (result == 0){
	%>	
		<script type="text/javascript">
			alert("회원 아이디 또는 패스워드가 틀립니다.");
			location.href='RentcarMain.jsp?center=MemberLogin.jsp';
		</script>
	<%
		} else{
			//로그인 처리가 되었다면
			session.setAttribute("id", id);
			response.sendRedirect("RentcarMain.jsp");
		}
	%>
	
	
</body>
</html>