<%@page import="java.io.File"%>
<%@page import="shop.dto.Product"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <jsp:useBean id="productDAO" class="shop.dao.ProductRepository"></jsp:useBean>
<%
	String productId = request.getParameter("id");
	
	//파일 경로 조회
	Product product = productDAO.getProductById(productId);
	String filePath = product.getFile();
	//파일 삭제
	File file = new File(filePath);
	
	//파일 존재여부 확인
	if( file.exists() ) {
		// delete()
		// - 파일 삭제 성공 --> true
		// - 파일 삭제 실패 --> false
		// * 하위 경로에 파일이 존재하면 삭제가 되지 않는다.
		if( file.delete() ) {
			System.out.println("파일 삭제 성공!!!");
		}
		else {
			System.err.println("파일 삭제 실패!!!");
		}
	} else {
		System.err.println("파일이 존재하지 않습니다!!!");
	}
	
	//데이터 삭제


	/* ProductRepository productDAO = new ProductRepository(); */
	int result = productDAO.delete(productId);	//데이터베이스에서 데이터 삭제 요청
	response.sendRedirect("editProducts.jsp");
	/* response.sendRedirect("products.jsp"); */
%>
