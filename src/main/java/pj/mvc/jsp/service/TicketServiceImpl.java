package pj.mvc.jsp.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pj.mvc.jsp.dao.TicketDAO;
import pj.mvc.jsp.dao.TicketDAOImpl;
import pj.mvc.jsp.dto.TicketDTO;

public class TicketServiceImpl implements TicketService {

	// 티켓 목록 조회
	@Override
	public void ticketListAction(HttpServletRequest req, HttpServletResponse res) 
			throws ServletException, IOException {
		System.out.println("서비스 - ticketListAction");
		TicketDTO tdto = new TicketDTO();
		
		// 3단계. 화면에서 입력받은 값을 가져온다.
		String strTicket_seat = req.getParameter("parkseat");
		
		// 4단계. 싱글톤 방식으로 DAO 객체 생성, 다형성 적용
		TicketDAO tdao = TicketDAOImpl.getInstance();
		
		tdto = tdao.ticketList(strTicket_seat);
		
		// 5단계. jsp로 처리결과 전달
		req.setAttribute("tdto", tdto);
	}

	// 티켓 가격 수정
	@Override
	public void ticketUpdateAction(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		
	}

	// 티켓 삭제 처리
	@Override
	public void ticketDeleteAction(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		
	}

}
