package pj.mvc.jsp.dao;

import pj.mvc.jsp.dto.CustomerDTO;

public interface CustomerDAO {
	// ID 중복확인 처리
	public int cust_IdCheck(String cust_Id);
	
	// 회원가입 처리
	public int insertCustomer(CustomerDTO dto);
	
	// 로그인 처리 / 회원정보 인증(수정, 탈퇴)
	public int cust_IdPasswordChk(String cust_Id, String cust_Password);
	
	// 회원정보 인증처리 및 탈퇴 처리
	public int deleteCustomer(String cust_Id);
	
	// 회원정보 인증처리 및 상세페이지
	public CustomerDTO getCustomerDetail(String cust_Id);
	
	// 회원정보 수정 처리
	public int updateCustomer(CustomerDTO dto);
}
