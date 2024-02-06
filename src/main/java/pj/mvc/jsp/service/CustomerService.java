package pj.mvc.jsp.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface CustomerService {
	
	// 작업 명세서
	
	// ID 중복확인 처리
	public void idConfirmAction(HttpServletRequest req, HttpServletResponse res) 
			throws ServletException, IOException;
		
	// 회원가입 처리
	public void signInAction(HttpServletRequest req, HttpServletResponse res) 
			throws ServletException, IOException;
	
	// 로그인 처리 / 회원정보 인증(수정, 탈퇴)
	public void loginAction(HttpServletRequest req, HttpServletResponse res) 
			throws ServletException, IOException;
	
	// 회원정보 인증처리 및 탈퇴 처리
	public void deleteCustomerAction(HttpServletRequest req, HttpServletResponse res) 
			throws ServletException, IOException;
	
	// 회원정보 인증처리 및 상세페이지 + 관리자모드 - 회원 상세 조회
	public void modifyDetailAction(HttpServletRequest req, HttpServletResponse res) 
			throws ServletException, IOException;
	
	// 회원정보 수정 처리
	public void modifyCustomerAction(HttpServletRequest req, HttpServletResponse res) 
			throws ServletException, IOException;
	
	// 관리자모드 - 회원 전체 조회
	public void customerListAll(HttpServletRequest req, HttpServletResponse res) 
			throws ServletException, IOException;
	
	
	
	// 회원상세 목록 - 영구삭제
	public void admin_deleteCustomerAction(HttpServletRequest req, HttpServletResponse res) 
			throws ServletException, IOException;
	
	
	
	
}