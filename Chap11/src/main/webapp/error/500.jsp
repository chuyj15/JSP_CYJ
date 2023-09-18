<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>500 에러</title>
</head>
<body>
	<h1>500 에러 페이지</h1>
	<h3>시스템 일시적인 에러가 발생하였습니다.</h3>
	<h5>관리자에게 문의해주세요</h5>
<!-- 	<a href="/Chap11/main.jsp">메인 페이지</a> -->
	<a href="<%= request.getContextPath() %>/main.jsp">메인 페이지</a>
	
	<!-- /를 해놓으면(루트를 해놓으면) Chap11을 무시하고 localhost/부터 시작함. -->
	<!-- 서버탭의 톰캣을 더블클릭하면 오버뷰, 모듈스라는 탭이 있는데 
	모듈스에 가면 chap01의 기본경로를 /Chap08로 해놓았음.
	그래서 상대경로를 지정해줘야 함.  -->
	
</body>
</html>