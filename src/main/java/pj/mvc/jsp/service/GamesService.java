package pj.mvc.jsp.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public interface GamesService {
	// 일정 목록
	public void gamesListAction(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException;
	//팀내역 출력 
	public void teamListAction(HttpServletRequest req, HttpServletResponse res) 
			throws ServletException, IOException;
	//게임일정 등록
	public void gamesInsertAction(HttpServletRequest req, HttpServletResponse res) 
			throws ServletException, IOException;
	//경기 일정 삭제
	public void deleteGamesAction(HttpServletRequest req, HttpServletResponse res) 
			throws ServletException, IOException;	
	//게임일정 상세내역
	public void getDetail(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException;
	//게임일정 수정
	public void gamesUpdateAction(HttpServletRequest req, HttpServletResponse res) 
			throws ServletException, IOException;
}
