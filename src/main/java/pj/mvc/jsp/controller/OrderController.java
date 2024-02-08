package pj.mvc.jsp.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pj.mvc.jsp.service.OrderService;
import pj.mvc.jsp.service.OrderServiceImpl;

@WebServlet("*.oc")
public class OrderController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public OrderController() {
		super();
	}

	// 1단계. 웹브라우저가 전송한 HTTP 요청을 받음
	protected void doGet(HttpServletRequest req, HttpServletResponse res) 
			throws ServletException, IOException {

		action(req, res);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) 
			throws ServletException, IOException {

		doGet(req, res);
	}

	public void action(HttpServletRequest req, HttpServletResponse res) 
			throws ServletException, IOException {
		// 2. 클라이언트 요청 분석
		// 한글 안깨지게 처리
		req.setCharacterEncoding("UTF-8");
		String viewPage = "";

		String uri = req.getRequestURI();
		String contextPath = req.getContextPath();
		String url = uri.substring(contextPath.length());
		
		OrderService service = new OrderServiceImpl();
		
		// 마이페이지
		if (url.equals("/*.oc") || url.equals("/myPage.oc")) {

			viewPage = "/resource/page_6/myPage.jsp";
			
			RequestDispatcher dispatcher = req.getRequestDispatcher(viewPage);
			dispatcher.forward(req, res);
		}
		
		// 내 주문 조회
		else if (url.equals("/myOrder.oc")) {
			
			service.orderDetailAction(req, res);
			viewPage = "/resource/page_6/myOrder.jsp";
			
			RequestDispatcher dispatcher = req.getRequestDispatcher(viewPage);
			dispatcher.forward(req, res);
		}

		// 내 주문 조회 -> 구매 확정
		else if (url.equals("/orderConfirm.oc")) {
			
			service.orderConfirm(req, res);
			viewPage = "/resource/page_6/orderConfirm.jsp";
			
			RequestDispatcher dispatcher = req.getRequestDispatcher(viewPage);
			dispatcher.forward(req, res);
		}
		
		
		// 내 주문 조회 -> 교환/환불 페이지 - 최근 구매한 상품
		else if (url.equals("/goodsRefund.oc")) {
			System.out.println(" Controller => goodsRefund.oc ");
			
			service.MyorderDetailAction(req, res);
			viewPage = "/resource/page_6/goodsRefund.jsp";
			
			RequestDispatcher dispatcher = req.getRequestDispatcher(viewPage);
			dispatcher.forward(req, res);
		}
		
		// 상품 교환/환불 페이지 신청서 제출
		else if (url.equals("/goodsRefundSubmit.oc")) {
			
			service.productRefundAction(req, res);
			viewPage = "/resource/page_6/goodsRefundAction.jsp";
			
			RequestDispatcher dispatcher = req.getRequestDispatcher(viewPage);
			dispatcher.forward(req, res);
		}
		
		
		// 교환/환불 신청 목록
		else if (url.equals("/refundDetail.oc")) {
			
			service.refundDetailAction(req, res);
			viewPage = "/resource/page_6/refundDetail.jsp";
			
			RequestDispatcher dispatcher = req.getRequestDispatcher(viewPage);
			dispatcher.forward(req, res);
		}
		
		
		
	
		
		// -----------------------------------------------------------------------
		// 내가 구매한 티켓 페이지
				else if (url.equals("/myTicket.oc")) {
					
					viewPage = "/resource/page_6/myTicket.jsp";
				}
				
		// 티켓 환불 페이지
		else if (url.equals("/ticketRefund.oc")) {
			
			viewPage = "/resource/page_6/ticketRefund.jsp";
			
			RequestDispatcher dispatcher = req.getRequestDispatcher(viewPage);
			dispatcher.forward(req, res);
		}
		
		
		// -------------------------------------------------------------------------
		// 마이페이지 -> 회원정보 수정
		else if (url.equals("/modifyMember.oc")) {

			viewPage = "/resource/page_6/modifyMember.jsp";
			
			RequestDispatcher dispatcher = req.getRequestDispatcher(viewPage);
			dispatcher.forward(req, res);
		}
		
		// 마이페이지 -> 회원 탈퇴
		else if (url.equals("/deleteMember.oc")) {

			viewPage = "/resource/page_6/deleteMember.jsp";
			
			RequestDispatcher dispatcher = req.getRequestDispatcher(viewPage);
			dispatcher.forward(req, res);
		}

		
	}

}
