package pj.mvc.jsp.service;

import java.io.IOException;
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
		System.out.println(" GamesServiceImpl gamesListAction - start");
		gamesDAOImpl dao = gamesDAOImpl.getInstance();
		
		List<gamesDTO> list = dao.selectGamesList();
		System.out.println(" GamesServiceImpl gamesListAction list.toString() : " + list.toString());
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
		
	}

}
