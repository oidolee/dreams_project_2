package pj.mvc.jsp.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import pj.mvc.jsp.service.GamesServiceImpl;

@WebServlet("*.gc")
public class GamesController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public GamesController() {
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		action(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

	public void action(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		// 한글 안깨지게 처리
		request.setCharacterEncoding("UTF-8");
		// 서비스 객체생성 자리
		GamesServiceImpl service = new GamesServiceImpl();
		String uri = request.getRequestURI();
		String contextPath = request.getContextPath(); // 플젝명
		String url = uri.substring(contextPath.length());
		String viewPage = "";
		// 드림즈게시판
		if (url.equals("/*.gc") || url.equals("/games.gc")) {
			viewPage = "/resource/page_3/games.jsp";
			service.gamesListAction(request, response);
			RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
			dispatcher.forward(request, response);
		}
		
		//게임일정 등록 화면
		else if (url.equals("/gamesInsert.gc")) {
			viewPage = "/resource/admin/games/games.jsp";
			
			service.teamListAction(request, response);
			RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
			dispatcher.forward(request, response);
		}
		//게임일정 등록 실행		
		if (url.equals("/gamesInsertAction.gc")) {
			viewPage = "/resource/admin/games/gamesInsertAction.jsp";
			
			service.gamesInsertAction(request, response);
			RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
			dispatcher.forward(request, response);
		}
		
		//게임일정 업데이트 화면
		else if (url.equals("/update.gc")) {
			viewPage = "/resource/admin/games/update.jsp";
						
			service.getDetail(request, response);
			service.teamListAction(request, response);
			
			RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
			dispatcher.forward(request, response);
		}
		
		//게임일정 업데이트 실행
		else if (url.equals("/updateAction.gc")) {
			viewPage = "/resource/admin/games/gamesUpdateAction.jsp";
						
			service.gamesUpdateAction(request, response);
			RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
			dispatcher.forward(request, response);
		}
		
		
		
		//게임일정 삭제
		else if (url.equals("/deleteGames.gc")) {
			viewPage = "/resource/page_3/deleteGamesAction.jsp";
			
			service.deleteGamesAction(request, response);
			RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
			dispatcher.forward(request, response);
		}
	}

}
