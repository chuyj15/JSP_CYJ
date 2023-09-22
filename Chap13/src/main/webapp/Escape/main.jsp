
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
<% String root = request.getContextPath(); %>
	<!-- 여기서 절대경로 / 는 webapp까지임~!  -->
	<jsp:include page="/layout/header.jsp" />
	<div class="px-4 py-5 my-5 text-center">
		<h1 class="display-5 fw-bold text-body-emphasis"></h1>
		<div class="col-lg-6 mx-auto">
			<p class="lead mb-4">방탈출 카페 메인 페이지</p>
			<div class="d-grid gap-2 d-sm-flex justify-content-sm-center">
			<%-- 	<a href="<%= request.getContextPath() %>/shop/products.jsp" class="btn btn-primary btn-lg px-4 gap-3">상품목록</a>
				<a href="<%= root%>/shop/products.jsp" class="btn btn-primary btn-lg px-4 gap-3">상품목록</a>
				<button type="button" class="btn btn-outline-secondary btn-lg px-4">로그인</button> --%>
			</div>
		</div>
	</div>
	
	<!-- 처음에 메인그림 들어가는 곳 -->
	<div class="main-container">
		<div class="" style="height : 700px; overflow: hidden;"><img src="img/mainimg.jpg" class="img-fluid" alt="..." style=""></div>
	</div>
	
	<!-- 마우스그림 들어가는 곳 -->
	<div  class="text-center">
		<div class="" style=""><img src="img/mouse.PNG" class="rounded" alt="..." style=""></div>
	</div>
	
	<!-- 당신이주인공입니다 페이지 들어가는 곳 -->
	<div class="main-container">
		<div class="" style="overflow: hidden;"><img src="img/youareone.PNG" class="img-fluid" alt="당신이주인공" style="width: 100%;"></div>
	</div>
	
	
	<!-- 방탈출 코스 목록을 보여줍니다.  -->
	<div class="container mb-5">
		<div class="row gy-4">
		<!-- 여기서부터 반복문을 돌려야 합니당~~~ 코스 테이블 -->
				<div class="col-md-6 col-xl-4 col-xxl-3">
					<div class="card p-3">
						<!-- 코스의 이미지 영역 -->
						<div class="img-content">
							<img src="img/coursesam.PNG" class="w-100 p-2" />					
						</div>
						
						<!-- 코스 -->
						<div class="content">
							<h3 class="text-center"> 코스이름</h3>
							<p>코스설명</p>
							<p class="text-end price">코스가격</p>
							<p class="text-end price">코스인기도</p>
							<p class="text-end price">코스진행시간</p>
						</div>
					</div>
				</div>

		</div>
	</div>
	
	</div>
	
	
	<jsp:include page="/layout/footer.jsp" />
	<jsp:include page="/layout/script.jsp" />
</body>
</html>





