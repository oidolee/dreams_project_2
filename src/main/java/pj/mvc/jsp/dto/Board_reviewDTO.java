package pj.mvc.jsp.dto;

public class Board_reviewDTO {
	
	private int review_No;
	private int board_No;
	private String cust_Id;
	private String review_Content;
	private String review_date;
	
	public Board_reviewDTO() {
		super();
	}

	public int getReview_No() {
		return review_No;
	}

	public void setReview_No(int review_No) {
		this.review_No = review_No;
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

	public String getReview_Content() {
		return review_Content;
	}

	public void setReview_Content(String review_Content) {
		this.review_Content = review_Content;
	}

	public String getReview_date() {
		return review_date;
	}

	public void setReview_date(String review_date) {
		this.review_date = review_date;
	}

	@Override
	public String toString() {
		return "Board_reviewDTO [review_No=" + review_No + ", board_No=" + board_No + ", cust_Id=" + cust_Id
				+ ", review_Content=" + review_Content + ", review_date=" + review_date + "]";
	}
	
	

}
