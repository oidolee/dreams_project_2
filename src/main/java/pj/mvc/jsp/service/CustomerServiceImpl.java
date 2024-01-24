package pj.mvc.jsp.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pj.mvc.jsp.dao.CustomerDAO;
import pj.mvc.jsp.dao.CustomerDAOImpl;
import pj.mvc.jsp.dto.CustomerDTO;

public class CustomerServiceImpl implements CustomerService  {

	// 실질적인 서비스작업
	
	// ID 중복확인 처리
	@Override
	public void idConfirmAction(HttpServletRequest req, HttpServletResponse res) 
			throws ServletException, IOException {
		
		// 3단계. 화면에서 입력받은 값을 가져와서 DTO의 setter로 값 전달
		String strUserid = req.getParameter("userid");
		
		// 4단계. 싱글톤방식으로 DAO 객체 생성, 다형성 적용
		CustomerDAO dao = CustomerDAOImpl.getInstance();
		
		// 5단계. 중복확인 처리
		int selectCnt = dao.useridCheck(strUserid);
		
		// 6단계. jsp로 처리결과 전달
		req.setAttribute("selectCnt", selectCnt);
		req.setAttribute("strUserid", strUserid);
	}
	
	// 회원가입 처리
	@Override
	public void signInAction(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		
		// 3단계. 화면에서 입력받은 값을 가져와서 DTO의 setter로 값 전달
		
		// DTO 생성
		CustomerDTO dto = new CustomerDTO();
		
		// 고객 아이디
		dto.setCust_Id(req.getParameter("cust_Id"));
		
		// 비밀번호
		dto.setCust_Password(req.getParameter("cust_Password"));
		
		// 이름
		dto.setCust_Name(req.getParameter("cust_Name"));
		
		// 생년월일
		dto.setCust_Birth(Integer.parseInt(req.getParameter("cust_Birth")));
		
		// 주소
		dto.setCust_Address(req.getParameter("cust_Address"));
		
		// 연락처
		// hp는 필수가 아니므로 null값이 들어올 수 있으므로 값이 존재함
		String phone = "";
		String phone1 = req.getParameter("phone1");
		String phone2 = req.getParameter("phone2");
		String phone3 = req.getParameter("phone3");
		
		if(!phone1.equals("") && !phone2.equals("") && !phone3.equals("")) {
			phone = phone1 + "-" + phone2 + "-" + phone3;
		}
		dto.setCust_Phone(phone);
		
		// 이메일
		String email = "";
		String email1 = req.getParameter("email1");
		String email2 = req.getParameter("email2");
		email = email1 + "@" + email2;
		dto.setCust_Email(email);
		
		// 4단계. 싱글톤방식으로 DAO 객체 생성, 다형성 적용
		CustomerDAO dao = CustomerDAOImpl.getInstance();
		
		// 5단계. 중복확인 처리
		int insertCnt = dao.insertCustomer(dto);
		
		// 6단계. jsp로 처리결과 전달
		req.setAttribute("insertCnt", insertCnt);	// key, value
	}
	
	// 로그인 처리 / 회원정보 인증(수정, 탈퇴)
	@Override
	public void loginAction(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		
		// 3단계. 화면에서 입력받은 값을 가져와서 DTO의 setter로 값 전달
		
		// 4단계. 싱글톤방식으로 DAO 객체 생성, 다형성 적용
		
		// 5단계. 중복확인 처리
		
		// 6단계. jsp로 처리결과 전달
	}
	
	// 회원정보 인증처리 및 탈퇴 처리
	@Override
	public void deleteCustomerAction(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		
		// 3단계. 화면에서 입력받은 값을 가져와서 DTO의 setter로 값 전달
		
		// 4단계. 싱글톤방식으로 DAO 객체 생성, 다형성 적용
		
		// 5단계. 중복확인 처리
		
		// 6단계. jsp로 처리결과 전달
	}

	// 회원정보 인증처리 및 상세페이지
	@Override
	public void modifyDetailAction(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		
		// 3단계. 화면에서 입력받은 값을 가져와서 DTO의 setter로 값 전달
		
		// 4단계. 싱글톤방식으로 DAO 객체 생성, 다형성 적용
		
		// 5단계. 중복확인 처리
		
		// 6단계. jsp로 처리결과 전달
	}

	
	// 회원정보 수정 처리
	@Override
	public void modifyCustomerAction(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		
		// 3단계. 화면에서 입력받은 값을 가져와서 DTO의 setter로 값 전달
		
		// 4단계. 싱글톤방식으로 DAO 객체 생성, 다형성 적용
		
		// 5단계. 중복확인 처리
		
		// 6단계. jsp로 처리결과 전달
	}
}