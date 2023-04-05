package control;

import java.io.IOException;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.*;

@WebServlet("/BoardUpdateProcCon.do")
public class BoardUpdateProcCon extends HttpServlet {
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
		request.setCharacterEncoding("UTF-8");
		int num = Integer.parseInt(request.getParameter("num"));
		String password = request.getParameter("password"); //사용자가 입력한 비밀번호
		String dbpassword = request.getParameter("dbpassword"); //db에 저장되있던 비밀번호
		String subject = request.getParameter("subject");
		String content = request.getParameter("content");
		
		if (password.equals(dbpassword)) {
			BoardDAO2 bdao = new BoardDAO2();
			bdao.UpdateBoard(num, subject, content);
			
			request.setAttribute("msg", "1");
			RequestDispatcher dis = request.getRequestDispatcher("BoardListCon.do");
			dis.forward(request, response);
		} else {
			request.setAttribute("msg", "2");
			RequestDispatcher dis = request.getRequestDispatcher("BoardListCon.do");
			dis.forward(request, response);
		}
	}
}
