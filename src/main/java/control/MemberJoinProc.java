package control;

import java.io.IOException;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.*;

@WebServlet("/proc.do")
public class MemberJoinProc extends HttpServlet {
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
		
		MemberBean bean = new MemberBean();
		bean.setId(request.getParameter("id"));
		String pass1 = request.getParameter("pass1");
		String pass2 = request.getParameter("pass2");
		bean.setPass1(pass1);
		bean.setPass2(pass2);
		bean.setEmail(request.getParameter("email"));
		bean.setTel(request.getParameter("tel"));
		String[] hobbies = request.getParameterValues("hobby");
		String hobby = "";
		for (String s : hobbies) {
			hobby += s + " "; //하나의 스트링으로 데이터 연결
		}
		bean.setHobby(hobby);
		bean.setJob(request.getParameter("job"));
		bean.setAge(request.getParameter("age"));
		bean.setInfo(request.getParameter("info"));
			
		//패스워드가 같을 경우에만 데이터베이스에 저장
		if (pass1.equals(pass2)){
			//DB베이스 객체 선언한 후 저장
			MemberDAO3 mdao = new MemberDAO3();
			mdao.insertMember(bean);
			
			RequestDispatcher dis = request.getRequestDispatcher("MemberListCon.do");
			dis.forward(request, response);
		} else {
			request.setAttribute("msg", "패스워드가 일치하지 않습니다.");
			RequestDispatcher dis = request.getRequestDispatcher("LoginError.jsp");
			dis.forward(request, response);
		}
	}
}
