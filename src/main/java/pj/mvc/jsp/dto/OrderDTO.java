package pj.mvc.jsp.dto;

public class OrderDTO {
	
	// 멤버변수
	private int order_No;			// 주문번호
	private String cust_Id;			// 고객ID
	private String order_Name;		// 주문자이름
	private String order_Phone;		// 연락처
	private String order_Date;		// 주문일자
	private String order_Status;	// 주문상태
	
	// 디폴트 생성자
	public OrderDTO() {
		super();
	}
	
	// 매개변수 생성자
	public OrderDTO(int order_No, String cust_Id, String order_Name, String order_Phone, String order_Date,
			String order_Status) {
		super();
		this.order_No = order_No;
		this.cust_Id = cust_Id;
		this.order_Name = order_Name;
		this.order_Phone = order_Phone;
		this.order_Date = order_Date;
		this.order_Status = order_Status;
	}
	
	// getter, setter
	public int getOrder_No() {
		return order_No;
	}

	public void setOrder_No(int order_No) {
		this.order_No = order_No;
	}

	public String getCust_Id() {
		return cust_Id;
	}

	public void setCust_Id(String cust_Id) {
		this.cust_Id = cust_Id;
	}

	public String getOrder_Name() {
		return order_Name;
	}

	public void setOrder_Name(String order_Name) {
		this.order_Name = order_Name;
	}

	public String getOrder_Phone() {
		return order_Phone;
	}

	public void setOrder_Phone(String order_Phone) {
		this.order_Phone = order_Phone;
	}

	public String getOrder_Date() {
		return order_Date;
	}

	public void setOrder_Date(String order_Date) {
		this.order_Date = order_Date;
	}

	public String getOrder_Status() {
		return order_Status;
	}

	public void setOrder_Status(String order_Status) {
		this.order_Status = order_Status;
	}

	@Override
	public String toString() {
		return "OrderDTO [order_No=" + order_No + ", cust_Id=" + cust_Id + ", order_Name=" + order_Name
				+ ", order_Phone=" + order_Phone + ", order_Date=" + order_Date + ", order_Status=" + order_Status
				+ "]";
	}
	
	
	
	
	

}
