<%@page import="model.MemberDAO"%>
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
	%>

	<jsp:useBean id="mBean" class="model.MemberBean">
		<jsp:setProperty name="mBean" property="*" />
	</jsp:useBean>

	<%
	MemberDAO mdao = new MemberDAO();
	String dbPass = mdao.getPass(mBean.getId());

	if (mBean.getPass1().equals(dbPass)) { 
		//MemberDAO의 회원삭제 메소드 호출
		mdao.deleteMember(mBean.getId());
		response.sendRedirect("MemberList.jsp");
	} else {
	%>
	<script type="text/javascript"> 
		alert("패스워드가 맞지 않습니다 다시 확인해주세요");
		history.go(-1);
	</script>
	<%
	}
	%>
</body>
</html>