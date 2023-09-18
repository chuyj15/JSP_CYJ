package shop.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import shop.dto.Product;

public class ProductRepository extends JDBConnection {
	
	public List<Product> list(){
		ArrayList<Product> productList = new ArrayList<Product>();
		
		String sql = " SELECT * FROM product";
		try {
			//데이터베이스 연결 객체인 con에서 SQL 문을 실행할 Statement 객체를 생성
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				Product product = new Product();
				product.setProductId(rs.getString("product_id"));
				product.setName(rs.getString("name"));
				product.setUnitPrice(rs.getInt("unit_price"));
				product.setDescription(rs.getString("description"));
				product.setManufacturer(rs.getString("manufacturer"));
				product.setCategory(rs.getString("category"));
				product.setUnitsInStock(rs.getLong("units_in_stock"));
				product.setCondition(rs.getString("condition"));
				
				productList.add(product);
				
				
			}
		} catch (SQLException e) {
			System.err.println();
		}
		return productList;	
	}
	
	public Product getProductById(String productId) {
		Product product = new Product();
		String sql = " SELECT * FROM product WHERE product_id = ? ";
		try {
			//데이터베이스 연결 객체인 con에서 SQL 문을 실행할 Statement 객체를 생성
			psmt = con.prepareStatement(sql);
			psmt.setString(1, productId);
			rs = psmt.executeQuery();
			while( rs.next() ) {
				product.setProductId(rs.getString("product_id"));
				product.setName(rs.getString("name"));
				product.setUnitPrice(rs.getInt("unit_price"));
				product.setDescription(rs.getString("description"));
				product.setManufacturer(rs.getString("manufacturer"));
				product.setCategory(rs.getString("category"));
				product.setUnitsInStock(rs.getLong("units_in_stock"));
				product.setCondition(rs.getString("condition"));
			}
		} catch (SQLException e) {
			System.err.println();
		}
		return product;
		
	}
	
	/**
	 * 상품 등록
	 * @param product
	 * @return
	 */
	public int insert(Product product) {
		int result = 0;
		
		String sql = " INSERT INTO joeun.product (product_id, name, unit_price, description, manufacturer, category, units_in_stock, `condition`) "
						+ " VALUES(?, ?, ?, ?, ?, ?, ?, ?) ";
		int no = 1;
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(no++, product.getProductId());			
			psmt.setString(no++, product.getName());			
			psmt.setInt(no++, product.getUnitPrice());			
			psmt.setString(no++, product.getDescription());			
			psmt.setString(no++, product.getManufacturer());			
			psmt.setString(no++, product.getCategory());			
			psmt.setLong(no++, product.getUnitsInStock());			
			psmt.setString(no++, product.getCondition());			
			result = psmt.executeUpdate();
			//상품 등록 요청	//반환 : 등록된 row의 개수
			//조회요청 보낼 땐 executeQuery . 등록수정삭제시는 executeUpdate 
		} catch (Exception e) {
			System.err.println("상품 등록 중, 에러 발생!");
			e.printStackTrace();
		}
		System.out.println("상품 "+result+"개가 등록되었습니다. ");
		return result;
	}
	
}
