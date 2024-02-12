package pj.mvc.jsp.service;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import pj.mvc.jsp.dao.CustomerDAO;
import pj.mvc.jsp.dao.CustomerDAOImpl;
import pj.mvc.jsp.dto.CustomerDTO;
import pj.mvc.jsp.page.Paging_customer;

/* 작업자 : 윤석무 */
public class CustomerServiceImpl implements CustomerService {

	// ID 중복확인 처리
	@Override
	public void idConfirmAction(HttpServletRequest req, HttpServletResponse res) 
			throws ServletException, IOException {
		System.out.println("서비스 - idConfirmAction");
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
		dto.setCust_Id(req.getParameter("userid"));
		
		// 비밀번호
		dto.setCust_Password(req.getParameter("userpwd"));
		
		// 이름
		dto.setCust_Name(req.getParameter("username"));
		
		// 생년월일
		dto.setCust_Birth(req.getParameter("birthday"));
		
		// 주소
		String address = "";
		// String address1 = req.getParameter("address1");
		// String address2 = req.getParameter("address2");
		String address1 = "서울시 용산구 효창동 ";
		String address2 = "드림즈아파트 102동 303호";
		address = address1 + address2;
		dto.setCust_Address(address);
		
		
		// 연락처
		// phone는 필수가 아니므로 null값이 들어올 수 있으므로 값이 존재함
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
		System.out.println("서비스 - loginAction()");
		
		// 3단계. 화면에서 입력받은 값을 가져온다.
		String strId = req.getParameter("userid");
		String strPassword = req.getParameter("userpwd");
		
		// 4단계. 싱글톤방식으로 DAO 객체 생성, 다형성 적용
		CustomerDAO dao = CustomerDAOImpl.getInstance();
		
		// 5단계. 로그인 처리
		int selectCnt = dao.idPasswordChk(strId, strPassword);
		
		// 로그인 성공시 세션ID를 설정
		if(selectCnt == 1) {
			HttpSession session = req.getSession();
			session.setAttribute("sessionID", strId);
			// req.getSession().setAttribute("sessionID", strId);  // 한방에 처리 가능
		}
	
		// 6단계. jsp로 처리결과 전달
		// req.setAttribute("selectCnt", selectCnt);	// 세션으로 로그인 여부 판단
	}
	
	// 회원정보 인증처리 및 탈퇴 처리
	@Override
	public void deleteCustomerAction(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		System.out.println("서비스 - deleteCustomerAction()");
		
		// 3단계. 화면에서 입력받은 값을 가져온다.
		String strId = (String)req.getSession().getAttribute("sessionID");
		String strPassword = req.getParameter("userpwd");
		
		// 4단계. 싱글톤방식으로 DAO 객체 생성, 다형성 적용
		CustomerDAO dao = CustomerDAOImpl.getInstance();
		
		// 5-1단계. 회원인증처리
		int selectCnt = dao.idPasswordChk(strId, strPassword);
		// 회원인증 성공시
		int deleteCnt = 0;
		
		if(selectCnt == 1) {
			// 5-2단계. 회원탈퇴 처리
			deleteCnt = dao.deleteCustomer(strId);
			req.getSession().invalidate();
		}
		
		// 6단계. jsp로 처리결과 전달
		req.setAttribute("deleteCnt", deleteCnt);
	}

	// 회원정보 상세페이지
	@Override
	public void modifyDetailAction(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		System.out.println("서비스 - modifyDetailAction()");
		
		// 3단계. 화면에서 입력받은 값을 가져와서 DTO의 setter로 값 전달
		String strId = (String)req.getSession().getAttribute("sessionID");
		
		// 4단계. 싱글톤방식으로 DAO 객체 생성, 다형성 적용
		CustomerDAO dao = CustomerDAOImpl.getInstance();
		
		// 5단계. 회원상세페이지
		CustomerDTO dto = dao.getCustomerDetail(strId);
		
		// 6단계. jsp로 처리결과 전달
		req.setAttribute("dto", dto);
	}

	// 회원정보 수정 처리
	@Override
	public void modifyCustomerAction(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		System.out.println("서비스 - modifyCustomerAction()");
		
		// 3단계. 화면에서 입력받은 값을 가져와서 DTO의 setter로 값 전달
		CustomerDTO dto = new CustomerDTO();
		
		// 아이디 id 는 세션ID
		dto.setCust_Id((String)req.getSession().getAttribute("sessionID"));
		
		// 이름
		dto.setCust_Name(req.getParameter("username"));
		// 비밀번호
		dto.setCust_Password(req.getParameter("userpwd"));
		
		// 생년월일
		dto.setCust_Birth(req.getParameter("birthday"));
		
		// 주소
		String address = "";
		String address1 = req.getParameter("address1");
		String address2 = req.getParameter(" "+"address2");
		address = address1 + address2;
		dto.setCust_Address(address);
		
		// 연락처
		// phone는 필수가 아니므로 null값이 들어올 수 있으므로 값이 존재함
		String phone = "";
		String phone1 = req.getParameter("phone1");
		String phone2 = req.getParameter("phone2");
		String phone3 = req.getParameter("phone3");
		
		if(phone1 != null && phone2 != null && phone3 != null) {
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
		int updateCnt = dao.updateCustomer(dto);
		
		// 6단계. jsp로 처리결과 전달
		req.setAttribute("updateCnt", updateCnt);
	}
	
	
	
	// 관리자모드 - 회원 전체 조회
	@Override
	public void customerListAll(HttpServletRequest req, HttpServletResponse res) 
			throws ServletException, IOException {
		System.out.println("서비스 - customerListAll()");
		
		// 3단계. 화면에서 입력받은 값을 가져온다.
		String pageNum = req.getParameter("pageNum");
		
		// 4단계. 싱글톤방식으로 DAO 객체 생성, 다형성 적용
		CustomerDAO dao = CustomerDAOImpl.getInstance();
		
		// 5단계. 회원상세페이지
		// 5-1단계. 전체 회원 갯수 카운트
		Paging_customer paging = new Paging_customer(pageNum);
		int total = dao.CustomerCnt(null);
		
		paging.setTotalCount_cust(total);
		
		// 5-2단계. 회원 목록 조회
		int start = paging.getStartRow();
		int end = paging.getEndRow();
		
		List<CustomerDTO> list = dao.SelectCustomer(start, end);
		
		// 6단계. jsp로 처리결과 전달
		req.setAttribute("paging", paging);
		req.setAttribute("list", list);
	}
	
	// 관리자모드 - 회원 상세 정보
	@Override
	public void admin_modifyDetailAction(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		System.out.println("서비스 - admin_modifyDetailAction()");
		
		// 3단계. 화면에서 입력받은 값을 가져와서 DTO의 setter로 값 전달
		int num = (Integer.parseInt(req.getParameter("cust_No")));
		
		// 4단계. 싱글톤방식으로 DAO 객체 생성, 다형성 적용
		CustomerDAO dao = CustomerDAOImpl.getInstance();
		
		// 5단계. 회원상세페이지
		CustomerDTO dto = dao.admin_getCustomerDetail(num);
		
		// 6단계. jsp로 처리결과 전달
		req.setAttribute("dto", dto);
	}
	
	
	// 관리자모드 - 회원 상세 정보 - 계정복구	
	@Override
	public void admin_recoverCustomerAction(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		System.out.println("서비스 - admin_recoverCustomerAction()");

		// 3단계. jQuery에서 입력받은 값을 가져온다.
		int cust_No = Integer.parseInt(req.getParameter("cust_No"));
		
		// 4단계. 싱글톤방식으로 DAO 객체 생성, 다형성 적용
		CustomerDAO dao = CustomerDAOImpl.getInstance();
		
		// 5단계. 회원상세페이지
		int updateCnt = dao.admin_recoverCustomer(cust_No);
		
		// 6단계. jsp로 처리결과 전달
		req.setAttribute("updateCnt", updateCnt);
	}

	
	// 관리자모드 - 회원 상세 정보 - 계정삭제
	@Override
	public void admin_suspendCustomerAction(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		System.out.println("서비스 - admin_suspendCustomerAction()");
		
		// 3단계. jQuery에서 입력받은 값을 가져온다.
		int cust_No = Integer.parseInt(req.getParameter("cust_No"));
		
		// 4단계. 싱글톤방식으로 DAO 객체 생성, 다형성 적용
		CustomerDAO dao = CustomerDAOImpl.getInstance();
		
		// 5단계. 회원상세페이지
		int deleteCnt = dao.admin_suspendCustomer(cust_No);
		req.getSession().invalidate();
		
		// 6단계. jsp로 처리결과 전달
		req.setAttribute("deleteCnt", deleteCnt);
	}
	
	
	// 관리자모드 - 회원 상세 정보 - 영구삭제
	@Override
	public void admin_deleteCustomerAction(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		System.out.println("서비스 - admin_deleteCustomerAction()");
		
		// 3단계. jQuery에서 입력받은 값을 가져온다.
		int cust_No = Integer.parseInt(req.getParameter("cust_No"));
		
		// 4단계. 싱글톤방식으로 DAO 객체 생성, 다형성 적용
		CustomerDAO dao = CustomerDAOImpl.getInstance();
		
		// 5단계. 회원상세페이지
		int deleteCnt = dao.admin_deleteCustomer(cust_No);
		req.getSession().invalidate();
		
		// 6단계. jsp로 처리결과 전달
		req.setAttribute("deleteCnt", deleteCnt);
	}
}