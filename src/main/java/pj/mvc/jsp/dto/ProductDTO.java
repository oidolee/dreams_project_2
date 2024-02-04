package pj.mvc.jsp.dto;

import java.sql.Timestamp;

public class ProductDTO {

	private int product_No;				// 상품번호
	private String product_Name;		// 상품명
	private int product_Price;			// 상품가격
	private int product_Qty;			// 상품수량
	private String product_ImgName;		// 상품이미지
	private String product_ImgDetail;	// 상품 상세 이미지
	private String product_ImgSize; 	// 상품정보 이미지
	private String product_ImgRfd;		// 반품관련 이미지
	private Timestamp regDate;			// 등록일
	
	// 디폴트 생성자
	public ProductDTO() {}

	public ProductDTO(int product_No, String product_Name, int product_Price, int product_Qty, String product_ImgName,
			String product_ImgDetail, String product_ImgSize, String product_ImgRfd, Timestamp regDate) {
		super();
		this.product_No = product_No;
		this.product_Name = product_Name;
		this.product_Price = product_Price;
		this.product_Qty = product_Qty;
		this.product_ImgName = product_ImgName;
		this.product_ImgDetail = product_ImgDetail;
		this.product_ImgSize = product_ImgSize;
		this.product_ImgRfd = product_ImgRfd;
		this.regDate = regDate;
	}

	public int getProduct_No() {
		return product_No;
	}

	public void setProduct_No(int product_No) {
		this.product_No = product_No;
	}

	public String getProduct_Name() {
		return product_Name;
	}

	public void setProduct_Name(String product_Name) {
		this.product_Name = product_Name;
	}

	public int getProduct_Price() {
		return product_Price;
	}

	public void setProduct_Price(int product_Price) {
		this.product_Price = product_Price;
	}

	public int getProduct_Qty() {
		return product_Qty;
	}

	public void setProduct_Qty(int product_Qty) {
		this.product_Qty = product_Qty;
	}

	public String getProduct_ImgName() {
		return product_ImgName;
	}

	public void setProduct_ImgName(String product_ImgName) {
		this.product_ImgName = product_ImgName;
	}

	public String getProduct_ImgDetail() {
		return product_ImgDetail;
	}

	public void setProduct_ImgDetail(String product_ImgDetail) {
		this.product_ImgDetail = product_ImgDetail;
	}

	public String getProduct_ImgSize() {
		return product_ImgSize;
	}

	public void setProduct_ImgSize(String product_ImgSize) {
		this.product_ImgSize = product_ImgSize;
	}

	public String getProduct_ImgRfd() {
		return product_ImgRfd;
	}

	public void setProduct_ImgRfd(String product_ImgRfd) {
		this.product_ImgRfd = product_ImgRfd;
	}

	public Timestamp getRegDate() {
		return regDate;
	}

	public void setRegDate(Timestamp regDate) {
		this.regDate = regDate;
	}

	

	
	
}

	