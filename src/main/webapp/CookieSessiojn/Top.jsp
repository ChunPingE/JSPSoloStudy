<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%	
		//�α׾ƿ� Ŭ���� �Ķ���͸� ���ؼ� �α׾ƿ����� Ȯ��
	  	String logout = request.getParameter("logout");
	
		if (logout != null){
			session.setAttribute("id", null);
			session.setMaxInactiveInterval(0);
		}
		
		//���ǿ��� id�� ��������
		String id = (String) session.getAttribute("id");
		//�α����� �Ǿ� ���� �ʴٸ� session�� nulló��
		if (id == null){
			id = "�մ�";
		}
	%>
	
	<!--Top  -->
	<table width = "800"> 
		<tr height="100">
		<!--�ΰ� �̹���  -->
			<td colspan = "2" align = "center" width= "200">
				<img alt = "" src = "images/1.png" width="200" height="70">
			</td>
			
			<td colspan = "45 align = "center">
				<font size= "10">���� ķ�� </font>
			</td>
		</tr>
		<tr height="50">
			<td width = "100" align = "center">��Ʈ</td>
			<td width = "100" align = "center">����</td>
			<td width = "100" align = "center">�ı��</td>
			<td width = "100" align = "center">ħ��</td>
			<td width = "100" align = "center">���̺�</td>
			<td width = "100" align = "center">ȭ���</td>
			<td width = "200" align = "center">
			<%
			 	if (id =="�մ�") {
			 %>
			 	<%=id %> �� <button onclick="location.href='SessionMain.jsp?center=SessionLoginForm.jsp'">�α���</button>
			 <% } else { %>
				<%=id %> ��<button onclick="location.href='SessionMain.jsp?logout=1'">�α׾ƿ�</button>
			<%	}%>
			</td>		
		</tr>
	</table>
</body>
</html>