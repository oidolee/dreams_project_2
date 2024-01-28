package pj.mvc.jsp.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface ProductService {
	
	
	
	// 상품 목록
	public void productListAction(HttpServletRequest req, HttpServletResponse res)
		throws ServletException, IOException;

	
	// 상품 추가
	public void productInsertAction(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException;
}