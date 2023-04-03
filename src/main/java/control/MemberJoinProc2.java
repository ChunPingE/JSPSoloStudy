package control;

import java.io.*;

import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;

import model.*;

@WebServlet("/MProc2")
public class MemberJoinProc2 extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		reqPro(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		reqPro(request, response);
	}

	protected void reqPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		MemberBean2 bean = new MemberBean2();
		bean.setId(request.getParameter("id"));
		bean.setPassword(request.getParameter("password"));
		bean.setEmail(request.getParameter("email"));
		bean.setTel(request.getParameter("tel"));
		bean.setAddress(request.getParameter("address"));
		
		//request객체에 bena클래스 넘기기
		request.setAttribute("bean", bean);
		
		RequestDispatcher ds = request.getRequestDispatcher("MemberView.jsp");
		ds.forward(request, response);
	}

}
