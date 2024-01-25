package pj.mvc.jsp.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pj.mvc.jsp.service.TicketServiceImpl;


@WebServlet("*.tc")
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
		
		
		
		String uri = request.getRequestURI();
		
		String contextPath = request.getContextPath();
		// contextPath(플젝명) : /dreams_project_2
		
		String url = uri.substring(contextPath.length());
		
		// 첫페이지 main.do라고 가정
		if(url.equals("/*.tc") || url.equals("/ticket.tc")) {
			System.out.println("<<< url ==> /ticket.tc >>>");
			
			viewPage = "resource/page_2/ticketFee.jsp";
		}
		
		// 관리자 페이지
		else if(url.equals("/admin.tc")) {
			System.out.println("<<< url ==> /admin.tc >>>");
			
			viewPage = "resource/admin/index.jsp";
		}
		
		// 티켓 가격 조회 - 관리자 페이지
		else if(url.equals("/ticket.tc")) {
			System.out.println("<<< url ==> /admin.tc >>>");
			
			viewPage = "resource/admin/index.jsp";
		}
		// 티켓 조회(예매)
		else if(url.equals("/purchaseTicket.tc")) {
			System.out.println("<<< url ==> /purchaseTicket.tc >>>");
			
			viewPage = "resource/page_2/purchaseTicket.jsp";
		}
		
		// 티켓 상세조회(좌석별 가격)
		else if(url.equals("/purchaseTicketPrice.tc")) {
			System.out.println("<<< url ==> /purchaseTicketPrice.tc >>>");
			
			tservice.ticketListAction(request, response);
			
			viewPage = "resource/page_2/purchaseTicket.jsp";
		}
		
		
		
		
		// 티켓 삭제 처리
		
		// 티켓 예약 취소 처리
		
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}
}
