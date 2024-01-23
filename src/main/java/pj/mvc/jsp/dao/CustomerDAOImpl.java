package pj.mvc.jsp.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import pj.mvc.jsp.dto.CustomerDTO;

public class CustomerDAOImpl implements CustomerDAO {

	DataSource dataSource = null;
	
	// 싱글톤 객체 생성
	private static CustomerDAOImpl instance = new CustomerDAOImpl();
	
	public static CustomerDAOImpl getInstance() {
		if(instance == null) {
			instance = new CustomerDAOImpl();
		}
		return instance;
	}
	
	
	// 디폴트 생성자
	/* 커넥션 풀(DBCP : DataBase Connection Pool 방식) - context.xml에 설정 */
	private CustomerDAOImpl() {
		try {
			Context context = new InitialContext();
			dataSource = (DataSource)context.lookup("java:comp/env/jdbc/jdbc");	// lookup : 검색
		} catch(NamingException e) {
			e.printStackTrace();
		}
	}

	// ID 중복확인 처리
	@Override
	public int useridCheck(String strUserId) {
		System.out.println("CustomerDAOImpl - useridCheck");
		
		int selectCnt = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = dataSource.getConnection();
			String sql = "SELECT * FROM DR_customers WHERE cust_Id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, strUserId);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				selectCnt = 1;
			}
			
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
				if(rs != null) rs.close();
			} catch(SQLException e) {
				e.printStackTrace();
			}
		}
		return selectCnt;
	}

	// 회원가입 처리
	@Override
	public int insertCustomer(CustomerDTO dto) {
		System.out.println("CustomerDAOImpl - insertCustomer");
		
		return 0;
	}

	// 로그인 처리 / 회원정보 인증(수정, 탈퇴)
	@Override
	public int idPasswordChk(String strId, String strPassword) {
		return 0;
	}

	// 회원 탈퇴 처리
	@Override
	public int deleteCustomer(String strId) {
		return 0;
	}

	// 회원 상세페이지
	@Override
	public CustomerDTO getCustomerDetail(String strId) {
		return null;
	}

	// 회원정보 수정 처리
	@Override
	public int updateCustomer(CustomerDTO dto) {
		return 0;
	}
	
	
}
