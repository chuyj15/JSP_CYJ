<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL</title>
</head>
<body>
	<!-- 
	 * 실행순서
	 HTML -> CSS -> JavaScript -> 스크립틀릿(자바) -> JSTL 
	 -->
	
	<!-- 스크립틀릿 변수 선언 -->
	<% String name = "김조은"; %>
	<!-- 스크립틀릿 변수 출력 -->
	<% out.println(name); %>
	
	<hr>
	
	<!-- JSTL 변수 선언 -->
<%--	<c:set var="변수명" value="값"/> --%>
	<c:set var="name" value="추윤주"/>
	
	<!-- JSTL 출력 -->
	<%-- <%== name %> --%> <!-- jstl 선언한 변수는 표현문으로 사용 불가 -->
	<c:out value="name"/> <!-- 그냥 name으로 출력됨 -->
	<c:out value="${name}"/>
	
	<!-- 스크립틀릿이랑 JSTL 변수는 서로 공유되지는 않는 것 같다.  -->

</body>
</html>