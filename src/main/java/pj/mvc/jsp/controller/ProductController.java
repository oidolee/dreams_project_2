package pj.mvc.jsp.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pj.mvc.jsp.service.ProductService;
import pj.mvc.jsp.service.ProductServiceImpl;
import pj.mvc.jsp.util.ImageUploadHandler;

@WebServlet("*.pc")
@MultipartConfig(location="D:\\dev\\workspace\\dreams_project_2\\src\\main\\webapp\\resource\\upload",
	fileSizeThreshold=1024*1024, maxFileSize=1024*1024*5, maxRequestSize=1024*1024*5*5)
public class ProductController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String IMG_UPLOAD_DIR= "D:\\dev\\workspace\\dreams_project_2\\src\\main\\webapp\\resource\\upload";
       
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
		ImageUploadHandler uploader = null;	// 작성
		
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
				
				//추가 : 서비스 호출전에 추가
				String contentType = request.getContentType();
				if(contentType != null && contentType.toLowerCase().startsWith("multipart/")) {
					uploader = new ImageUploadHandler();
					uploader.setUploadPath(IMG_UPLOAD_DIR);
					uploader.imageUpload(request, response);
				
				service.productInsertAction(request, response);
				
				viewPage = request.getContextPath() + "/product_list.pc";
				response.sendRedirect(viewPage);
				}
			}
			
			// 상품상세페이지 - 목록의 수정버튼 클릭시
			else if(url.equals("/detailProduct.pc")) { // 요청
				System.out.println("<<< url ==> /detailProduct.pc >>>");
				
				service.productDetailAction(request, response);
				viewPage = "resource/admin/product/detailProduct.jsp"; // 응답
				
				RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
				dispatcher.forward(request, response);
			}
			
		 
			// 상품 수정 처리
			else if(url.equals("/updateAction.pc")) { // 요청
				System.out.println("<<< url ==> /updateAction.pc >>>");
				
				//추가 : 서비스 호출전에 추가
				String contentType = request.getContentType();
				if(contentType != null && contentType.toLowerCase().startsWith("multipart/")) {
					uploader = new ImageUploadHandler();
					uploader.setUploadPath(IMG_UPLOAD_DIR);
					uploader.imageUpload(request, response);
				}
				
				service.productUpdateAction(request, response);
				viewPage = "resource/admin/product/updateAction.jsp"; // 응답
				
				RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
				dispatcher.forward(request, response);
			}
			
			// 상품상세페이지 - 목록의 수정버튼 클릭시
			else if(url.equals("/detailProduct.pc")) { // 요청
				System.out.println("<<< url ==> /detailProduct.pc >>>");
				
				service.productDetailAction(request, response);
				viewPage = "resource/admin/product/detailProduct.jsp"; // 응답
				
				RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
				dispatcher.forward(request, response);
			}
			// 상품삭제페이지
			else if(url.equals("/deleteProductAction.pc")) { // 요청
			System.out.println("<<< url ==> /deleteProductAction.pd >>>");
			
			service.productDeleteAction(request, response);
			viewPage = "resource/admin/product/deleteProductAction.jsp"; // 응답
			}
			
	}
}

