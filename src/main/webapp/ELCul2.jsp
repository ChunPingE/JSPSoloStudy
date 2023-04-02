<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div align="center">
		<h2>계산기</h2>
		<form action="ELCul2.jsp" method="post">
			<table>
				<tr height="40">
					<td align="center" width="100">
						<input type="text" name="exp1"/>
					</td>
					
					<td align="center" width="100">
						<select name="exp2" >
							<option value="+"> + </option>
							<option value="-"> - </option>
							<option value="*"> * </option>
							<option value="/"> / </option>
						</select>
					</td>
					
					<td align="center" width="100">
						<input type="text" name="exp3"/>
					</td>
				
					<td align="center" width="100">=</td>
					
					<td align="center" width="100">
						<input type="text" name="exp4" value="${param.exp1 + param.exp3}"/>
					</td>
					 
					<td>
						<input type="submit" value="결과보기"/>
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>