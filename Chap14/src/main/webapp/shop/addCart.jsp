<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="shop.dto.Product"%>
<%@page import="shop.dao.ProductRepository"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//상품 id 넘겨받기
	String productId = request.getParameter("id");
	out.print(productId);
	
	//존재하는 상품인지? 확인함. 만약 사용자가 직접 addPro에 접근..? 해서 어떤 경로에 의해 존재하지 않는 상품아이디가 넘어올 수 있음. 
			//CartList라는 장바구니 목록 세션 정보를 등록해서 객체하나하나를 추가시켜줌. 
			//최종적으로 주문페이지에서 장바구니 목록을 주루룩 가져오면 됨. 
	//존재하는 상품인지?
	ProductRepository productDAO = new ProductRepository();
	Product product = productDAO.getProductById(productId);
	
	//존재하지 않는 상품일 때
	if (product == null ){
		String root = request.getContextPath();
		response.sendRedirect(root + "/error/exception");
		//테스트 해보기
	}
	
	
	//장바구니 목록 세션 정보 등록
	List<Product> list = (List<Product>) session.getAttribute("cartList");
	//최초에 장바구니 담기
	if (list ==null ){
		list = new ArrayList<Product>();
		session.setAttribute("cartList", list);
		list =(List<Product>) session.getAttribute("cartList");
	}
	int cnt = 0;
	Product productItem = new Product();
	
	for (int i=0; i<list.size(); i++){
		productItem = list.get(i);
		//기존의 장바구니 목록의 상품과 지금 추가하는 상품이 같으면, 개수를 누적
		if (productItem.getProductId().equals(productId)){
			cnt++;
			int count = productItem.getQuantity() +1;
			productItem.setQuantity(count);
		}
	}
	//신규 상품을 장바구니에 추가한 경우
	if (cnt ==0) {
		product.setQuantity(1); //최초 장바구니 개수 1
		list.add(product);
	}
	
	//list 를 참조자료형이라 세션에 접근하고 있음. 
	//세션에 잇는 리스트를 접근하는 참조정보 레퍼런스를 받아왔기 때문에... . . . .
	//다시 세션에 add한 리스트를 넣어줄 필요가 없음. 
	
	
	//상품 상세 페이지로 이동
	response.sendRedirect("product.jsp?id=" + productId);
%>