package pj.mvc.jsp.service;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pj.mvc.jsp.dao.OrderDAO;
import pj.mvc.jsp.dao.OrderDAOImpl;
import pj.mvc.jsp.dto.OrderDTO;
import pj.mvc.jsp.dto.RefundDTO;

public class OrderServiceImpl implements OrderService {
	
	// 내 주문내역 조회
	
	// 상품 환불/교환 신청서 제출
	@Override
	public void productRefundAction(HttpServletRequest req, HttpServletResponse res) 
			throws ServletException, IOException {
		System.out.println("productRefundAction");
		
		// 3단계. 화면에서 입력받은 값을 가져와서 DTO의 setter로 값 전달	
		// DTO 생성
		RefundDTO dto = new RefundDTO();
		System.out.println(dto);
		
		//
		// dto.setREF_No((Integer)req.getAttribute("REF_No"));
		// 주문번호(구매당시)
		dto.setOrder_No(Integer.parseInt(req.getParameter("order_No")));
		// 아이디
		dto.setREF_cust_Id(req.getParameter("REF_cust_Id"));
		// 이름
		dto.setREF_Name(req.getParameter("REF_Name"));
		// 연락처
		dto.setREF_Phone(req.getParameter("REF_Phone"));
		// 주소
		dto.setREF_Address(req.getParameter("REF_Address"));
		// 상품번호
		dto.setREF_Prod_No(Integer.parseInt(req.getParameter("REF_Prod_No")));
		// 상품명
		dto.setREF_Prod_Name(req.getParameter("REF_Prod_Name"));
		// 환불/교환 개수
		dto.setREF_Prod_qty(Integer.parseInt(req.getParameter("REF_Prod_qty")));
		// 환불/교환 사유
		dto.setREF_Reason(req.getParameter("REF_Reason"));
		// 환불 받을계좌
		String Account ="";
		String REF_Account2 = req.getParameter("REF_Account2");
		String REF_Account3 = req.getParameter("REF_Account3");
		Account = REF_Account2 + " " + REF_Account3;
		dto.setREF_Account(Account);
		// 환불/교환 신청일
		dto.setREF_Date(new Timestamp(System.currentTimeMillis()));
		// 상태 환불, 교환
		dto.setREF_Status(req.getParameter("REF_Status"));
		System.out.println(dto);
		// 4단계. 싱글톤방식으로 DAO 객체 생성, 다형성 적용
		OrderDAO dao = OrderDAOImpl.getInstance();
		
		// 5단계. 환불신청서 제출
		int insertCnt = dao.submissionRefund(dto);
		
		// 6단계. jsp로 처리결과 전달
		req.setAttribute("insertCnt", insertCnt);
		req.setAttribute("dto", dto);
		System.out.println(dto);
	}
	
	// 내 주문 조회
	@Override
	public void orderDetailAction(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		// 3단계. 값을 가져옴
		String cust_Id = "";
		
		// 4단계. 싱글톤 방식으로 DAO객체 생성, 다형성 적용
		OrderDAO dao = OrderDAOImpl.getInstance();
		
		// 5단계. 
		List<OrderDTO> list = dao.OrderDetail(cust_Id);
		
		// jsp로 처리결과 전달
		req.setAttribute("list", list);
	}
	
	
	
	
	
	// 주문 등록(고객)
	@Override
	public void orderInsertAction(HttpServletRequest req, HttpServletResponse res) 
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
