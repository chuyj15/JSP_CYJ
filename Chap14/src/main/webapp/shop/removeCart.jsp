<%-- 세션에서 장바구니 상품 삭제 --%>

<%@page import="shop.dto.Product"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% 
String productId = request.getParameter("id");
String cartId = request.getParameter("cartId");

//장바구니 전체삭제
if (productId == null && cartId !=null){
	session.setAttribute("cartList", null);
	response.sendRedirect("cart.jsp");
	//sendRedirect 한다고 해서 밑에가 실행 안되는게 아니라서 return으로 끊어줘야 함. 
	return;
}
	
//productId가 있는 경우는 개별항목을 삭제하는 거임. 
List<Product> cartList = (List<Product>) session.getAttribute("cartList");
if ( cartList == null ) {
	response.sendRedirect("cart.jsp");
	return;
}

for (int i=0; i<cartList.size(); i++){
	Product product = cartList.get(i);
	//삭제할 장바구니 상품
	if ( product.getProductId().equals(productId)){
		cartList.remove(product);
		break;
	}
}
response.sendRedirect("cart.jsp");
%>