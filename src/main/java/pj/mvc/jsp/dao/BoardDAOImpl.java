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

import pj.mvc.jsp.dto.BoardDTO;

public class BoardDAOImpl implements BoardDAO{
	
	// 커넥션 풀 객체를 보관
	private DataSource dataSource;
	
	// 싱글톤 객체 생성
	private static BoardDAOImpl instance = new BoardDAOImpl();
	public static BoardDAOImpl getInstance() {
		if(instance == null)
			instance = new BoardDAOImpl();
		
		return instance;
	}
	
	// 디폴트생성자
	// 커넥션풀 연결
	private BoardDAOImpl() {
		try {
			Context context = new InitialContext();
			dataSource = (DataSource) context.lookup("java:comp/env/jdbc/dreams_project_2");
		} catch(NamingException e) {
			e.printStackTrace();
		}
	}
	

	@Override
	public List<BoardDTO> boardList(int start, int end) {
		System.out.println("BoardDAOImpl - boardList");
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		// 1. list 생성
		List<BoardDTO> list = new ArrayList<BoardDTO>();;
		
		try {
			conn = dataSource.getConnection();
			
			String sql= "SELECT * "
					+ "    FROM( "
					+ "        SELECT A.*, "
					+ "                rownum AS rn "   // 일련번호 가져오기 
					+ "            FROM "
					+ "                ( "
					+ "                 SELECT * FROM DR_board "
					+ "                    ORDER BY board_No DESC "
					+ "                ) A "
					+ "        ) "
					+ "WHERE rn BETWEEN ? AND ? ";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				// 2. dto 생성
				BoardDTO dto = new BoardDTO();
				
				// 3. dto에 1건의 rs 게시글 정보를 담는다.
				dto.setBoard_No(rs.getInt("board_No"));
				dto.setCust_Id(rs.getString("cust_Id"));
				dto.setBoard_Title(rs.getString("board_Title"));
				dto.setBoard_Content(rs.getString("board_Content"));
				dto.setBoard_Date(rs.getString("board_date"));
				
				// 4. list에 dto를 추가한다.
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
		
		// 5. list 리턴
		return list;
	}

	// 게시글 갯수 구하기
	@Override
	public int boardCnt() {
		System.out.println("BoardDAOImpl - boardCnt");
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int total = 0;
		
		try {
			conn = dataSource.getConnection();
			
			String sql= "SELECT COUNT(*) as cnt "
					+ "    FROM DR_board ";
			
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				total = rs.getInt("cnt");
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
		return total;
	}

	// 게시글 상세페이지
	@Override
	public BoardDTO getBoardDetail(int boardNo) {
		System.out.println("BoardDAOImpl - getBoardDetail");
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		BoardDTO dto = new BoardDTO();
		
		try {
			conn = dataSource.getConnection();
			
			String sql= "SELECT * FROM DR_board "
					+ "  WHERE board_No = ? ";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, boardNo);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dto.setBoard_No(rs.getInt("board_No"));
				dto.setCust_Id(rs.getString("cust_Id"));
				dto.setBoard_Title(rs.getString("board_Title"));
				dto.setBoard_Content(rs.getString("board_Content"));
				dto.setBoard_Date(rs.getString("board_Date"));
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
		return dto;
	}

	// 게시글 추가
	@Override
	public void boardWrite(BoardDTO dto) {
		System.out.println("BoardDAOImpl - boardWrite");
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = dataSource.getConnection();
			
			String sql = "INSERT INTO DR_board(board_No, cust_Id, board_Title, board_Content, board_Date) "
					+ "VALUES((SELECT NVL(MAX(board_No)+1, 1) FROM DR_board), ?, ?, ?, ?)";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getCust_Id());
			pstmt.setString(2, dto.getBoard_Title());
			pstmt.setString(3, dto.getBoard_Content());
			pstmt.setString(4, dto.getBoard_Date());
			
			pstmt.executeUpdate();
			
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
	}

	@Override
	public void boardEdit(BoardDTO dto) {
		System.out.println("BoardDAOImpl - boardEdit");
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = dataSource.getConnection();
			
			String sql = "UPDATE DR_board SET board_title = ?, board_Content = ? WHERE board_No = ?;";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getBoard_Title());
			pstmt.setString(2, dto.getBoard_Content());
			pstmt.setInt(3, dto.getBoard_No());
			
			pstmt.executeUpdate();
			
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
	}

}
