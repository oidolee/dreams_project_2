package pj.mvc.jsp.dao;

import java.util.List;

import pj.mvc.jsp.dto.BoardDTO;

public interface BoardDAO {
	
	// 게시글 목록
	public List<BoardDTO> boardList(int start, int end);

	// 게시글 갯수 구하기
	public int boardCnt();

	// 게시글 상세페이지
	public BoardDTO getBoardDetail(int boardNo);
	
	
}
