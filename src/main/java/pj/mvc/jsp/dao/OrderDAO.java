package pj.mvc.jsp.dao;

import java.util.List;

import pj.mvc.jsp.dto.OrderDTO;
import pj.mvc.jsp.dto.OrderDetailDTO;
import pj.mvc.jsp.dto.RefundDTO;

public interface OrderDAO {
	
	// 환불/교환 신청서 제출
	public int submissionRefund(RefundDTO dto);
	
	// 내 주문 조회
	public List<OrderDTO> OrderDetail(String cust_Id);
	
	// 교환/환불 신청 페이지 - 최근 구매한 상품
	public List<OrderDetailDTO> MyorderDetail(int REF_No);
	
	// 내 주문내역 - 구매확정 버튼
	public int confirmOrder(int order_No);
	
	// 교환/환불 신청서 확인 
	public List<RefundDTO> refundDetail(String REF_cust_Id);

}
