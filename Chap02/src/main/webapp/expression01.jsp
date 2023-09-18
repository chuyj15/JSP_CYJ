<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%-- 
		선언문	: 변수 선언 0, 메소드 정의 0
					- _jspService( ) 외부에 변수 선언
		스크립틀릿	: 변수 선언 0, 메소드 정의 X
					- _jspService( ) 내부에 변수 선언
	--%>
	<%!
		int a = 100;
	%>
	<%-- 스크립틀릿안의 a변수가 적용되어서 60이 나옴. 
		왜냐면 jspservice메소드안에 스크립틀릿과 표현문이 있기 때문에~!
	 --%>
	<%
		int a = 10;
		int b = 20;
		int c = 30;
	%>
	<%= a+b+c %>
</body>
</html>