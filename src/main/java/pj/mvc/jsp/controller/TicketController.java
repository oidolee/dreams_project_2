package pj.mvc.jsp.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pj.mvc.jsp.service.TicketServiceImpl;


@WebServlet("/*do")
public class TicketController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public TicketController() {
    }

    // 1단계. 웹브라우저가 전송한 HTTP요청을 받음
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
		// 2단계. 클라이언트의 요청을 분석
		
		// 한글 안깨지게 처리
		request.setCharacterEncoding("UTF-8");
		
		String viewPage="";
		
		TicketServiceImpl tservice = new TicketServiceImpl();
		
		// http://localhost/jsp_pj_ict02/*.do => 확장자로 구분 *.do
		// http://localhost/플젝명(컨텍스트 패스)/*(모든것).do
		
		String uri = request.getRequestURI();
		
		String contextPath = request.getContextPath();
		// contextPath(플젝명) : /dreams_project_2
		
		String url = uri.substring(contextPath.length());
		
		// 첫페이지 main.do라고 가정
		if(url.equals("/*do") || url.equals("main.do")) {
			System.out.println("<<< url ==> /main.do >>>");
			
			viewPage = "page_2/templet.jsp";
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}
}
