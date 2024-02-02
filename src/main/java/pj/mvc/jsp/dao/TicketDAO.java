package pj.mvc.jsp.dao;

import java.util.List;

import pj.mvc.jsp.dto.CustomerDTO;
import pj.mvc.jsp.dto.TicketDTO;
import pj.mvc.jsp.dto.TicketResDTO;

public interface TicketDAO {

	
	// 티켓 조회
	public List<TicketDTO> ticketList(String strTicket_seat);
	
	// 티켓 조회
	public TicketDTO ticketEach(String strTicket_seat);
	
	// 티켓 예매
	public int ticketRes(TicketResDTO trdto);
	
	// 티켓 가격 수정
	public int ticketUpdate(TicketDTO tdto);
	
	// 티켓 삭제
	public int ticketDelete(String strTicket_seat);
	
	// 티켓 추가
	public int ticketInsert(TicketDTO tdto);
	
	// 회원 조회
	public CustomerDTO customerDetail(String srtId);

	
}
