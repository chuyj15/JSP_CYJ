<%@page import="shop.dto.Product" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<jsp:useBean id="productDAO" class="shop.dao.ProductRepository"/> 

<%
	request.setCharacterEncoding("UTF-8");
	
	String productId = request.getParameter("productId");
	String name = request.getParameter("name");
	String unitPrice = request.getParameter("unitPrice");
	String description = request.getParameter("description");
	String manufacturer = request.getParameter("manufacturer");
	String category = request.getParameter("category");
	//getParameter 로는 스트링으로만 받아짐. input타입을 number로 받았더라도. 
	//html은 자료형자체가 없음. 
	String unitsInStock = request.getParameter("unitsInStock");
	String condition = request.getParameter("condition");
	
	Integer price = unitPrice.isEmpty() ? 0 : Integer.parseInt(unitPrice);
	long stock = unitsInStock.isEmpty() ? 0 : Long.parseLong(unitsInStock);
	
	Product product = new Product();
	product.setProductId(productId);
	product.setName(name);
	product.setUnitPrice(price);
	product.setDescription(description);
	product.setManufacturer(manufacturer);
	product.setCategory(category);
	product.setUnitsInStock(stock);
	product.setCondition(condition);
	

	int result = productDAO.insert(product);
	
	if(result==0){
		
	}else{
		response.sendRedirect("./products.jsp");
	}
	
	
%>