package pj.mvc.jsp.service;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pj.mvc.jsp.dao.BoardDAO;
import pj.mvc.jsp.dao.BoardDAOImpl;
import pj.mvc.jsp.dto.BoardDTO;
import pj.mvc.jsp.page.Paging;

/* 작업자 : 강승재 */

public class BoardServiceImpl implements BoardService{

	// 게시글 목록
	@Override
	public void boardListAction(HttpServletRequest req, HttpServletResponse res) 
			throws ServletException, IOException {
		System.out.println("서비스 - boardListAction");
		
		// 3단계. 화면에서 입력받은 값을 가져온다.
		String pageNum = req.getParameter("pageNum");
		
		// 4단계. 싱글톤방식으로 DAO 객체 생성, 다형성 적용
		BoardDAO dao = BoardDAOImpl.getInstance();
		
		// 5-1단계. 전체 게시글 갯수 카운트
		Paging paging = new Paging(pageNum);
		int total = dao.boardCnt();
		System.out.println("total : " + total);
		
		paging.setTotalCount(total);
		
		// 5-2단계. 게시글 목록 조회
		int start = paging.getStartRow();
		int end = paging.getEndRow();
		
		System.out.println("start : " + start);
		System.out.println("end : " + end);
		
		List<BoardDTO> list = dao.boardList(start, end);
		
		// 6단계. jsp로 처리결과를 전달
		req.setAttribute("paging", paging);
		req.setAttribute("list", list);
		
	}

	// 게시글 상세
	@Override
	public void boardDetailAction(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		System.out.println("서비스 - boardDetailAction");
		
		// 3단계. get방식으로 전달받은 값을 가져온다.
		int boardNo = Integer.parseInt(req.getParameter("board_No"));
		
		// 4단계. 싱글톤방식으로 DAO 객체 생성, 다형성 적용
		BoardDAO dao = BoardDAOImpl.getInstance();
		
		// 5단계. 상세페이지
		BoardDTO dto = dao.getBoardDetail(boardNo);
		
		// 6단계. jsp로 처리결과를 전달
		req.setAttribute("dto", dto);
		
	}

	// 게시글 추가
	@Override
	public void boardWrite(HttpServletRequest req, HttpServletResponse res) 
			throws ServletException, IOException {
		System.out.println("서비스 - boardWrite");
		
		// 3단계. get방식으로 전달받은 값을 dto에 담는다.
		BoardDTO dto = new BoardDTO();
		dto.setBoard_Title(req.getParameter("writeTitle"));
		dto.setBoard_Content(req.getParameter("writeTextarea"));
		
		// 4단계. 싱글톤방식으로 DAO 객체 생성, 다형성 적용
		BoardDAO dao = BoardDAOImpl.getInstance();
		
		// 5단계. 상세페이지
		 dao.insertBoard(dto);
		
	}

}
