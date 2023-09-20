<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// EncodingFilter 에서 공통으로 처리됨
	// request.getCharacterEncoding("UTF-8");

	//쿠키에 주문정보를 저장
	//쿠키에 저장할 때 한글이 깨지지 않고 저장해주려고.. 하는거같은데.ㅣ.. . ..
	//쿠키의 value는 한글이나 특수문자를 클라이언트측에서 인식하기 위한.. 인코딩타입이 다른데 그게 서버랑 클라이언트랑 똑같이 일치하느냐, 그걸 맞춰주기 위해 encoding, decoding을 사용하는 것 같음. 
	Cookie cartId = new Cookie("ship_cartId", URLEncoder.encode( request.getParameter("cartId"), "UTF-8") );
	Cookie name = new Cookie("ship_name", URLEncoder.encode( request.getParameter("name"), "UTF-8") );
//	Cookie name = new Cookie("ship_name", request.getParameter("name"));
	Cookie date = new Cookie("ship_date", URLEncoder.encode( request.getParameter("shippingDate"), "UTF-8") );
//	Cookie date = new Cookie("ship_date", request.getParameter("shippingDate"));
	Cookie country = new Cookie("ship_country", URLEncoder.encode( request.getParameter("country"), "UTF-8") );
	Cookie zipCode = new Cookie("ship_zipCode", URLEncoder.encode( request.getParameter("zipCode"), "UTF-8") );
	Cookie addressName = new Cookie("ship_addressName", URLEncoder.encode( request.getParameter("addressName"), "UTF-8") );
	
	//초단위로 세션 시간 정할 수 있어용.
	int time = 24 * 60 * 60;
	cartId.setMaxAge(time);
	name.setMaxAge(time);
	date.setMaxAge(time);
	country.setMaxAge(time);
	zipCode.setMaxAge(time);
	addressName.setMaxAge(time);
	
	response.addCookie(cartId);
	response.addCookie(name);
	response.addCookie(date);
	response.addCookie(country);
	response.addCookie(zipCode);
	response.addCookie(addressName);
	
	response.sendRedirect("order.jsp");
%>