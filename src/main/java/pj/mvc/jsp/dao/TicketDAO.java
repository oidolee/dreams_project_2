package pj.mvc.jsp.dao;

import java.util.List;

import pj.mvc.jsp.dto.TicketDTO;

public interface TicketDAO {

	
	// 티켓 조회
	public TicketDTO ticketList(String strTicket_seat);
	
	// 티켓 가격 수정
	public int ticketUpdate(TicketDTO tdto);
	
	// 티켓 삭제
	public int ticketDelete(TicketDTO tdto);
	
	// 티켓 추가
	public int ticketInsert(TicketDTO tdto);
}
