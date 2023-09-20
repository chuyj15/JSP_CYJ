<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="shop.dao.ProductRepository"%>
<%@page import="java.util.List"%>
<%@page import="shop.dto.Product"%>
<jsp:useBean id="productDAO" class="shop.dao.ProductRepository" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<!-- bootstrap lib -->
		<jsp:include page="/layout/link.jsp" />
</head>
<body>  
	<jsp:include page="../layout/header.jsp" />
	<div class="px-4 py-5 my-5 text-center">
		<h1 class="display-5 fw-bold text-body-emphasis">상품 정보</h1>
		<div class="col-lg-6 mx-auto">
			<p class="lead mb-4">Shop 쇼핑몰 입니다.</p>
			<div class="d-grid gap-2 d-sm-flex justify-content-sm-center">
				<!-- button 태그로 이동하기 -->
				<!-- 
				<button type="button" class="btn btn-primary btn-lg px-4 gap-3" 
					onclick="location.href='./products.jsp'">상품목록</button>
				 -->
					
				<!-- a 태그 버튼 -->
				<a href="./products.jsp" class="btn btn-primary btn-lg px-4 gap-3">상품목록</a>
				<button type="button" class="btn btn-outline-secondary btn-lg px-4">로그인</button>
			</div>
		</div>
	</div>
	<!-- 상품 정보 영역 -->
	
	<%
		String productId = request.getParameter("id");
		Product product = productDAO.getProductById(productId);
	%>
	<div class="container">
		<div class="row">
			<div class="col-md-6">
<%-- 			<img src="img?file=<%= product.getFile() %>" class="w-100 p-2" />  --%>
				<!-- [NEW] 썸네일 이미지 요청하기 추가 -->
				<img src="img?id=<%= product.getProductId() %>" class="w-100 p-2" />
			</div>
			<div class="col-md-6">
				<h3><%= product.getName() %></h3>
				<table class="table">
			 		<colgroup>
			 			<col width="120px" />
			 			<col />
			 		</colgroup>
			 		<tr>
			 			<td>상품ID :</td>
			 			<td><%= product.getProductId() %></td>
			 		</tr>
			 		<tr>
			 			<td>제조사 :</td>
			 			<td><%= product.getManufacturer()  %></td>
			 		</tr>
			 		<tr>
			 			<td>분류 :</td>
			 			<td><%= product.getCategory()  %></td>
			 		</tr>
			 		<tr>
			 			<td>재고 수 :</td>
			 			<td><%= product.getUnitsInStock()  %></td>
			 		</tr>
			 		<tr>
			 			<td>가격 :</td>
			 			<td><%= product.getUnitPrice() %></td>
			 		</tr>
				</table>
				<%-- <p>상품ID : <%= product.getProductId() %>	</p>
				<p>제조사 : <%= product.getManufacturer()  %></p>
				<p>분류 : <%= product.getCategory()  %></p>
				<p>재고 수 : <%= product.getUnitsInStock()  %></p>
				<h4>가격 : <%= product.getUnitPrice() %> 원</h4> --%>
				<div class="mt-4">
					<form name="addForm" action="./addCart.jsp?id=<%= product.getProductId() %>" method="post">
					<div class="btn-box d-flex justify-content-end">
						<!-- 장바구니 버튼 추가 -->
						<a href="./cart.jsp" class="btn btn-lg btn-warning mx-3">장바구니</a>
					<!-- a태그에서 페이지이동을 막을수있는 방법  : a href="javascript:;" -->
						<a href="javascript:;" class="btn btn-lg btn-success mx-3" onclick="addToCart()">주문하기</a>
					</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	
	<jsp:include page="../layout/footer.jsp" />
	<jsp:include page="../layout/script.jsp" />
	
	
	<script>
		//장바구니 추가
		function addToCart(){
			if ( confirm("상품을 장바구니에 추가하시겠습니까?")){
				document.addForm.submit()
			} else {
				document.addForm.reset()
			}
		}
	</script>
</body>
</html>











