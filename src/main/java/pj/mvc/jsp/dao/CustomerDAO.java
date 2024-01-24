package pj.mvc.jsp.dao;

import pj.mvc.jsp.dto.CustomerDTO;

public interface CustomerDAO {
	
	// ID 중복확인 처리
	public int useridCheck(String strUserId);
	
	// 회원가입 처리
	public int insertCustomer(CustomerDTO dto);
	
	// 로그인 처리 / 회원정보 인증(수정, 탈퇴)
	public int idPasswordChk(String strId, String strPassword);
	
	// 회원 탈퇴 처리
	public int deleteCustomer(String strId);
	
	// 회원 상세페이지
	public CustomerDTO getCustomerDetail(String strId);
	
	// 회원정보 수정 처리
	public int updateCustomer(CustomerDTO dto);
	
	
}
