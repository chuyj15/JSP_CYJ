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
	
	
}
