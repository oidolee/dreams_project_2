package pj.mvc.jsp.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("*.do")
public class BoardController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
    public BoardController() {
        super();
    }

    // 1단계. 웹브라우저가 전송한 HTTP 요청을 받음
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		action(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		doGet(request, response);
	}
	
	public void action(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		// 2. 클라이언트 요청을 분석
		
		// 한글 안깨지게 처리
		request.setCharacterEncoding("UTF-8");
		String viewPage = "";
		//서비스 객체생성 자리
		
		String uri = request.getRequestURI();
		
		String contextPath = request.getContextPath();	// 플젝명
		
		String url = uri.substring(contextPath.length());
		
		// 메인페이지
		if(url.equals("/*.do") || url.equals("/index.do")){
			System.out.println("<<< url ==> /index.do >>>");
			
			viewPage = "page_5/index.jsp";
		}
		
		// 드림즈게시판
		else if(url.equals("/dreamsBoard.do")) {
			System.out.println("<<< url ==> /index.do >>>");
			
			viewPage = "page_4/dreamsBoard.jsp";
		}
		
		// 드림즈게시판 검색페이지
		else if(url.equals("/dreamsBoardSearch.do")) {
			System.out.println("<<< url ==> /dreamsBoardSearch.do >>>");
			viewPage = "page_4/dreamsBoardSearch.jsp";
		}
		
		
		// RequestDispatcher : 서블릿 또는 JSP 요청을 받은 후, 다른 컴포넌트로 요청을 위임하는 클래스이다.
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
		
	}

}
