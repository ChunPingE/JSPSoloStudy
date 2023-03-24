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

	//아이디 저장 체크 박스 체크되엇는지 판단여부	
	String save = request.getParameter("save");
	//아이디값 저장
	String id = request.getParameter("id");

	if (save != null) { //아이디 저장이 눌렸다면
		//쿠키를 사용하려면 쿠키 클래스를 생성해야한다.
		Cookie cookie = new Cookie("id", id); //1번째 String 키값을 적어줌 2번째는 value적어줌
		//쿠키 유효기간 설정
		cookie.setMaxAge(60*10); //10분간유효
		response.addCookie(cookie);
		out.write("쿠키 생성 완료");
	}
	out.write("hi");
	%>

</body>
</html>