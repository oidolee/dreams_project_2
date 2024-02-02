package pj.mvc.jsp.controller;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import pj.mvc.jsp.service.CustomerServiceImpl;

@WebServlet("*.cc")	// 업무별로 확장자 분리
public class CustomerController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public CustomerController() {
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
	
	protected void action(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		// 2. 클라이언트 요청 분석
		
		// 한글 안깨지게 처리
		request.setCharacterEncoding("UTF-8");
		String viewPage = "";
		
		CustomerServiceImpl service = new CustomerServiceImpl();
		    
		// http://localhost/jdbc/*.cc
		
		String uri = request.getRequestURI();
		System.out.println(uri);
		String contextPath = request.getContextPath();	
		String url = uri.substring(contextPath.length());	
		  
		
		// 첫페이지
		if(url.equals("/*.cc") || url.equals("/index.cc")) {	// 요청
			System.out.println("<<< url ==> /index.cc >>>");
			
			viewPage = "index.jsp";		// 응답
		}
		
		// -- [ 회원가입 ] -- 
		else if(url.equals("/join.cc")) {
			System.out.println("<<< url ==> /join.cc >>>");
			  
			viewPage = "resource/page_1/join.jsp"; 
		}
		 
		// 아이디 중복확인 
		else if(url.equals("/idConfirmAction.cc")) {
			System.out.println("<<< url ==> /idConfirmAction.cc >>>");
			  
			service.idConfirmAction(request, response);
			viewPage = "resource/page_1/idConfirmAction.jsp";
		}
		 
		// 회원가입 처리
		else if(url.equals("/joinAction.cc")) {
			System.out.println("<<< url ==> /joinAction.cc >>>");
			
			service.signInAction(request, response);
			viewPage = "resource/page_1/joinAction.jsp";
		}
		
		// -- [ 로그인 ] --
		// 로그인 화면
		else if(url.equals("/login.cc")) {
			System.out.println("<<< url ==> /login.cc >>>");
			viewPage = "resource/page_1/login.jsp";
		}
		
		// 로그인 처리
		else if(url.equals("/loginAction.cc")) {
			System.out.println("<<< url ==> /loginAction.cc >>>");
			
			service.loginAction(request, response);
			viewPage = "resource/page_1/loginAction.jsp";
		}
		
		// 로그아웃
		else if(url.equals("/logout.cc")) {
			System.out.println("<<< url ==> /logout.cc >>>");
			
			// 세션 삭제
			request.getSession().invalidate();
			viewPage = "index.jsp";
		}
		
		// -- [ 회원탈퇴 ] --
		// 회원탈퇴 - 인증화면
		else if(url.equals("/deleteCustomer.cc")) {
			System.out.println("<<< url ==> /deleteCustomer.cc >>>");

			viewPage = "resource/page_1/deleteCustomer.jsp";
		}
		
		else if(url.equals("/deleteCustomerAction.cc")) {
			System.out.println("<<< url ==> /deleteCustomerAction.cc >>>");
			
			service.deleteCustomerAction(request, response);
			viewPage = "resource/page_1/deleteCustomerAction.jsp";
		}
		
		// -- [ 회원수정 ] --
		// 회원정보 상세페이지
		else if(url.equals("/modifyDetailAction.cc")) {
			System.out.println("<<< url ==> /modifyDetailAction.cc >>>");
			
			service.modifyDetailAction(request, response);
			viewPage = "resource/page_1/modifyDetailAction.jsp";
		}
		
		// 회원수정 처리페이지
		else if(url.equals("/modifyCustomerAction.cc")) {
			System.out.println("<<< url ==> /modifyCustomerAction.cc >>>");
			
			service.modifyCustomerAction(request, response);
			viewPage = "resource/page_1/modifyCustomerAction.jsp";
		}
		
		// RequestDispatcher : 서블릿 또는 JSP 요청을 받은 후, 다른 컴포넌트로 요청을 위임하는 클래스이다.
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);	// forward는 url이 안 바뀜		// redirect는 url이 바뀜
		// forward는 주로 내부적인 페이지 이동에 사용되며, redirect는 외부로의 이동이나 새로운 요청이 필요한 경우에 사용됩니다.
	}
}