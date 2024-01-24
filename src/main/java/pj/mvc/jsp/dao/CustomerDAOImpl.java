package pj.mvc.jsp.dao;

import pj.mvc.jsp.dto.CustomerDTO;

public class CustomerDAOImpl implements CustomerDAO {

	// ID 중복확인 처리
	@Override
	public int cust_IdCheck(String cust_Id) {
		return 0;
	}

	// 회원가입 처리
	@Override
	public int insertCustomer(CustomerDTO dto) {
		return 0;
	}
	
	// 로그인 처리 / 회원정보 인증(수정, 탈퇴)
	@Override
	public int cust_IdPasswordChk(String cust_Id, String cust_Password) {
		return 0;
	}
	
	// 회원정보 인증처리 및 탈퇴 처리
	@Override
	public int deleteCustomer(String cust_Id) {
		return 0;
	}
	
	// 회원정보 인증처리 및 상세페이지
	@Override
	public CustomerDTO getCustomerDetail(String cust_Id) {
		return null;
	}
	
	// 회원정보 수정 처리
	@Override
	public int updateCustomer(CustomerDTO dto) {
		return 0;
	}

}
