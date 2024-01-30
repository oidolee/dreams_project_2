package pj.mvc.jsp.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import pj.mvc.jsp.service.BoardService;
import pj.mvc.jsp.service.BoardServiceImpl;

/* 작업자 : 강승재 */
@WebServlet("*.bc")
public class BoardController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
    public BoardController() {
        super();
    }

    // 1단계. 웹브라우저가 전송한 HTTP 요청을 받음
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
		
		// 2. 클라이언트 요청을 분석
		
		// 한글 안깨지게 처리
		request.setCharacterEncoding("UTF-8");
		String viewPage = "";
		//서비스 객체생성 자리
		BoardService service = new BoardServiceImpl();
		
		String uri = request.getRequestURI();
		
		String contextPath = request.getContextPath();	// 플젝명
		
		String url = uri.substring(contextPath.length());
		
		// 드림즈게시판
		if(url.equals("/*.bc") || url.equals("/dreamsBoard.bc")) {
			System.out.println("<<< url ==> /dreamsBoard.bc >>>");
			
			service.boardListAction(request, response);
			viewPage = "resource/page_4/dreamsBoard.jsp";
			
			HttpSession session = request.getSession();
			session.setAttribute("sessionID", "로그인된 아이디");
			
			// RequestDispatcher : 서블릿 또는 JSP 요청을 받은 후, 다른 컴포넌트로 요청을 위임하는 클래스이다.
			RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
			dispatcher.forward(request, response);
			
		}
		
		// 상세페이지
		if(url.equals("/dreamsBoardDetail.bc")) {
			System.out.println("<<< url ==> /dreamsBoardDetail.bc >>>");
			
			service.boardDetailAction(request, response);
			viewPage = "resource/page_4/dreamsBoardDetail.jsp";
			
			// RequestDispatcher : 서블릿 또는 JSP 요청을 받은 후, 다른 컴포넌트로 요청을 위임하는 클래스이다.
			RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
			dispatcher.forward(request, response);
		}
		
		
		// 드림즈게시판 글쓰기페이지
		else if(url.equals("/dreamsBoardWrite.bc")) {
			System.out.println("<<< url ==> /dreamsBoardWrite.bc >>>");
			viewPage = "resource/page_4/dreamsBoardWrite.jsp";
			
			// RequestDispatcher : 서블릿 또는 JSP 요청을 받은 후, 다른 컴포넌트로 요청을 위임하는 클래스이다.
			RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
			dispatcher.forward(request, response);
		}
		
		// 드림즈게시판 글쓰기 처리
		else if(url.equals("/dreamsBoardAction.bc")) {
			System.out.println("<<< url ==> /dreamsBoardAction.bc >>>");
			
			service.boardWrite(request, response);
			
			viewPage = request.getContextPath() + "/dreamsBoard.bc";
			response.sendRedirect(viewPage);
		}
		
		// 드림즈게시판 게시글 수정페이지
		else if(url.equals("/dreamsBoardEdit.bc")) {
			System.out.println("<<< url ==> /dreamsBoardEdit.bc >>>");
			
			service.boardDetailAction(request, response);
			
			viewPage = "resource/page_4/dreamsBoardEdit.jsp";
			
			// RequestDispatcher : 서블릿 또는 JSP 요청을 받은 후, 다른 컴포넌트로 요청을 위임하는 클래스이다.
			RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
			dispatcher.forward(request, response);
		}
		
		// 드림즈게시판 게시글 수정처리
		else if(url.equals("/dreamsBoardEditAction.bc")) {
			System.out.println("<<< url ==> /dreamsBoardEditAction.bc >>>");
			
			service.boardEdit(request, response);
			int board_No = Integer.parseInt(request.getParameter("board_No"));
			
			viewPage = request.getContextPath() + "/dreamsBoardDetail.bc?board_No="+board_No;
			response.sendRedirect(viewPage);
		}
		
		// 드림즈게시판 게시글 삭제처리
		else if(url.equals("/dreamsBoardDelete.bc")) {
			System.out.println("<<< url ==> /dreamsBoardDelete.bc >>>");
			
			service.boardDelete(request, response);
			
			viewPage = request.getContextPath() + "/dreamsBoard.bc";
			response.sendRedirect(viewPage);
		}
		
		// 드림즈게시판 검색페이지
		else if(url.equals("/dreamsBoardSearch.bc")) {
			System.out.println("<<< url ==> /dreamsBoardSearch.bc >>>");
			
			service.boardSearch(request, response);
			viewPage = "resource/page_4/dreamsBoardSearch.jsp";
			
			// RequestDispatcher : 서블릿 또는 JSP 요청을 받은 후, 다른 컴포넌트로 요청을 위임하는 클래스이다.
			RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
			dispatcher.forward(request, response);
		}
		
		
	}

}
