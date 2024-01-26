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
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		action(req, res);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		doGet(req, res);
	}

	public void action(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// 2. 클라이언트 요청 분석
		// 한글 안깨지게 처리
		req.setCharacterEncoding("UTF-8");
		String viewPage = "";
		OrderService service = new OrderServiceImpl();

		String uri = req.getRequestURI();
		String contextPath = req.getContextPath();
		String url = uri.substring(contextPath.length());

		// 마이페이지
		if (url.equals("/*.oc") || url.equals("/myPage.oc")) {

			viewPage = "resource/page_6/myPage.jsp";
		}

		// 주문하기 페이지
		else if (url.equals("/orderInsert.oc")) {

			viewPage = "resource/page_6/orderInsert.jsp";
		}
		
		// 내 주문 조회
		else if (url.equals("/orderDetail.oc")) {

			viewPage = "resource/page_6/orderDetail.jsp";
		}
		
		// 내 주문 수정
		
		// 내 주문 취소
		
		
	
		

		

		RequestDispatcher dispatcher = req.getRequestDispatcher(viewPage);
		dispatcher.forward(req, res);
	}

}
