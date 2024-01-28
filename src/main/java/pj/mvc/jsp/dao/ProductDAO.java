package pj.mvc.jsp.dao;

import pj.mvc.jsp.dto.ProductDTO;

public interface ProductDAO {
	
	// 2. 상품 등록
	public int insertProduct(ProductDTO dto);
	// 3. 상품 삭제
	public int deleteProduct(int product_No);
	// 4. 상품 수정
	public int updateProduct(ProductDTO dto);
	// 5. 상품 상제 페이지
	public ProductDTO getProductDetail(int product_No);
	
}
