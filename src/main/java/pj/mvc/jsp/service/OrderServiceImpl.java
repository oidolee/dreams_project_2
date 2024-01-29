package pj.mvc.jsp.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pj.mvc.jsp.dao.OrderDAO;
import pj.mvc.jsp.dao.OrderDAOImpl;
import pj.mvc.jsp.dto.RefundDTO;

public class OrderServiceImpl implements OrderService {
	
	// 내 주문내역 조회
	
	// 상품 환불/교환 신청서 제출
	@Override
	public void productRefund(HttpServletRequest req, HttpServletResponse res) 
			throws ServletException, IOException {
		// 3단계. 화면에서 입력받은 값을 가져와서 DTO의 setter로 값 전달	
		// DTO 생성
		RefundDTO dto = new RefundDTO();
		
		// 환불번호
		dto.getREF_No();
		
		// 주문번호(구매당시)
		int order_No = Integer.parseInt(req.getParameter("order_No"));
		
		// 아이디
		dto.getREF_cust_Id();
		
		// 이름
		dto.getREF_Name();
		
		// 연락처
		dto.getREF_Phone();
		
		// 주소
		dto.getREF_Address();
		
		// 상품번호
		dto.getREF_Prod_No();
		
		// 상품명
		dto.getREF_Prod_Name();
		
		// 환불/교환 개수
		dto.getREF_Prod_qty();
		
		// 환불/교환 사유
		dto.getREF_Reason();
		
		// 환불 받을계좌
		dto.getREF_Account();
		
		// 환불/교환 신청일
		dto.getREF_Date();
		
		// 상태 1: 환불, 2: 교환
		dto.getREF_isExchan();
		
		// 4단계. 싱글톤방식으로 DAO 객체 생성, 다형성 적용
		OrderDAO dao = OrderDAOImpl.getInstance();
		
		// 5단계. 환불신청서 제출
		dao.submissionRefund(dto);
			
	}
	
	
	
	
	
	
	
	// 주문 등록(고객)
	@Override
	public void orderInsertAction(HttpServletRequest req, HttpServletResponse res) 
			throws ServletException, IOException {
		
	}
	
	// 주문 확인(고객)
	@Override
	public void orderDetailAction(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		
	}
	
	// 주문 수정(고객)
	@Override
	public void modifyOrderAction(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		
	}
	
	// 주문 취소(고객)
	@Override
	public void cancelOrderAction(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		
	}
	
	// 배송 조회
	
	
	
	// 상품 환불
	
	// 상품 교환
	
	// 티켓 환불
	
	
}
