
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
		<h1 class="display-5 fw-bold text-body-emphasis">회원정보 업뎃</h1>
	</div>
	
	<!-- 회원 가입/수정/탈퇴 완료 -->
	<div class="container mb-5">
		<%
		
			String msg = request.getParameter("msg");
			msg = msg==null ? "" : msg;
			String text = "쇼핑몰 사이트 입니다.";
		//그냥 complete.jsp로 링크이동하면, msg가 null이니까 스위치문에서 에러페이지가 나옵니다. 그래서 id=아무거나 넣어줘야 함. 
			switch(msg){
				case "0" :															 //0:로그인
					String loginId = (String) session.getAttribute("loginId");
					text = loginId + "님 환영합니다ദ്ദി*ˊᗜˋ*)" ; break;
				case "1" : text = "회원가입이 완료되었습니다☆｡ﾟ+.(人-ω◕ฺ)ﾟ+.ﾟ" ; break;		//1:회원가입
				case "2" : text = "회원가입이 수정되었습니다৲( ᵒ ૩ᵕ )৴♡*৹" ; break;		//2:회원수정
				case "3" : text = "회원정보가 삭제되었습니다;´༎ຶਊ ༎ຶ`; " ; break;			//3:회원삭제
			}
		%>
		<h1 class=""><%= text %></h1>
	</div>
	
	<!-- 메인화면으로 가는 버튼을 추가햇어요 -->
	<div class="d-grid gap-2 d-sm-flex justify-content-sm-center">
		<a href="<%= request.getContextPath() %>" class="btn btn-primary btn-lg px-4 gap-3">메인 화면</a>
	</div>
	
	<jsp:include page="/layout/footer.jsp" />
	<jsp:include page="/layout/script.jsp" />
</body>
</html>





