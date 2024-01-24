package pj.mvc.jsp.dto;

public class ProductDTO {

	private int product_No;				// 상품번호
	private String product_Name;		// 상품명
	private int product_TotalQty;		// 상품수량
	private String product_Category;	// 상품종류
	
	// 디폴트 생성자
	public ProductDTO() {}
	
	// 매개변수 생성자
	public ProductDTO(int product_No, String product_Name, int product_TotalQty, String product_Category) {
		super();
		this.product_No = product_No;
		this.product_Name = product_Name;
		this.product_TotalQty = product_TotalQty;
		this.product_Category = product_Category;
	}

	// getter, setter
	
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

	public int getProduct_TotalQty() {
		return product_TotalQty;
	}

	public void setProduct_TotalQty(int product_TotalQty) {
		this.product_TotalQty = product_TotalQty;
	}

	public String getProduct_Category() {
		return product_Category;
	}

	public void setProduct_Category(String product_Category) {
		this.product_Category = product_Category;
	}

	// toString()
	@Override
	public String toString() {
		return "ProductDTO [product_No=" + product_No + ", product_Name=" + product_Name + ", product_TotalQty="
				+ product_TotalQty + ", product_Category=" + product_Category + "]";
	}

	
	
	
}
