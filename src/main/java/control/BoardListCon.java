package control;

import java.io.*;
import java.util.*;

import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;

import model.*;

@WebServlet("/BoardListCon.do")
public class BoardListCon extends HttpServlet {
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
		//화면에 보여질 게시글의 개수를 지정
		int pageSize = 10;
		//현재 보여지는 페이지의 넘버값
		String pageNum = request.getParameter("pageNum");
		//처음 처리시 값없으니 null 처리 해주기
		if (pageNum ==null){
			pageNum = "1";
		}
		//전체글의 개수
		int count = 0;
		//jsp페이지 내에서 보여질 넘버링
		int number = 0; 
		
		//현재 보여지는 페이지 문자를 숫자로 형변환
		int currentPage = Integer.parseInt(pageNum);
		
		//전체 게시글 내용 가져오기
		BoardDAO2 bdao = new BoardDAO2();
		
		//전체 게시글의 개수 읽어오는 메소드 호출
		count = bdao.getAllCount();
		
		//현재 보여질 페이지 시작번호 1 11 21 31
		int startRow = (currentPage -1) * pageSize + 1;
		//int endRow = currentPage * pageSize; 10 20 30 40
		//mysql은 10으로 고정 값 넣어주면된다.
		int endRow = pageSize;
		
		//최신글 10개를 기준으로 게시글을 리턴받아주는 메소드 호출
		List<BoardBean> list = bdao.getAllBoard(startRow, endRow); 
		
		//화면 넘버링
		number = count - (currentPage - 1) * pageSize;
		
		//////////////////////////////////
		//request객체에 담기 
	}
}
