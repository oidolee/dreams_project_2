package pj.mvc.jsp.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pj.mvc.jsp.dao.ProductDAO;
import pj.mvc.jsp.dao.ProductDAOImpl;
import pj.mvc.jsp.dto.ProductDTO;



public class ProductServiceImpl implements ProductService {
	
	// 상품 목록
	@Override
	public void productListAction(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		
	}
	// 상품 등록 처리
	@Override
	public void productInsertAction(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		System.out.println("서비스 - productInsertAction ");
		
		// 3단계. 화면에서 입력받은 값을 가져온다.
				// title, content, writer, password
				ProductDTO dto = new ProductDTO();
				dto.setProduct_No(Integer.parseInt(req.getParameter("product_No")));
				dto.setProduct_Name(req.getParameter("product_Name"));
				dto.setProduct_Price(Integer.parseInt(req.getParameter("product_Price")));
				dto.setProduct_Qty(Integer.parseInt(req.getParameter("product_Qty")));
				
				
				// 4단계. 싱글톤 방식으로 DAO 객체 생성, 다형성 적용
				ProductDAO dao = ProductDAOImpl.getInstance();
				
				// 5-1단계. 게시글 작성 처리 후 컨트롤러에서 list로 이동
				dao.insertProduct(dto);
				
				req.setAttribute("dto", dto);
				System.out.println(dto);
		
		
	}
	
	

}
