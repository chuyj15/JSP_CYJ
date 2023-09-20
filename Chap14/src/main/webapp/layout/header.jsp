<%@page import="shop.dto.Product"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
List<Product> cartList = (List<Product>) session.getAttribute("cartList");
int cartCount = cartList ==null ? 0 : cartList.size();

String root = request.getContextPath() ;

String loginId = (String) session.getAttribute("loginId");
%>
<nav class="navbar navbar-expand-lg bg-dark border-bottom border-body" data-bs-theme="dark">
  <div class="container-fluid">
  <!-- 	<a class="navbar-brand" href="#">Navbar</a> -->
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNavDropdown">
	  	<ul class="navbar-nav me-auto">
	  		<li class="nav-item">
			    <a class="navbar-brand" href="<%=root %>">Home</a>
	  		</li>
	  		<li class="nav-item">
			    <a class="navbar-brand" href="<%=root %>/shop/products.jsp">Product</a>
	  		</li>
	  	</ul>
  	</div>
    <!-- 헤더에 있는 버튼들 -->
    <!--비로그인 시 보이는 버튼  -->
<%
if (loginId == null || loginId.equals("")){
%>
  	<div class="util">
	  <a href="<%=root %>/user/login.jsp" class="btn btn-lg btn-warning mx-3">로그인</a>
  	</div>
  	<div class="util">
	  <a href="<%=root %>/user/join.jsp" class="btn btn-lg btn-warning mx-3">회원가입</a>
  	</div>
<%
} else {
%>
    <!--로그인 시 보이는 버튼  -->
    <div class="util">
	  <a href="<%=root %>/user/update.jsp" class="btn btn-lg btn-warning mx-3"><%= loginId %></a>
  	</div>
    <div class="util">
	  <a href="<%=root %>/user/logout.jsp" class="btn btn-lg btn-warning mx-3">로그아웃</a>
  	</div>
<%
}
%>
  	<div class="util">
	  <a href="<%=root %>/shop/cart.jsp" class="btn btn-lg btn-warning mx-3">장바구니(<%= cartCount %>)</a>
  	</div>
    <form class="d-flex" role="search">
      <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
      <button class="btn btn-outline-success" type="submit">Search</button>
    </form>
  </div>
</nav> 	