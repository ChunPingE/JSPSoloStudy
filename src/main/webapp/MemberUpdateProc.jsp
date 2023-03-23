<%@page import="model.MemberDAO"%>
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

	<jsp:useBean id="mBean" class="model.MemberBean">
		<jsp:setProperty name="mBean" property="*" />
	</jsp:useBean>

	<%
	String id = request.getParameter("id");

	MemberDAO mdao = new MemberDAO();
	//스트링타입으로 저장되어 있는 db의 패스워드를 가져오기
	String dbPass = mdao.getPass(mBean.getId());

	if (mBean.getPass1().equals(dbPass)) { //기존패스와 db패스가 같다면 멤버테이블 수정
		//MemberDAO의 회원수정 메소드 호출
		mdao.updateMember(mBean);
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