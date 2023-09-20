<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
		<jsp:include page="/layout/link.jsp" />
</head>
<body>  
<% String root = request.getContextPath(); 
String loginId = (String) session.getAttribute("loginId");

%>
	<!-- 여기서 절대경로 / 는 webapp까지임~!  -->
	<jsp:include page="/layout/header.jsp" />
	<div class="px-4 py-5 my-5 text-center">
		<h1 class="display-5 fw-bold text-body-emphasis">메인화면</h1>
		<div class="col-lg-6 mx-auto">
			<p class="lead mb-4">Shop 쇼핑몰 입니다.</p>
			<div class="d-grid gap-2 d-sm-flex justify-content-sm-center">
				<!-- button 태그로 이동하기 -->
				<!-- 
				<button type="button" class="btn btn-primary btn-lg px-4 gap-3" 
					onclick="location.href='./products.jsp'">상품목록</button>
				 -->
				<!-- a 태그 버튼 -->
				<!-- request.getContextPath() 는 챕터만 가지고 와주는 거임.  -->
				<%-- <a href="<%= request.getContextPath() %>/shop/products.jsp" class="btn btn-primary btn-lg px-4 gap-3">상품목록</a> --%>
				<a href="<%= root%>/shop/products.jsp" class="btn btn-primary btn-lg px-4 gap-3">상품목록</a>
<%
if (loginId == null || loginId.equals("")){
%>
				<a href="<%= root%>/user/login.jsp" class="btn btn-outline-secondary btn-lg px-4">로그인</a>
<%
} else {
%>
				<a href="<%= root%>/user/logout.jsp" class="btn btn-outline-secondary btn-lg px-4">로그아웃</a>

<%
}
%>				
			</div>
		</div>
	</div>
	<jsp:include page="/layout/footer.jsp" />
	<jsp:include page="/layout/script.jsp" />
</body>
</html>





