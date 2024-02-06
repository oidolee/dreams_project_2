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
			dataSource = (DataSource)context.lookup("java:comp/env/jdbc/dreams_project_2");	// lookup : 검색
		} catch(NamingException e) {
			e.printStackTrace();
		}
	}

	// ID 중복확인 처리
	@Override
	public int useridCheck(String strUserid) {
		System.out.println("CustomerDAOImpl - useridCheck");
		
		int selectCnt = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = dataSource.getConnection();
			String sql = "SELECT * FROM DR_customers WHERE cust_Id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, strUserid);
			
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
		
		int insertCnt = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = dataSource.getConnection();
			String sql = "INSERT INTO DR_customers(cust_Id, cust_Name, cust_Password, cust_Email, cust_Birth, cust_Phone, cust_Address) "
					+ " VALUES(?, ?, ?, ?, ?, ?, ?) ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getCust_Id());
			pstmt.setString(2, dto.getCust_Name());
			pstmt.setString(3, dto.getCust_Password());
			pstmt.setString(4, dto.getCust_Email());
			pstmt.setString(5, dto.getCust_Birth());
			pstmt.setString(6, dto.getCust_Phone());
			pstmt.setString(7, dto.getCust_Address());
			System.out.println("query : "  + pstmt.toString() );
			insertCnt = pstmt.executeUpdate();
			System.out.println("insertCnt : " + insertCnt);
			
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch(SQLException e) {
				e.printStackTrace();
			}
		}
		return insertCnt;
	}

	// 로그인 처리 / 회원정보 인증(수정, 탈퇴)
	@Override
	public int idPasswordChk(String strId, String strPassword) {
		System.out.println("CustomerDAOImpl - idPasswordChk");
		
		int selectCnt = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = dataSource.getConnection();
			String sql = "SELECT * FROM DR_customers WHERE cust_Id=? and cust_password=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, strId);
			System.out.println(strId);
			pstmt.setString(2, strPassword);
			System.out.println(strPassword);
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

	// 회원 탈퇴 처리
	@Override
	public int deleteCustomer(String strId) {
		
		System.out.println("CustomerDAOImpl - deleteCustomer");
		
		int deleteCnt = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = dataSource.getConnection();
			String sql ="UPDATE DR_customers "
					+ "SET show = 'n' "
					+ "WHERE cust_Id = ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, strId);
			
			deleteCnt = pstmt.executeUpdate();
			System.out.println("updateCnt : " + deleteCnt);
		
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch(SQLException e) {
				e.printStackTrace();
			}
		}
		return deleteCnt;
	}

	// 회원 상세페이지
	@Override
	public CustomerDTO getCustomerDetail(String strId) {
		System.out.println("CustomerDAOImpl - getCustomerDetail");
		
		// 1. customerDTO 바구니 생성
		CustomerDTO dto = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		
		try {
			conn = dataSource.getConnection();
			// 2. strId(로그인화면에서 입력받은 세션 ID)와 일치하는 데이터가 존재하는지 확인
			String sql = "SELECT * FROM DR_customers WHERE cust_Id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, strId);

			rs = pstmt.executeQuery();
			
			// 3. ResultSet에 userid와 일치하는 한사람의 회원정보가 존재하면
			if(rs.next()) {
				// ResultSet을 읽어서 customerDTO에 setter로 담는다.
				dto = new CustomerDTO();
				dto.setCust_Id(rs.getString("cust_Id"));
				dto.setCust_Password(rs.getString("cust_Password"));
				dto.setCust_Name(rs.getString("cust_Name"));
				dto.setCust_Birth(rs.getString("cust_Birth"));
				dto.setCust_Address(rs.getString("cust_Address"));
				dto.setCust_Phone(rs.getString("cust_Phone"));
				dto.setCust_Email(rs.getString("cust_Email"));
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
		return dto;
	}

	// 회원정보 수정 처리
	@Override
	public int updateCustomer(CustomerDTO dto) {
		System.out.println("CustomerDAOImpl - updateCustomer");
		
		int updateCnt = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = dataSource.getConnection();
			String sql = "UPDATE DR_customers SET cust_Name = ?, cust_Password = ?, cust_Email = ?, "
							+ "cust_Birth = ?, cust_Phone = ?, cust_Address = ? "
							+ "WHERE cust_Id = ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getCust_Name());
			pstmt.setString(2, dto.getCust_Password());
			pstmt.setString(3, dto.getCust_Email());
			pstmt.setString(4, dto.getCust_Birth());
			pstmt.setString(5, dto.getCust_Phone());
			pstmt.setString(6, dto.getCust_Address());
			pstmt.setString(7, dto.getCust_Id());
			
			updateCnt = pstmt.executeUpdate();
			System.out.println("updateCnt : " + updateCnt);
		
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch(SQLException e) {
				e.printStackTrace();
			}
		}
		return updateCnt;
	}
}
