
<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Shop</title>
		<jsp:include page="/layout/link.jsp" />
</head>
<body>  
<% String root = request.getContextPath(); 
	//주문완료 후, sessionId로 주문번호를 확인
	//배송 정보를 저장한 쿠키는 삭제
	
	//쿠키에 저장된 주문정보 불러오기
	String cartId = session.getId();
	String ship_cartId = "";
	String ship_addressName = "";
	
	Cookie[] cookies = request.getCookies();
	
	if (cookies != null) {
		for (int i=0; i<cookies.length ;i++ ){
			Cookie cookie = cookies[i];
			//쿠키네임이랑 쿠키밸류가 있는데, 왜 하나는 그냥 가지고 오고 하나는 디코딩 하느냐???? 
			String cookieName = cookie.getName();
			String cookieValue = URLDecoder.decode( cookie.getValue(), "UTF-8" );
			
			switch (cookieName){
			//주문번호만 필요해용
			case "ship_cartId" : ship_cartId = cookieValue; break;
			case "ship_addressName" : ship_addressName = cookieValue; break;
			}
		}
	}
	
	//주문 완료 후, 장바구니 목록 전체 삭제 (session 만료)
	//session.invalidate(); //그런데 이렇게 하면 .. 로그아웃까지 되니까. 안됨.
	session.setAttribute("cartList", null);
	
	//배송 정보를 저장한 쿠키는 삭제 - 시간을 0으로 해서 덮어씌우기~!
	if (cookies != null) {
		for (int i=0; i<cookies.length ;i++ ){
			Cookie cookie = cookies[i];
			String cookieName = cookie.getName();
			//cookie.setValue(""); 
			//안해줘도 됨. 의미없음. 어차피 0되면 사라지니깐.
			//스위치문 쓰는 이유: 주문정보외의 다른 쿠키는 삭제하면 안되니깐.
			switch (cookieName){
			case "ship_cartId" : cookie.setMaxAge(0); break;
			case "ship_name" : cookie.setMaxAge(0); break;
			case "ship_date" : cookie.setMaxAge(0); break;
			case "ship_country" : cookie.setMaxAge(0); break;
			case "ship_zipCode" : cookie.setMaxAge(0); break;
			case "ship_addressName" : cookie.setMaxAge(0); break; //주소를 사용한다고 해서 쿠키를 삭제하면 안되는 게 아님. 
			}
			response.addCookie(cookie);
		}
	}
%>
	<!-- 여기서 절대경로 / 는 webapp까지임~!  -->
	<jsp:include page="/layout/header.jsp" />
	<div class="px-4 py-5 my-5 text-center">
		<h1 class="display-5 fw-bold text-body-emphasis">주문 완료</h1>
		<div class="col-lg-6 mx-auto">
			<p class="lead mb-4">Shop 쇼핑몰 입니다.</p>
			<div class="d-grid gap-2 d-sm-flex justify-content-sm-center">
				<%-- <a href="<%= request.getContextPath() %>/shop/products.jsp" class="btn btn-primary btn-lg px-4 gap-3">상품목록</a> --%>
				<a href="<%= root%>/shop/products.jsp" class="btn btn-primary btn-lg px-4 gap-3">상품목록</a>
			</div>
		</div>
	</div>
	
	<!-- 주문 완료 확인 -->
	<div class="container mb-5">
		<h2>주문이 완료되었습니다.</h2>
		<p>주문번호 : <%= ship_cartId %></p>
		<p>배송지 : <%= ship_addressName %></p>
		<p></p>
	</div>
	<jsp:include page="/layout/footer.jsp" />
	<jsp:include page="/layout/script.jsp" />
</body>
</html>





