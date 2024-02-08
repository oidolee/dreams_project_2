package pj.mvc.jsp.dao;

import java.util.List;

import pj.mvc.jsp.dto.BoardDTO;
import pj.mvc.jsp.dto.Board_reviewDTO;

public interface BoardDAO {
	
	// 게시글 목록
	public List<BoardDTO> boardList(int start, int end);

	// 게시글 갯수 조회
	public int boardCnt();

	// 게시글 max 번호 조회
	public int getMaxBoardNo();
	
	// 게시글 상세페이지
	public BoardDTO getBoardDetail(int boardNo);

	// 게시글 추가
	public void boardWrite(BoardDTO dto);

	// 게시글 수정
	public void boardEdit(BoardDTO dto);
	
	// 게시글 삭제
	public void boardDelete(int boardNo);

	// 댓글 추가
	public void reviewInsert(Board_reviewDTO dto);

	// 댓글 목록
	public List<Board_reviewDTO> reviewList(int start, int end, int board_No);

	// 댓글 갯수 조회
	public int reviewCount(int board_No);

	// 검색한 게시글 갯수 조회
	public int boardSearchCnt(String searchKey);

	// 검색한 게시글 목록
	public List<BoardDTO> boardSearchList(int start, int end, String searchKey);

	// 댓글 삭제 / 관리자 댓글 숨기기
	public void reviewDelete(int review_No);

	// 관리자 게시글 총갯수 조회
	public int boardTotalCnt();

	// 관리자 게시글 목록
	public List<BoardDTO> admin_boardList(int start, int end);

	// 관리자 게시글 보이기
	public void boardView(int boardNo);

	// 관리자 게시글 삭제
	public void boardDelete_admin(int boardNo);
	
	// 관리자 댓글 총갯수 조회
	public int reviewTotalCnt(int board_No);
	
	// 관리자 댓글 목록
	public List<Board_reviewDTO> reviewList_admin(int start, int end, int board_No);

	// 관리자 댓글 보이기
	public void reviewView_admin(int review_No);

	// 관리자 댓글 완전삭제
	public void reviewDelete_admin(int review_No);






	
	
}
