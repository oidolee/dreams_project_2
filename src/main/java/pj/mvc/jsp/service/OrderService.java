package pj.mvc.jsp.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface OrderService {
	
	// 주문 등록(고객)
	public void orderInsertAction(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException;
	
	// 주문 수정(고객)
	public void modifyOrderAction(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException;
	
	// 주문 취소(고객)
	public void cancelOrderAction(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException;
	
	// 주문 확인(고객)
	public void orderDetailAction(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException;
}
