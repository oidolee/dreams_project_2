package pj.mvc.jsp.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import pj.mvc.jsp.dto.ProductDTO;

public class ProductDAOImpl implements ProductDAO {
	
	DataSource dataSource = null;
	
	// 싱글톤 객체 생성
	private static ProductDAOImpl instance = new ProductDAOImpl(); // 객체 내 유일한 인스턴스 생성
	public static ProductDAOImpl getInstance() {
		if(instance == null) {
			instance = new ProductDAOImpl();
		}
		return instance;
	}
	
	// 디폴트 생성자
	/* 커넥션 풀(DBCP : DataBase Connection Pool 방식) - context.xml 에 설정 */
	private ProductDAOImpl() {
		
		try {
			Context context = new InitialContext();
			dataSource = (DataSource)context.lookup("java:comp/env/jdbc/dreams_project_2"); // 다운캐스팅 적용
			
		}catch(NamingException e) {
			
		}finally {
			
		}
		
	} // 외부에서 new를 못하게 디폴트 생성자를 private로 막는다

	
	// 상품 추가
	@Override
	public int insertProduct(ProductDTO dto) {
		int insertCnt = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = dataSource.getConnection();
			
			String sql = " INSERT INTO DR_product(product_No, product_Name, product_Price, product_TotalQty) "
					+ "         VALUES(?, ?, ?, ?)";
					
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, dto.getProduct_No());
			pstmt.setString(2, dto.getProduct_Name());
			pstmt.setInt(3, dto.getProduct_Price());
			pstmt.setInt(4, dto.getProduct_Qty());
			
			insertCnt = pstmt.executeUpdate();
			System.out.println("insertCnt : " + insertCnt);
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}
		
		return insertCnt;
	}
	
	// 상품 삭제
	@Override
	public int deleteProduct(int product_No) {
		int deleteCnt = 0;
		return deleteCnt;
	}
	// 상품 수정
	@Override
	public int updateProduct(ProductDTO dto) {
		int updateCnt = 0;
		return updateCnt;
	}
	
	// 상품 상세
	@Override
	public ProductDTO getProductDetail(int product_No) {
		ProductDTO dto = new ProductDTO();
		
		return dto;
	}

}
