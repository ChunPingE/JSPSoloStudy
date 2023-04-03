package control;

import java.io.IOException;
import java.util.*;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.*;

@WebServlet("/MemberListCon.do")
public class MemberListCon extends HttpServlet {
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
		
		//db에 연결하여 회원의 모든 정보 리턴
		MemberDAO3 mdao = new MemberDAO3();
		List<MemberBean> list = mdao.getAllMember();
		
		request.setAttribute("list", list);
		RequestDispatcher dis = request.getRequestDispatcher("MemberList.jsp");
		dis.forward(request, response);
	}
}
