package pj.mvc.jsp.service;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pj.mvc.jsp.dao.BoardDAO;
import pj.mvc.jsp.dao.BoardDAOImpl;
import pj.mvc.jsp.dto.BoardDTO;
import pj.mvc.jsp.dto.Board_reviewDTO;
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
		dto.setCust_Id(req.getParameter("hidden_Id"));
		dto.setBoard_Date(req.getParameter("hidden_Date"));
		
		
		// 4단계. 싱글톤방식으로 DAO 객체 생성, 다형성 적용
		BoardDAO dao = BoardDAOImpl.getInstance();
		
		// 5단계. 상세페이지
		dao.boardWrite(dto);
		
	}

	// 게시글 수정
	@Override
	public void boardEdit(HttpServletRequest req, HttpServletResponse res) 
			throws ServletException, IOException {
		System.out.println("서비스 - boardEdit");
		
		// 3단계. get방식으로 전달받은 값을 dto에 담는다.
		BoardDTO dto = new BoardDTO();
		dto.setBoard_Title(req.getParameter("writeTitle"));
		dto.setBoard_Content(req.getParameter("writeTextarea"));
		dto.setBoard_No(Integer.parseInt(req.getParameter("board_No")));
		
		// 4단계. 싱글톤방식으로 DAO 객체 생성, 다형성 적용
		BoardDAO dao = BoardDAOImpl.getInstance();
		
		// 5단계. 상세페이지
		dao.boardEdit(dto);
		
	}
	
	// 게시글 삭제
	@Override
	public void boardDelete(HttpServletRequest req, HttpServletResponse res) 
			throws ServletException, IOException {
		System.out.println("서비스 - boardDelete");
		
		// 3단계. 화면에서 입력받은 값을 가져온다.
		int board_No = Integer.parseInt(req.getParameter("board_No"));
		
		// 4단계. 싱글톤방식으로 DAO 객체 생성, 다형성 적용
		BoardDAO dao = BoardDAOImpl.getInstance();
		
		// 5단계. 게시글 삭제 처리 후 컨트롤러에서 list로 이동
		dao.boardDelete(board_No);
		
	}

	// 게시글 검색
	@Override
	public void boardSearch(HttpServletRequest req, HttpServletResponse res) 
			throws ServletException, IOException {
		System.out.println("서비스 - boardSearch");
		
		// 3단계. 화면에서 입력받은 값을 가져온다.
		String pageNum = req.getParameter("pageNum");
		String searchKey = req.getParameter("searchKey");
		
		// 4단계. 싱글톤방식으로 DAO 객체 생성, 다형성 적용
		BoardDAO dao = BoardDAOImpl.getInstance();
		
		// 5-1단계. 전체 게시글 갯수 카운트
		Paging paging = new Paging(pageNum);
		int total = dao.boardSearchCnt(searchKey);
		System.out.println("total : " + total);
		
		paging.setTotalCount(total);
		
		// 5-2단계. 게시글 목록 조회
		int start = paging.getStartRow();
		int end = paging.getEndRow();
		
		System.out.println("start : " + start);
		System.out.println("end : " + end);
		
		List<BoardDTO> list = dao.boardSearchList(start, end, searchKey);
		
		// 6단계. jsp로 처리결과를 전달
		req.setAttribute("searchKey", searchKey);
		req.setAttribute("paging", paging);
		req.setAttribute("list", list);
	}

	// 댓글 추가
	@Override
	public void reviewAdd(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		System.out.println("서비스 - reviewAdd");
		
		// 화면으로부터 입력받은 값을 dto에 담는다.
		Board_reviewDTO dto = new Board_reviewDTO();
		dto.setBoard_No(Integer.parseInt(req.getParameter("board_No")));
		dto.setCust_Id(req.getParameter("cust_Id"));
		dto.setReview_Content(req.getParameter("reveiwWrite"));
		
		// DAO 객체 생성
		BoardDAO dao = BoardDAOImpl.getInstance();
		
		// 댓글 작성 처리 후 컨트롤러에서 list로 이동
		dao.reviewInsert(dto);
		
	}

	// 댓글 조회
	@Override
	public void reviewList(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		System.out.println("서비스 - reviewList");
		
		// 화면으로부터 입력받은 값을 받는다.
		int board_No = Integer.parseInt(req.getParameter("board_No"));
		String pageNum = req.getParameter("pageNum");
		
		// DAO 객체 생성
		BoardDAO dao = BoardDAOImpl.getInstance();
		
		// 댓글 개수 조회, 페이지처리
		int reviewCnt = dao.reviewCount(board_No);
		Paging paging = new Paging(pageNum);
		
		paging.setTotalCount(reviewCnt);
		
		// 5-2단계. 게시글 목록 조회
		int start = paging.getStartRow();
		int end = paging.getEndRow();
		
		// 댓글 목록 조회
		List<Board_reviewDTO> list = dao.reviewList(start, end);
		
		// jsp로 결과 전달
		req.setAttribute("list", list);
		req.setAttribute("paging", paging);
		req.setAttribute("reviewCnt", reviewCnt);
		
		
	}


}
