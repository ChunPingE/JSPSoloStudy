package control;

import java.io.IOException;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/HelloWorld") // /HelloWorld라고 url에 표시해줘야 이 서블릿 클래스가 실행됨
public class HelloWorld extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		reqPro(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		reqPro(request, response);
	}

	//doget이든 do post던 아래 reqPro메소드가 실행되게 해주기
	protected void reqPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//화면에 HelloWorld라고 출력하고 싶다.
		String msg = "Hello World 안녕하세요";
		
		//jsp쪽으로 데이터를 request에 붙여서 넘겨주기
		request.setAttribute("msg", msg);
		
		//서블릿에서 jsp를 호출하면서 데이터를 같이 넘겨주는 객체를 선언
		RequestDispatcher rd = request.getRequestDispatcher("HelloWorld.jsp");//jsp파일명
		rd.forward(request, response);
	}
}
