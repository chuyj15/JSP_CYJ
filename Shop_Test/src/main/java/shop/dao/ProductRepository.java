package shop.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import shop.dto.Product;

public class ProductRepository extends JDBConnection {
	
	/**
	 * 상품 목록
	 * @return
	 */
	public List<Product> list() {
		String sql = " SELECT * FROM `product` ";
		List<Product> productList = new ArrayList<Product>();
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			//while을 안 씀.
			while (rs.next()) {
				Product product = new Product();
				product.setProductId(rs.getString("product_id"));
				product.setName(rs.getString("name"));
				product.setUnitPrice(Integer.parseInt(rs.getString("unit_price")==null? "0" : rs.getString("unit_price")));
				product.setDescription(rs.getString("description"));
				product.setManufacturer(rs.getString("manufacturer"));
				product.setCategory(rs.getString("category"));
				product.setUnitsInStock(Integer.parseInt(rs.getString("units_in_stock")==null? "0" : rs.getString("units_in_stock")));
				product.setCondition(rs.getString("condition"));
				product.setFile(rs.getString("file"));
				product.setQuantity(Integer.parseInt(rs.getString("quantity")==null? "0" : rs.getString("quantity")));
				productList.add(product);
				System.out.println(product);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return productList;
		
	}
	
	
	/**
	 * 상품 목록 검색
	 * @param keyword
	 * @return
	 */
	public List<Product> list(String keyword) {
		String sql = "SELECT * FROM `product` WHERE name LIKE ? OR description LIKE ? OR manufacturer LIKE ? or category LIKE ? ;";
		List<Product> productList = new ArrayList<Product>();
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, "%"+keyword+"%");
			psmt.setString(2, "%"+keyword+"%");
			psmt.setString(3, "%"+keyword+"%");
			psmt.setString(4, "%"+keyword+"%");
			rs = psmt.executeQuery();
			while (rs.next()) {
				Product product = new Product();
				product.setProductId(rs.getString("product_id"));
				product.setName(rs.getString("name"));
				product.setUnitPrice(Integer.parseInt(rs.getString("unit_price")==null? "0" : rs.getString("unit_price")));
				product.setDescription(rs.getString("description"));
				product.setManufacturer(rs.getString("manufacturer"));
				product.setCategory(rs.getString("category"));
				product.setUnitsInStock(Integer.parseInt(rs.getString("units_in_stock")==null? "0" : rs.getString("units_in_stock")));
				product.setCondition(rs.getString("condition"));
				product.setFile(rs.getString("file"));
				product.setQuantity(Integer.parseInt(rs.getString("quantity")==null? "0" : rs.getString("quantity")));
				productList.add(product);
				System.out.println("키워드검색 실행 ");
				System.out.println(product);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return productList;
	}
	
	/**
	 * 상품 조회
	 * @param productId
	 * @return
	 */
	public Product getProductById(String productId) {
		String sql = "SELECT * FROM `product` WHERE product_id = ? ";
		Product product = new Product();
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, productId);
			rs = psmt.executeQuery();
			if (rs.next()) {
				product.setProductId(rs.getString("product_id"));
				product.setName(rs.getString("name"));
				product.setUnitPrice(Integer.parseInt(rs.getString("unit_price")==null? "0" : rs.getString("unit_price")));
				product.setDescription(rs.getString("description"));
				product.setManufacturer(rs.getString("manufacturer"));
				product.setCategory(rs.getString("category"));
				product.setUnitsInStock(Integer.parseInt(rs.getString("units_in_stock")==null? "0" : rs.getString("units_in_stock")));
				product.setCondition(rs.getString("condition"));
				product.setFile(rs.getString("file"));
				product.setQuantity(Integer.parseInt(rs.getString("quantity")==null? "0" : rs.getString("quantity")));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
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
		// [NEW] - file 컬럼 추가
		String sql = " INSERT INTO product (product_id, name, unit_price, description, manufacturer, category, units_in_stock, `condition`, file) "				
				   + " VALUES( ?, ?, ?, ?, ?, ?, ?, ?, ? ) ";
		
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
			// [NEW] - file 경로 추가
			psmt.setString(no++, product.getFile());
			result = psmt.executeUpdate();			// 상품 등록 요청
			
		} catch (SQLException e) {
			System.err.println("상품 등록 중, 에러 발생!");
			e.printStackTrace();
		}
		System.out.println("상품 " + result + "개가 등록되었습니다.");
		return result;
		
	}
	
	
	/**
	 * 상품 수정
	 * @param product
	 * @return
	 */
	public int update(Product product) {

		int result = 0;
		String sql = " UPDATE product  "
				   + "    SET name = ? "
				   + "		 ,unit_price = ? "
				   + "		 ,description = ? "
				   + "		 ,manufacturer = ? "
				   + "		 ,category = ? "
				   + "		 ,units_in_stock = ? "
				   + "		 ,`condition` = ? "
				   + "		 ,file= ? "
				   + " WHERE product_id = ? ";
		
		int no = 1;
		
		long unit = 0;
		
		// 입고
		if(product.getType()!=null &&product.getType().equals("IN") ) {
			unit = product.getUnitsInStock() + product.getQuantity();
		}
		// 출고
		if( product.getType()!=null &&product.getType().equals("OUT") ) {
			unit = product.getUnitsInStock() - product.getQuantity();
		}
		product.setUnitsInStock(unit);
		
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(no++, product.getName());
			psmt.setInt(no++, product.getUnitPrice());
			psmt.setString(no++, product.getDescription());
			psmt.setString(no++, product.getManufacturer());
			psmt.setString(no++, product.getCategory());
			psmt.setLong(no++, product.getUnitsInStock());
			psmt.setString(no++, product.getCondition());
			psmt.setString(no++, product.getFile());
			psmt.setString(no++, product.getProductId());
			result = psmt.executeUpdate();			// 상품 수정 요청
			
		} catch (SQLException e) {
			System.err.println("상품 수정 중, 에러 발생!");
			e.printStackTrace();
		}
		System.out.println("상품 " + result + "개가 수정되었습니다.");
		return result;
	}
	
	
	
	/**
	 * 상품 삭제
	 * @param product
	 * @return
	 */
	public int delete(String productId) {
int result = 0;
		
		String sql = " DELETE FROM product "
				   + " WHERE product_id = ? ";
		
		int no = 1;
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(no++, productId);
			result = psmt.executeUpdate();			// 상품 수정 요청
			
		} catch (SQLException e) {
			System.err.println("상품 삭제 중, 에러 발생!");
			e.printStackTrace();
		}
		System.out.println("상품 " + result + "개가 삭제되었습니다.");
		return result;
		
	}

}
