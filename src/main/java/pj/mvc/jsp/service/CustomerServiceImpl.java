package pj.mvc.jsp.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CustomerServiceImpl implements CustomerService {
	
	// ID 중복확인 처리
	@Override
	public void idConfirmAction(HttpServletRequest req, HttpServletResponse res) 
			throws ServletException, IOException {
		
	}
	
	// 회원가입 처리
	@Override
	public void signInAction(HttpServletRequest req, HttpServletResponse res) 
			throws ServletException, IOException {
		
	}
	
	// 로그인 처리 / 회원정보 인증(수정, 탈퇴)
	@Override
	public void loginAction(HttpServletRequest req, HttpServletResponse res) 
			throws ServletException, IOException {
		
	}
	
	// 회원정보 인증처리 및 탈퇴 처리
	@Override
	public void deleteCustomerAction(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		
	}
	
	// 회원정보 인증처리 및 상세페이지
	@Override
	public void modifyDetailAction(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		
	}
	
	// 회원정보 수정 처리
	@Override
	public void modifyCustomerAction(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		
	}

}
