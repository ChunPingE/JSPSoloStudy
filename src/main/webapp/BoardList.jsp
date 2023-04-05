<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<style>
table {
	width: 700px;
	background-color: skyblue;
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:if test="${msg == '1'}">
		<script type="text/javascript">
			alert("수정이 완료되었습니다.");
		</script>
	</c:if>
	
	<c:if test="${msg == '2'}">
		<script type="text/javascript">
			alert("비밀번호를 확인해주세요");
		</script>
	</c:if>
	
	<div align="center">
		<h2>전체 게시글 보기</h2>
		<table border="1">
			<tr>
				<td align="right" colspan="5">
					<button type="button" onclick="location.href='BoardWriteForm.jsp'">글쓰기</button>
				</td>
			</tr>
			
			<tr height="40">
				<td align="center" width="50"> 번호 </td>
				<td align="center" width="320"> 제목 </td>
				<td align="center" width="100"> 작성자 </td>
				<td align="center" width="150"> 작성일 </td>
				<td align="center" width="80"> 조회수 </td>
			</tr>
			
			<c:set var="number" value="${number}"></c:set>
			<c:forEach var="bean" items="${list}" >
			
				<tr height="40">
					<td align="center" width="50"> ${number} </td>
					<td align="left" width="320"> 
						<c:if test="${bean.re_step > 1}">
							<c:forEach var="j" begin="1" end="${(bean.re_step-1) * 5}">
							&nbsp;
							</c:forEach>
						</c:if>
						<a href="BoardInfoCon.do?num=${bean.num}">${bean.subject }</a>
					</td>
					<td align="center" width="100"> ${bean.writer } </td>
					<td align="center" width="150"> ${bean.reg_date } </td>
					<td align="center" width="80"> ${bean.readcount } </td>
				</tr>
			<c:set var="number" value="${number-1}"></c:set>
			</c:forEach>
		</table>
		<p>
			<!-- 페이지 카운터링 소스 작성 -->
			<c:if test="${count >0}">
				<c:set var="pageCount" value="${count / pageSize + (count % pageSize == 0 ? 0 : 1) }"/>
				<c:set var="startPage" value="1"/>
				
				<fmt:parseNumber var="result" value="${currentPage / 10}" integerOnly="true"/>
				
				<c:if test="${currentPage % 10 !=0}">
					<!-- 결과를 정수형으로 리턴받아야하기에 fmt태그사용 -->
					<c:set var="startPage" value="${result * 10 + 1}"/>
				</c:if>
				
				<c:if test="${ currentPage % 10 ==0}">
					<c:set var="startPage" value="${(result-1) * 10 + 1}"/>
				</c:if>
				
				<!-- 화면에 보여질 페이지 처리 숫자를 표현 -->
				<c:set var="pageBlock" value="10" />
				<c:set var="endPage" value="${startPage + pageBlock -1}" />
				
				<c:if test="${endPage > pageCount}">
					<c:set var="endPage" value="${pageCount}"/>
				</c:if>
				
				<!-- 이전 링크를 걸지 파악 -->
				<c:if test="${startPage > 10}">
					<a href="BoardListCon.do?pageNum=${startPage - 10}">[이전]</a>
				</c:if>
				
				<!-- 페이징처리 -->
				<c:forEach var="i" begin="${startPage}" end="${endPage}">
					<a href="BoardListCon.do?pageNum=${i}">[${i}]</a>
				</c:forEach>
				
				<!-- 다음 링크를 걸지 파악 -->
				<c:if test="${endPage < pageCount}">
					<a href="BoardListCon.do?pageNum=${startPage + 10}">[다음]</a>
				</c:if>
			</c:if>
		</p>
	</div>
</body>
</html>