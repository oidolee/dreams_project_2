package pj.mvc.jsp.dao;

import pj.mvc.jsp.dto.ProductDTO;

public class ProductDAOImpl implements ProductDAO {

	@Override
	public int insertProduct(int product_No) {
		int insertCnt = 0;
		return insertCnt;
	}

	@Override
	public int deleteProduct(int product_No) {
		int deleteCnt = 0;
		return deleteCnt;
	}

	@Override
	public int updateProduct(ProductDTO dto) {
		int updateCnt = 0;
		return updateCnt;
	}

	@Override
	public ProductDTO getProductDetail(int product_No) {
		ProductDTO dto = new ProductDTO();
		
		return dto;
	}

}
