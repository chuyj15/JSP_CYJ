<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%--대문자로 변환하는 메소드 --%>
	<%--선언문 --%>
	<%! 
		String makeUpperCase(String str){
			return str.toUpperCase();
		}
	%>
	<%-- 스크립틀릿 --%>
	<h1><% out.println(makeUpperCase("hello jsp~!")); %></h1>
	
</body>
</html>