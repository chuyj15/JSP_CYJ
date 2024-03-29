
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

//쿠키에 저장된 주문정보 불러오기
String ship_cartId = "";
String ship_name = "";
String ship_date = "";
String ship_country = "";
String ship_zipCode = "";
String ship_addressName = "";

Cookie[] cookies = request.getCookies();

if (cookies != null) {
	for (int i=0; i<cookies.length ;i++ ){
		Cookie cookie = cookies[i];
		//쿠키네임이랑 쿠키밸류가 있는데, 왜 하나는 그냥 가지고 오고 하나는 디코딩 하느냐???? 
		String cookieName = cookie.getName();
		String cookieValue = URLDecoder.decode( cookie.getValue(), "UTF-8" );
//		String cookieValue = cookie.getValue();

		switch (cookieName){
		case "ship_cartId" : ship_cartId = cookieValue; break;
		case "ship_name" : ship_name = cookieValue; break;
		case "ship_date" : ship_date = cookieValue; break;
		case "ship_country" : ship_country = cookieValue; break;
		case "ship_zipCode" : ship_zipCode = cookieValue; break;
		case "ship_addressName" : ship_addressName = cookieValue; break;
		}
	}
}




%>
	<!-- 여기서 절대경로 / 는 webapp까지임~!  -->
	<jsp:include page="/layout/header.jsp" />
	<div class="px-4 py-5 my-5 text-center">
		<h1 class="display-5 fw-bold text-body-emphasis">배송 정보</h1>
		<div class="col-lg-6 mx-auto">
			<p class="lead mb-4">Shop 쇼핑몰 입니다.</p>
			<div class="d-grid gap-2 d-sm-flex justify-content-sm-center">
				<%-- <a href="<%= request.getContextPath() %>/shop/products.jsp" class="btn btn-primary btn-lg px-4 gap-3">상품목록</a> --%>
				<a href="<%= root%>/shop/products.jsp" class="btn btn-primary btn-lg px-4 gap-3">상품목록</a>
			</div>
		</div>
	</div>
	
	<!-- 배송 정보 입력 -->
	<div class="container mb-5 p-4">
	<!-- margin bottom -->
		<form action="ship_pro.jsp" class="form-horizontal" method="post">
		<input type="hidden" name="cartId" value="<%= request.getParameter("cartId")%>">
			<div class="input-group mb-3 row">
				<label class="input-group-text col-md-2" id="">성명</label>
				<input type="text" class="form-control col-md-10" name="name" value="<%= ship_name %>">
			</div>
			<div class="input-group mb-3 row">
				<label class="input-group-text col-md-2" id="">배송일</label>
				<input type="text" class="form-control col-md-10" name="shippingDate" value="<%= ship_date %>">
			</div>
			<div class="input-group mb-3 row">
				<label class="input-group-text col-md-2" id="">국가명</label>
				<input type="text" class="form-control col-md-10" name="country" value="<%= ship_country %>">
			</div>
			<div class="input-group mb-3 row">
				<label class="input-group-text col-md-2" id="">우편번호</label>
				<input type="text" class="form-control col-md-10" name="zipCode" value="<%= ship_zipCode %>">
			</div>
			<div class="input-group mb-3 row">
				<label class="input-group-text col-md-2" id="">주소</label>
				<input type="text" class="form-control col-md-10" name="addressName" value="<%= ship_addressName %>">
			</div>
			<!-- 버튼 영역 -->
			<div class="d-flex justify-content-between mt-5 mb-5">
				<div class="item">
					<a href="cart.jsp" class="btn btn-lg btn-success">이전</a>
					<!-- 취소 프로세스는 이어서... -->
					<a href="" class="btn btn-lg btn-danger">취소</a>
				</div>
				<div class="item">
					<input type="submit" class="btn btn-lg btn-primary" value="등록" />
				</div>
			</div>
		</form>
	</div>
	
	
	<jsp:include page="/layout/footer.jsp" />
	<jsp:include page="/layout/script.jsp" />
</body>
</html>





