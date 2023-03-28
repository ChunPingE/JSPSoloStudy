<%@page import="model.BoardBean"%>
<%@page import="java.util.List"%>
<%@page import="model.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
	
	<div align="center">
		<h2>전체 게시글 보기</h2>
		<!-- 게시글 보기에 카운터링을 설정하기 위한 변수들을 선언 -->
		<%
			//화면에 보여질 게시글의 개수를 지정
			int pageSize = 10;
			//현재 카운터를 클릭한 번호값을 읽어오기
			String pageNum = request.getParameter("pageNum");
			//만약 처음 boardList.jsp를 클릭하거나 수정삭제등 하고 왓을때 값이 없기에 null처리해주기
			if (pageNum ==null){
				pageNum = "1";
			}
			int count = 0; //전체글의 개수를 저장하는 변수
			int number = 0; //페이지 넘버링변수
			
			//현재 보고자하는 페이지 숫자를 저장
			int currentPage = Integer.parseInt(pageNum);
			
			//전체 게시글 내용 jsp로 가져오기
			BoardDAO bdao = new BoardDAO();
			
			//전체 게시글의 개수 읽어오는 메소드 호출
			count = bdao.getAllCount();
			
			//현재 페이지에 보여줄 시작 번호를 설정 =db에서 불러올 시작번호
			int startRow = (currentPage -1) * pageSize + 1;
			//int endRow = currentPage * pageSize;
			int endRow = pageSize;
			
			//전체 게시글을 리턴 받아주는 소스
			List<BoardBean> list = bdao.getAllBoard(startRow, endRow); 
			
			//테이블에 표시할 번호를 지정
			number = count - (currentPage - 1) * pageSize;
		%>
		
		<table border="1">
			<tr>
				<td align="right" colspan="5">
					<input type="button" value="글쓰기" onclick="location.href='BoardWriteForm.jsp'"/>
				</td>
			</tr>
		
			<tr height="40">
				<td align="center" width="50px"> 번호 </td>
				<td align="center" width="320px"> 제목 </td>
				<td align="center" width="100px"> 작성자 </td>
				<td align="center" width="150px"> 작성일 </td>
				<td align="center" width="80px"> 조회수 </td>
			</tr>
			
			<%
				for (int i = 0; i < list.size(); i++){
					BoardBean bean = list.get(i); //저장된걸 하나씩 가져오기
			%>		
				<tr height="40">
					<td align="center" width="50px"> <%= number-- %> </td>
					<td align="left" width="320px"> <a href="BoardInfo.jsp?num=<%= bean.getNum() %>" style="text-decoration:none">
					<%
						if(bean.getRe_step() > 1){
							for (int j = 0; j < (bean.getRe_step()-1) * 5; j++){
					%>
					&nbsp;
					<%		
							}
						}
					%>
					
					<%= bean.getSubject() %></a></td>
					<td align="center" width="100px"> <%= bean.getWriter() %> </td>
					<td align="center" width="150px"> <%= bean.getReg_date() %> </td>
					<td align="center" width="80px"> <%=bean.getReadcount() %> </td>
				</tr>
			<%	}%>
			
		</table>
		
		<p>
		<!-- 페이지 카운터링 소스를 작성 -->
		<% 
			if(count > 0){
				int pageCount = count / pageSize + (count%pageSize == 0 ? 0 : 1); //카운터링숫자를 얾나까지 보여줄건지를 결정
				//시작페이지 숫자를 설정
				int startPage = 1;
				
				if (currentPage % 10 != 0){
					startPage = (int) (currentPage / 10) * 10 + 1;
				}  else{
					startPage = ((int) (currentPage / 10) -1 ) * 10 + 1;
				}
				
				int pageBlock = 10; //카운터링 처리 숫자
				int endPage = startPage + pageBlock -1 ; //화면에 보여질 페이지의 마지막 숫자
			
				if (endPage > pageCount) {
					endPage = pageCount;
				}
				
				//이전 이라는 링크를 만들껀지 파악
				if (startPage > 10){
		%>		
			<a href="BoardList.jsp?pageNum=<%= startPage - 10%>">[이전]</a>
		<% 
				}
				//페이징 처리
				for(int i = startPage; i <= endPage; i++){
		%>	
				
			<a href="BoardList.jsp?pageNum=<%= i %>">[<%=i %>]</a>
		<%	
				}
				//다음이라는 링크를 만들건지 파악
				if (endPage < pageCount){
		%>		
			<a href="BoardList.jsp?pageNum=<%= startPage+10 %>">[다음]</a>		
		<%			
				}
			}
		%>
		</p>
	</div>
</body>
</html>