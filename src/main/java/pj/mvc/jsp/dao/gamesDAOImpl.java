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

import pj.mvc.jsp.dto.TeamDTO;
import pj.mvc.jsp.dto.gamesDTO;

public class gamesDAOImpl implements gamesDAO {
	// 커넥션 풀 객체를 보관
	private DataSource dataSource;
	
	// 싱글톤 객체 생성
	private static gamesDAOImpl instance = new gamesDAOImpl();
	public static gamesDAOImpl getInstance() {
		if(instance == null)
			instance = new gamesDAOImpl();
		
		return instance;
	}
	
	public gamesDAOImpl() {
		try {
			Context context = new InitialContext();
			dataSource = (DataSource) context.lookup("java:comp/env/jdbc/mysql");
		} catch(NamingException e) {
			e.printStackTrace();
		}
	}
	
	//경기 일정 출력
	public List<gamesDTO> selectGamesList() {
		System.out.println("gamesDAOImpl - selectGamesList");
		List<gamesDTO> list = null;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			list = new ArrayList<>();
			conn = dataSource.getConnection();
			String sql = "SELECT * FROM DR_Gemes";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				gamesDTO dto = new gamesDTO();
				dto.setDG_No(rs.getInt("DG_No"));
				dto.setDG_Home(rs.getString("dG_Home"));
				dto.setDG_Away(rs.getString("dG_Away"));
				dto.setDG_Location(rs.getString("dG_Location"));
				dto.setDG_Time(rs.getTimestamp("dG_Time"));
				list.add(dto);
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	//팀 내역 출력
	public List<TeamDTO> selectTeamList() {
		List<TeamDTO> list = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			list = new ArrayList<>();
			conn = dataSource.getConnection();
			String sql = "SELECT * FROM DR_KBOTeams";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				TeamDTO dto = new TeamDTO();
				dto.setDK_No(rs.getInt("dK_No"));
				dto.setDK_TeamName(rs.getString("DK_TeamName"));
				dto.setDK_Location(rs.getString("DK_Location"));
				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
}
