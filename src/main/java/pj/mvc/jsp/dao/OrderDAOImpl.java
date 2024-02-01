package pj.mvc.jsp.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import pj.mvc.jsp.dto.OrderDTO;
import pj.mvc.jsp.dto.RefundDTO;


public class OrderDAOImpl implements OrderDAO {
	
	// 싱글톤 패턴
	private static OrderDAOImpl instance = new OrderDAOImpl();
	
	public static OrderDAOImpl getInstance() {
		if(instance == null) {
			instance = new OrderDAOImpl();
		}
		return instance;
	}
	
	// 커넥션 풀 객체를 보관
	private DataSource dataSource;
	
	// 커넥션 풀
	private OrderDAOImpl() {
		try {
			Context context = new InitialContext();
			dataSource = (DataSource) context.lookup("java:comp/env/jdbc/jsp_pj_ict02");
		} catch(NamingException e) {
			e.printStackTrace();
		}
	}

	
	
	// 환불 신청서 제출
	@Override
	public int submissionRefund(RefundDTO dto) {
		
		int insertCnt = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
	
		
		try {
			conn = dataSource.getConnection();
			String sql = "INSERT INTO DR_refund (REF_No, order_No, REF_cust_Id, REF_Name, REF_Phone, REF_Address, REF_Prod_No, REF_Prod_Name, REF_Prod_qty, REF_Reason, REF_Account, REF_Status) "
					+ "VALUES ((SELECT NVL(MAX(REF_No) + 1, TO_NUMBER(TO_CHAR(SYSDATE, 'YYYYMMDD') || '0001')) FROM DR_refund), ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?) ";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, dto.getOrder_No());
			pstmt.setString(2, dto.getREF_cust_Id());
			pstmt.setString(3, dto.getREF_Name());
			pstmt.setString(4, dto.getREF_Phone());
			pstmt.setString(5, dto.getREF_Address());
			pstmt.setInt(6, dto.getREF_Prod_No());
			pstmt.setString(7, dto.getREF_Prod_Name());
			pstmt.setInt(8, dto.getREF_Prod_qty());
			pstmt.setString(9, dto.getREF_Reason());
			pstmt.setString(10, dto.getREF_Account());
			pstmt.setString(11, dto.getREF_Status());
			
			insertCnt = pstmt.executeUpdate();
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
	
	
	
	
	
	// 주문 가져오기
	
	
	// 선택한 주문을 환불신청서로 가져가기
	
	
	
	
	
	
	
	
}
