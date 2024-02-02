package pj.mvc.jsp.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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

	public void action(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 2단계. 클라이언트의 요청을 분석

		// 한글 안깨지게 처리
		request.setCharacterEncoding("UTF-8");

		String viewPage = "";

		TicketServiceImpl tservice = new TicketServiceImpl();

		String uri = request.getRequestURI();

		String contextPath = request.getContextPath();
		// contextPath(플젝명) : /dreams_project_2

		String url = uri.substring(contextPath.length());

		// 첫페이지 main.do라고 가정
		if (url.equals("/*.tc") || url.equals("/ticket.tc")) {
			System.out.println("<<< url ==> /ticket.tc >>>");

			HttpSession session = request.getSession();
			session.setAttribute("sessionID", "hong123");
			
			viewPage = "resource/page_2/ticketFee.jsp";
			RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
			dispatcher.forward(request, response);
		}

		// 티켓 조회(예매)
		else if (url.equals("/purchaseTicket.tc")) {
			System.out.println("<<< url ==> /purchaseTicket.tc >>>");
			tservice.ticketListAction(request, response);
			viewPage = "resource/page_2/purchaseTicket.jsp";
			RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
			dispatcher.forward(request, response);
		}
		
		// 티켓 예매 처리
		else if (url.equals("/ticketRes.tc")) {
			System.out.println("<<< url ==> /ticketRes.tc >>>");
			tservice.ticketResAction(request, response);
			
			viewPage = request.getContextPath() + "/ticket.tc";

			response.sendRedirect(viewPage);
		}
		
		// 티켓 예매 확인

		// 관리자 페이지
		else if (url.equals("/admin.tc")) {
			System.out.println("<<< url ==> /admin.tc >>>");

			viewPage = "resource/admin/ticket/ticket.jsp";
			RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
			dispatcher.forward(request, response);
		}

		// 티켓 가격 조회 - 관리자 페이지
		else if (url.equals("/ticket_detail.tc")) {
			System.out.println("<<< url ==> /ticket_detail.tc >>>");
			tservice.ticketListAction(request, response);

			viewPage = "resource/admin/ticket/ticket_detail.jsp";
			RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
			dispatcher.forward(request, response);
		}
		
		// 티켓 수정버튼 클릭시 - 수정페이지 이동
		else if(url.equals("/ticket_update.tc")) {
			System.out.println("<<< url ==> /ticket_update.tc >>>");
			
			tservice.ticketEachAction(request, response);
			
			
			viewPage = "resource/admin/ticket/ticket_detail_update.jsp";
			RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
			dispatcher.forward(request, response);
			
			
		}

		// 티켓 추가버튼 클릭시 - 추가페이지 이동
		else if(url.equals("/ticket_insert.tc")) {
			System.out.println("<<< url ==> /ticket_insert.tc >>>");
			
			viewPage = "resource/admin/ticket/ticket_detail_insert.jsp";
			RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
			dispatcher.forward(request, response);
			
			
		}
		// 티켓 수정 처리
		else if (url.equals("/updateTicket.tc")) {
			System.out.println("<<< url ==> /updateTicket.tc >>>");

			tservice.ticketUpdateAction(request, response);
			viewPage = request.getContextPath() + "/admin.tc";

			response.sendRedirect(viewPage);
		}

		// 티켓 삭제 처리
		else if (url.equals("/deleteTicket.tc")) {
			System.out.println("<<< url ==> /deleteTicket.tc >>>");

			tservice.ticketDeleteAction(request, response);
			viewPage = request.getContextPath() + "/admin.tc";

			response.sendRedirect(viewPage);
		}
		// 티켓 추가
		else if (url.equals("/insertTicket.tc")) {
			System.out.println("<<< url ==> /insertTicket.tc >>>");

			tservice.ticketInsertAction(request, response);
			viewPage = request.getContextPath() + "/admin.tc";

			response.sendRedirect(viewPage);
		}
		
	}
}
