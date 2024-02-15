package pj.mvc.jsp.service;

import java.io.IOException;
import java.sql.Date;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import pj.mvc.jsp.dao.gamesDAOImpl;
import pj.mvc.jsp.dto.TeamDTO;
import pj.mvc.jsp.dto.gamesDTO;

public class GamesServiceImpl implements GamesService {
	// 일정 목록
	@Override
	public void gamesListAction(HttpServletRequest req, HttpServletResponse res) 
			throws ServletException, IOException {
		gamesDAOImpl dao = gamesDAOImpl.getInstance();
		
		List<gamesDTO> list = dao.selectGamesList();
		req.setAttribute("list", list);
	}
	
	//팀 목록 리스트 (관리자)
	public void teamListAction(HttpServletRequest req, HttpServletResponse res) 
			throws ServletException, IOException{
		gamesDAOImpl dao = gamesDAOImpl.getInstance();
		
		List<TeamDTO> list = dao.selectTeamList();
		System.out.println(" GamesServiceImpl teamListAction list.toString() : " + list.toString());
		req.setAttribute("list", list);
	}
	
	//경기 일정 삭제
	public void deleteGamesAction(HttpServletRequest req, HttpServletResponse res) 
			throws ServletException, IOException{
		gamesDAOImpl dao = gamesDAOImpl.getInstance();
		
		int DG_No = Integer.parseInt(req.getParameter("DG_No"));
		
		int deleteCnt = dao.deleteGames(DG_No);
		
		req.setAttribute("deleteCnt", deleteCnt);
		
	}

	//게임일정 등록
	public void gamesInsertAction(HttpServletRequest req, HttpServletResponse res) 
			throws ServletException, IOException{
		gamesDAOImpl dao = gamesDAOImpl.getInstance();
		
		gamesDTO dto = new gamesDTO();
		
		String DG_Home = req.getParameter("DG_Home"); 
		String DG_Away = req.getParameter("DG_Away"); 
		String DG_TimeString = req.getParameter("DG_Time");
		String DG_Location = dao.getLocation(DG_Home);
		dto.setDG_Home(DG_Home);
		dto.setDG_Away(DG_Away);
		dto.setDG_Location(DG_Location);
		
		if (DG_TimeString != null && !DG_TimeString.isEmpty()) {
			  // 'T'를 공백으로 대체
		    DG_TimeString = DG_TimeString.replace("T", " ");
		    

		    try {
		        // SimpleDateFormat을 사용하여 문자열을 Date로 변환
	    	  SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	          java.util.Date parsedDate = dateFormat.parse(DG_TimeString + ":00");
		        
		        java.sql.Timestamp DG_Time = new java.sql.Timestamp(parsedDate.getTime());

		        dto.setDG_Time(DG_Time);
		     
		    } catch (ParseException e) {
		        e.printStackTrace(); // 예외 처리
		    }
		    
		} else {
			// DG_TimeString이 null 처리
			DG_TimeString = null;
		}
		
		
		int insertCnt = dao.insertGames(dto); 
		
		req.setAttribute("insertCnt", insertCnt);
	}

	//게임일정 상세내역
	public void getDetail(HttpServletRequest req, HttpServletResponse res) 
			throws ServletException, IOException{
		
		gamesDAOImpl dao = gamesDAOImpl.getInstance();
		int DG_No = Integer.parseInt(req.getParameter("DG_No"));
		
		gamesDTO dto = dao.getDetail(DG_No);
		req.setAttribute("dto",dto);
	}
	
	//게임일정 수정
	public void gamesUpdateAction(HttpServletRequest req, HttpServletResponse res) 
			throws ServletException, IOException{
		gamesDAOImpl dao = gamesDAOImpl.getInstance();
		
		gamesDTO dto = new gamesDTO();
		
		
		int DG_No = Integer.parseInt(req.getParameter("DG_No")); 
		String DG_Home = req.getParameter("DG_Home"); 
		String DG_Away = req.getParameter("DG_Away"); 
		
		//String DG_TimeString = req.getParameter("DG_Time");
		String datePart = req.getParameter("datePart");
		String timePart = req.getParameter("timePart");
		
		String DG_TimeString = datePart+" " +timePart;
		
		String DG_Location = dao.getLocation(DG_Home);
		dto.setDG_No(DG_No);
		dto.setDG_Home(DG_Home);
		dto.setDG_Away(DG_Away);
		dto.setDG_Location(DG_Location);
		
		if (DG_TimeString != null && !DG_TimeString.isEmpty()) {
			  // 'T'를 공백으로 대체
		    DG_TimeString = DG_TimeString.replace("T", " ");
		    
		    try {
		        // SimpleDateFormat을 사용하여 문자열을 Date로 변환
	    	  SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	          java.util.Date parsedDate = dateFormat.parse(DG_TimeString + ":00");
		        
		        java.sql.Timestamp DG_Time = new java.sql.Timestamp(parsedDate.getTime());

		        dto.setDG_Time(DG_Time);
		     
		    } catch (ParseException e) {
		        e.printStackTrace(); // 예외 처리
		    }
		    
		} else {
			// DG_TimeString이 null 처리
			DG_TimeString = null;
		}
		
		int updateCnt = dao.updateGames(dto); 
		
		req.setAttribute("updateCnt", updateCnt);
		req.setAttribute("DG_No", DG_No);
		req.setAttribute("dto", dto);
		
	}

}


































