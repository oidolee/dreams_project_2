package pj.mvc.jsp.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pj.mvc.jsp.service.OrderService;
import pj.mvc.jsp.service.OrderServiceImpl;


@WebServlet("/*oc")
public class OrderController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public OrderController() {
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
		// 2. 클라이언트 요청 분석
		// 한글 안깨지게 처리
		request.setCharacterEncoding("UTF-8");
		String viewPage = "";
		OrderService service = new OrderServiceImpl();
		
		String uri = request.getRequestURI();			
		String contextPath = request.getContextPath();		
		String url = uri.substring(contextPath.length()); 
		
		// 첫페이지
		if(url.equals("/*.oc") || url.equals("/.oc")) {
			
			
		}
	}

}

