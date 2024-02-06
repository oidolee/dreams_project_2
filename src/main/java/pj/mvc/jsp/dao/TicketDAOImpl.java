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

import pj.mvc.jsp.dto.CustomerDTO;
import pj.mvc.jsp.dto.TicketDTO;
import pj.mvc.jsp.dto.TicketResDTO;

public class TicketDAOImpl implements TicketDAO {

	DataSource dataSource = null;
	
	// 싱글톤 객체 생성
	private static TicketDAOImpl instance = new TicketDAOImpl(); // 객체 내 유일한 인스턴스 생성
	public static TicketDAOImpl getInstance() {
		if(instance == null) {
			instance = new TicketDAOImpl();
		}
		return instance;
	}
	
	// 디폴트 생성자
	/* 커넥션 풀(DBCP : DataBase Connection Pool 방식) - context.xml 에 설정 */
	private TicketDAOImpl() {
		
		try {
			Context context = new InitialContext();
			dataSource = (DataSource)context.lookup("java:comp/env/jdbc/dreams_project_2"); // 다운캐스팅 적용
			
		}catch(NamingException e) {
			
		}finally {
			
		}
		
	} // 외부에서 new를 못하게 디폴트 생성자를 private로 막는다
	// 티켓 전체 조회
	@Override
	public List<TicketDTO> ticketList(String strTicket_seat) {
		System.out.println("TicketDAOImpl - ticketList");
		List<TicketDTO> list = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = dataSource.getConnection();
			
			
			String sql = "SELECT * FROM DR_ticket ";
			
			
			pstmt = conn.prepareStatement(sql);
			/* pstmt.setString(1, strTicket_seat); */
			
			rs = pstmt.executeQuery();
			list = new ArrayList<>();
			while(rs.next()) {
				TicketDTO tdto = new TicketDTO();
				tdto.setTicket_seat(rs.getString("ticket_seat"));
				tdto.setTicket_grade_normal(rs.getInt("ticket_grade_normal"));
				tdto.setTicket_grade_membership(rs.getInt("ticket_grade_membership"));
				tdto.setTicket_grade_child(rs.getInt("ticket_grade_child"));
				
				list.add(tdto);
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
				if(rs != null) rs.close();
			}
			catch(SQLException e) {
				e.printStackTrace();
			}
		}
		
		
		return list;
		
	}
	// 티켓 예매 처리 - insert
	public int ticketRes(TicketResDTO trdto) {
		System.out.println("TicketDAOImpl - ticketInsert");
		Connection conn = null;
		PreparedStatement pstmt = null;
		int insertResCnt = 0;
		
		
		try {
			conn = dataSource.getConnection();
			
			
			String sql = "INSERT INTO DR_ticket_reservation (ticket_no, ticket_seat, cust_Id, game_date, purchase_date, ticket_price) "
					+ "VALUES((SELECT NVL(MAX(ticket_no) + 1, TO_NUMBER(TO_CHAR(SYSDATE, 'YYMMDD') || '0001')) FROM DR_ticket_reservation), ?, ?, ?, sysdate, ?);"
					;
					
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, trdto.getTicket_seat());
			pstmt.setString(2, trdto.getCust_Id());
			pstmt.setInt(3, trdto.getTicket_price());
			pstmt.setTimestamp(4, trdto.getGame_date());
			
			insertResCnt = pstmt.executeUpdate();
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
				
			}
			catch(SQLException e) {
				e.printStackTrace();
			}
		}
		return insertResCnt;
	}
	// 티켓 예매 확인 - select
	@Override
	public List<TicketResDTO> ResCheckTicket(String strId) {
		System.out.println("TicketDAOImpl - ticketList");
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<TicketResDTO> list = new ArrayList<>();
		
		try {
			conn = dataSource.getConnection();
			
			
			String sql = "SELECT * FROM DR_ticket_reservation WHERE cust_Id=?";
			
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, strId);
			
			rs = pstmt.executeQuery();
			
			
			while(rs.next()) {
				TicketResDTO trdto = new TicketResDTO();
				trdto.setTicket_no(rs.getInt("ticket_no"));
				trdto.setTicket_seat(rs.getString("ticket_seat"));
				trdto.setCust_Id(rs.getString("cust_Id"));
				trdto.setGame_date(rs.getTimestamp("game_date"));
				trdto.setPurchase_date(rs.getDate("purchase_date"));
				trdto.setTicket_price(rs.getInt("ticket_price"));
				
				list.add(trdto);
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
				if(rs != null) rs.close();
			}
			catch(SQLException e) {
				e.printStackTrace();
			}
		}
		
		
		return list;
		
	}
	
	// 티켓 개별 조회
	@Override
	public TicketDTO ticketEach(String strTicket_seat) {
		System.out.println("TicketDAOImpl - ticketList");
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		TicketDTO tdto = new TicketDTO();
		
		try {
			conn = dataSource.getConnection();
			
			
			String sql = "SELECT * FROM DR_ticket WHERE ticket_seat=?";
			
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, strTicket_seat);
			
			rs = pstmt.executeQuery();
			
			
			if(rs.next()) {
				tdto.setTicket_seat(strTicket_seat);
				tdto.setTicket_grade_normal(rs.getInt("ticket_grade_normal"));
				tdto.setTicket_grade_membership(rs.getInt("ticket_grade_membership"));
				tdto.setTicket_grade_child(rs.getInt("ticket_grade_child"));
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
				if(rs != null) rs.close();
			}
			catch(SQLException e) {
				e.printStackTrace();
			}
		}
		
		
		return tdto;
		
	}
	// 티켓 가격 수정
	@Override
	public int ticketUpdate(TicketDTO tdto) {
		System.out.println("TicketDAOImpl - ticketUpdate");
		Connection conn = null;
		PreparedStatement pstmt = null;
		int updateCnt = 0;
		
		
		try {
			conn = dataSource.getConnection();
			
			
			String sql = "UPDATE DR_ticket"
					+ "   SET ticket_grade_normal = ?, "
					+ "       ticket_grade_membership = ?,"
					+ "       ticket_grade_child = ? "
					+ " WHERE ticket_seat = ?";
					
			
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, tdto.getTicket_grade_normal());
			pstmt.setInt(2, tdto.getTicket_grade_membership());
			pstmt.setInt(3, tdto.getTicket_grade_child());
			pstmt.setString(4, tdto.getTicket_seat());
			
			System.out.println(tdto.getTicket_seat());
			System.out.println(tdto.getTicket_grade_normal());
			System.out.println(tdto.getTicket_grade_membership());
			System.out.println(tdto.getTicket_grade_child());
			
			updateCnt = pstmt.executeUpdate();
			System.out.println("updateCnt : " + updateCnt);
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
				
			}
			catch(SQLException e) {
				e.printStackTrace();
			}
		}
		return updateCnt;
	}

	// 티켓 삭제
	@Override
	public int ticketDelete(String strTicket_seat) {
		System.out.println("TicketDAOImpl - ticketDelete");
		Connection conn = null;
		PreparedStatement pstmt = null;
		int deleteCnt = 0;
		TicketDTO tdto = new TicketDTO();
		
		try {
			conn = dataSource.getConnection();
			
			
			String sql = "DELETE "
					+ "   FROM DR_ticket "
					+ " WHERE ticket_seat = ?";
					
			
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, strTicket_seat);
			
			
			deleteCnt = pstmt.executeUpdate();
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
				
			}
			catch(SQLException e) {
				e.printStackTrace();
			}
		}
		return deleteCnt;
	}
	
	// 티켓 추가
	public int ticketInsert(TicketDTO tdto) {
		System.out.println("TicketDAOImpl - ticketInsert");
		Connection conn = null;
		PreparedStatement pstmt = null;
		int insertCnt = 0;
		
		
		try {
			conn = dataSource.getConnection();
			
			
			String sql = "INSERT INTO DR_ticket (ticket_seat, ticket_grade_normal, ticket_grade_membership, ticket_grade_child)"
					+ "   VALUES(?, ?, ?, ?) ";
					
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, tdto.getTicket_seat());
			pstmt.setInt(2, tdto.getTicket_grade_normal());
			pstmt.setInt(3, tdto.getTicket_grade_membership());
			pstmt.setInt(4, tdto.getTicket_grade_child());
			
			
			insertCnt = pstmt.executeUpdate();
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
				
			}
			catch(SQLException e) {
				e.printStackTrace();
			}
		}
		return insertCnt;
	}
	
	// 회원정보 찾기
	@Override
	public CustomerDTO customerDetail(String srtId) {
		System.out.println("TicketDAOImpl - customerDetail");
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		CustomerDTO cdto = new CustomerDTO();
		
		try {
			conn = dataSource.getConnection();
			
			
			String sql = "SELECT * FROM DR_customers WHERE cust_Id=?";
			
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, srtId);
			
			rs = pstmt.executeQuery();
			
			
			if(rs.next()) {
				
				cdto.setCust_Name(rs.getString("cust_Name"));
				cdto.setCust_Birth(rs.getString("cust_Birth"));
				cdto.setCust_Phone(rs.getString("cust_Phone"));
				cdto.setCust_Email(rs.getString("cust_Email"));
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
				if(rs != null) rs.close();
			}
			catch(SQLException e) {
				e.printStackTrace();
			}
		}
		
		
		return cdto;
		
	}
}
