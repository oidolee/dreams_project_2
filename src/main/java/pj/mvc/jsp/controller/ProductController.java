package pj.mvc.jsp.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pj.mvc.jsp.service.ProductService;
import pj.mvc.jsp.service.ProductServiceImpl;

@WebServlet("*.pc")
public class ProductController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ProductController() {
        super();
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
			throws ServletException, IOException{
		
		// 2단계. 클라이언트의 요청을 분석
		
		// 한글 안깨지게 처리
		request.setCharacterEncoding("UTF-8");
		
		String viewPage= "";
		
		String uri = request.getRequestURI();
		String contextPath = request.getContextPath();
		String url = uri.substring(contextPath.length());
		
		ProductService service = new ProductServiceImpl();
		
		// 첫페이지 관리자 상품목록
			if(url.equals("/*.pc") || url.equals("/product_list.pc")) { // 요청
				System.out.println("<<< url ==> /*.pc >>>");
				
				service.productListAction(request, response);
				
				viewPage = "resource/admin/product/product.jsp"; // 응답
				
				RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
				dispatcher.forward(request, response);
			}
			
		// 상품 추가 화면
			if(url.equals("/insertProduct.pc")) { // 요청
				System.out.println("<<< url ==> /insertProduct.pc >>>");
				
				viewPage = "resource/admin/product/insertProduct.jsp";
				response.sendRedirect(viewPage);
			}
			
		// 상품 추가 처리
		
			if(url.equals("/insertProductAction.pc")) { // 요청
				System.out.println("<<< url ==> /insertProductAction.pc >>>");
				
				service.productInsertAction(request, response);
				
				viewPage = request.getContextPath() + "/product_list.pc";
				response.sendRedirect(viewPage);
			}
		
	}
}
