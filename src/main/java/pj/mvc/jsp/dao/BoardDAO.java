package pj.mvc.jsp.dao;

import java.util.List;

import pj.mvc.jsp.dto.BoardDTO;
import pj.mvc.jsp.dto.Board_reviewDTO;

public interface BoardDAO {
	
	// 게시글 목록
	public List<BoardDTO> boardList(int start, int end);

	// 게시글 갯수 조회
	public int boardCnt();

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
	public List<Board_reviewDTO> reviewList(int start, int end);

	// 댓글 갯수 조회
	public int reviewCount(int board_No);

	// 검색한 게시글 갯수 조회
	public int boardSearchCnt(String searchKey);

	// 검색한 게시글 목록
	public List<BoardDTO> boardSearchList(int start, int end, String searchKey);

	
	
}
