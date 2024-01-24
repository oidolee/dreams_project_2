package pj.mvc.jsp.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import pj.mvc.jsp.dto.TicketDTO;

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
			dataSource = (DataSource)context.lookup("java:comp/env/jdbc/jsp_pj_ict02"); // 다운캐스팅 적용
			
		}catch(NamingException e) {
			
		}finally {
			
		}
		
	} // 외부에서 new를 못하게 디폴트 생성자를 private로 막는다
	// 티켓 조회
	@Override
	public TicketDTO ticketList(String strTicket_seat) {
		System.out.println("TicketDAOImpl - ticketList");
		
		TicketDTO tdto = new TicketDTO();
		
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = dataSource.getConnection();
			String sql = "SELECT * FROM DR_ticket "
					+ "WHERE ticket_seat = ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, strTicket_seat);
			
			rs = pstmt.executeQuery();
			
			tdto.setTicket_seat(rs.getString("ticket_seat"));
			tdto.setTicket_grade_normal(rs.getInt("ticket_grade_normal"));
			tdto.setTicket_grade_membership(rs.getInt("ticket_grade_membership"));
			tdto.setTicket_grade_child(rs.getInt("ticket_grade_childW"));
			
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
		return 0;
	}

	// 티켓 삭제
	@Override
	public int ticketDelete(TicketDTO tdto) {
		return 0;
	}
	
	// 티켓 추가
	public int ticketInsert(TicketDTO tdto) {
		return 0;
	}
}
