package pj.mvc.jsp.dto;

public class BoardDTO {
	
	// 멤버변수
	private int board_No;
	private String cust_Id;
	private String board_Title;
	private String board_Content;
	private String board_Date;
	
	// 디폴트 생성자
	public BoardDTO() {
		super();
	}

	// 매개변수 생성자
	public BoardDTO(int board_No, String cust_Id, String board_Title, String board_Content, String board_Date) {
		super();
		this.board_No = board_No;
		this.cust_Id = cust_Id;
		this.board_Title = board_Title;
		this.board_Content = board_Content;
		this.board_Date = board_Date;
	}

	public int getBoard_No() {
		return board_No;
	}

	public void setBoard_No(int board_No) {
		this.board_No = board_No;
	}

	public String getCust_Id() {
		return cust_Id;
	}

	public void setCust_Id(String cust_Id) {
		this.cust_Id = cust_Id;
	}

	public String getBoard_Title() {
		return board_Title;
	}

	public void setBoard_Title(String board_Title) {
		this.board_Title = board_Title;
	}

	public String getBoard_Content() {
		return board_Content;
	}

	public void setBoard_Content(String board_Content) {
		this.board_Content = board_Content;
	}

	public String getBoard_Date() {
		return board_Date;
	}

	public void setBoard_Date(String board_Date) {
		this.board_Date = board_Date;
	}

	@Override
	public String toString() {
		return "BoardDTO [board_No=" + board_No + ", cust_Id=" + cust_Id + ", board_Title=" + board_Title
				+ ", board_Content=" + board_Content + ", board_Date=" + board_Date + "]";
	}
	
}