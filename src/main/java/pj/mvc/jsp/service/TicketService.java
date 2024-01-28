package pj.mvc.jsp.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface TicketService {

	// 티켓 목록 조회
	public void ticketListAction(HttpServletRequest req, HttpServletResponse res) 
			throws ServletException, IOException;
	
	// 티켓 가격 수정
	public void ticketUpdateAction(HttpServletRequest req, HttpServletResponse res) 
			throws ServletException, IOException;
	
	// 티켓 삭제 처리
	public void ticketDeleteAction(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException;
	
	// 티켓 추가 처리
	public void ticketInsertAction(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException;
		
	// 티켓 개별 조회
	public void ticketEachAction(HttpServletRequest req, HttpServletResponse res) 
			throws ServletException, IOException;
	
}
