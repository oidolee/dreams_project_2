package pj.mvc.jsp.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface GamesService {
	// 일정 목록
	public void gamesListAction(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException;
}
