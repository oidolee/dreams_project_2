package pj.mvc.jsp.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

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
	
	
	// 내 주문 조회
	@Override
	public List<OrderDTO> OrderDetail(String cust_Id) {
		
		List<OrderDTO> list = new ArrayList<OrderDTO>();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = dataSource.getConnection();
			
			String sql = "SELECT * FROM DR_orders  ";
			//String sql = "SELECT * FROM DR_orders where cust_Id = ? ";
			
			pstmt = conn.prepareStatement(sql);
	        //pstmt.setString(1, cust_Id);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				OrderDTO dto = new OrderDTO();
				
				dto.setOrder_No(rs.getInt("order_No"));
				dto.setOrder_Content(rs.getString("order_Content"));
				dto.setOrder_Amount(rs.getInt("order_Amount"));
				dto.setOrder_Name(rs.getString("order_Name"));
				dto.setOrder_Phone(rs.getString("order_Phone"));
				dto.setOrder_Address(rs.getString("order_Address"));
				dto.setOrder_Date(rs.getString("order_Date"));
				dto.setOrder_Status(rs.getString("order_Status"));
				
				list.add(dto);
			}
			
		} catch(SQLException e) {
			
	         e.printStackTrace();
	       } finally {
	          try {
	             if(rs != null) rs.close();
	             if(pstmt != null) pstmt.close();
	             if(conn != null) conn.close();
	          } catch(SQLException e) {
	            e.printStackTrace();
	          }
	    }
		return list;
	}	
	
	
	
	
	
	
	
	// 선택한 주문을 환불신청서로 가져가기
	
	
	
	
	
	
	
	
}
