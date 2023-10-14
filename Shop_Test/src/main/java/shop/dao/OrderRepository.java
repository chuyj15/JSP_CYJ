package shop.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import shop.dto.Order;
import shop.dto.Product;

public class OrderRepository extends JDBConnection {
	
	/**
	 * 주문 등록
	 * @param user
	 * @return
	 */
	public int insert(Order order) {
		int result = 0;
		String sql = " INSERT INTO `order` ( ship_name, zip_code, country, address, date, order_pw, user_id, total_price, phone ) "
				   + " VALUES ( ?, ?, ?, ?, ?, ?, ?, ?, ? ) " ;				
		
		int no = 1;
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(no++, order.getShipName());
			psmt.setString(no++, order.getZipCode());
			psmt.setString(no++, order.getCountry());
			psmt.setString(no++, order.getAddress());
			psmt.setString(no++, order.getDate());
			psmt.setString(no++, order.getOrderPw());
			psmt.setString(no++, order.getUserId());
			psmt.setInt(no++, order.getTotalPrice());
			psmt.setString(no++, order.getPhone());
			
			result = psmt.executeUpdate();			// 주문 등록 요청
			
		} catch (SQLException e) {
			System.err.println("주문 등록 중, 에러 발생!");
			e.printStackTrace();
		}
		
		if( result > 0 ) {
			result = lastOrderNo();
		} else { 
			result = 0;
		}
		return result;
		
	}

	/**
	 * 최근 등록한 orderNo 
	 * @return
	 */
	public int lastOrderNo() {
		int orderNo = 0;
		String sql = " SELECT LAST_INSERT_ID() ";
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			
			if( rs.next() ) {
				orderNo = rs.getInt(1);
			}
			
		} catch (SQLException e) {
			System.err.println("최근 order_no 조회 시, 에러 발생");
			e.printStackTrace();
		}
		return orderNo;
		
	}

	
	/**
	 * 주문 내역 조회 - 회원
	 * @param userId
	 * @return
	 */
	public List<Product> list(String userId) {
		List<Product> productList = new ArrayList<>();
		String sql = " SELECT `order`.order_no, product.name, product.unit_price, product_io.amount "
				+ " FROM product_io "
				+ " INNER JOIN product ON product.product_id = product_io.product_id "
				+ " INNER JOIN `order` ON `order`.order_no = product_io.order_no "
				+ " WHERE product_io.user_id = ? ";
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, userId);
			rs = psmt.executeQuery();
			while (rs.next()) {
				Product product = new Product();
				//getString 은 실제 컬럼 이름을 가져오니까 table.을 쓰면 안됨. 
				product.setOrderNo(rs.getInt("order_no"));
				product.setName(rs.getString("name"));
				product.setUnitPrice(rs.getInt("unit_price"));
				product.setQuantity(rs.getInt("amount"));
				productList.add(product);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return productList;

	}
	
	/**
	 * 주문 내역 조회 - 비회원
	 * @param phone
	 * @param orderPw
	 * @return
	 */
	public List<Product> list(String phone, String orderPw) {
		List<Product> productList = new ArrayList<>();
		String sql = " SELECT `order`.order_no, product.name, product.unit_price, product_io.amount "
				+ " FROM product_io "
				+ " INNER JOIN product ON product.product_id = product_io.product_id "
				+ " INNER JOIN `order` ON `order`.order_no = product_io.order_no "
				+ " WHERE `order`.order_pw = ? AND `order`.phone = ? ";
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, orderPw);
			psmt.setString(2, phone);
			rs = psmt.executeQuery();
			while (rs.next()) {
				Product product = new Product();
				product.setOrderNo(rs.getInt("order_no"));
				product.setName(rs.getString("name"));
				product.setUnitPrice(rs.getInt("unit_price"));
				product.setQuantity(rs.getInt("amount"));
				productList.add(product);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return productList;
		
	}
	
}






























