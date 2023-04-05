<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div align="center">
		<form action="BoardReWriteProcCon.do" method="post">
			<table border="1">
				<tr height="40">
					<td align="center" width="150px">작성자</td>
					<td width="450px"><input type="text" name="writer" size="60" /></td>
				</tr>

				<tr height="40">
					<td align="center" width="150px">제목</td>
					<td width="450px"><input type="text" name="subject" value="[답변]" size="60" /></td>
				</tr>

				<tr height="40">
					<td align="center" width="150px">이메일</td>
					<td width="450px"><input type="email" name="email" size="60" /></td>
				</tr>

				<tr height="40">
					<td align="center" width="150px">비밀번호</td>
					<td width="450px"><input type="password" name="password" size="60" /></td>
				</tr>

				<tr height="40">
					<td align="center" width="150px">글내용</td>
					<td width="450px"><textarea rows="10" cols="50" name="content"></textarea></td>
				</tr>

				<!-- form에서 사용자로부터 입력받지 않고 데이터를 넘김 -->
				<tr height="40">
					<td align="center" colspan="2">
						<input type="hidden" name="ref" value="${ref}"/>
						<input type="hidden" name="re_step" value="${re_step}"/>
						<input type="hidden" name="re_level" value="${re_level }"/>
						<input type="submit" value="답글쓰기 완료"> &nbsp;&nbsp; 
						<input type="reset" value="취소"> &nbsp;&nbsp;
						<input type="button" value="전체 글 보기"  onclick="location.href='BoardListProc.do'" />
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>