package pj.mvc.jsp.dao;

import java.util.List;

import pj.mvc.jsp.dto.TeamDTO;
import pj.mvc.jsp.dto.gamesDTO;

public interface gamesDAO {
	//경기 일정 출력
	public List<gamesDTO> selectGamesList();
	
	//팀 내역 출력
	public List<TeamDTO> selectTeamList();
	
	//경기 일정 삭제
	public int deleteGames(int dG_No);
}
