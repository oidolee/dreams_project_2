package pj.mvc.jsp.dao;

import pj.mvc.jsp.dto.OrderDTO;
import pj.mvc.jsp.dto.RefundDTO;

public interface OrderDAO {
	
	// 환불/교환 신청서 제출
	public int submissionRefund(RefundDTO dto);
	

}
