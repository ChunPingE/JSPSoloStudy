package control;

import java.io.IOException;
import java.util.*;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.*;

@WebServlet("/BoardInfoCon.do")
public class BoardInfoCon extends HttpServlet {
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
		//number값을 리턴
		int num = Integer.parseInt(request.getParameter("num"));
		
		BoardDAO2 bdao = new BoardDAO2();
		
		//하나의 게시글 정보 리턴
		BoardBean bean = bdao.getOneBoard(num);
		
		request.setAttribute("bean", bean);
		
		//view로 넘겨주기
		RequestDispatcher dis = request.getRequestDispatcher("BoardInfo.jsp");
		dis.forward(request, response);
	}
}
