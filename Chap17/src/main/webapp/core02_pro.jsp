<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <!-- taglib fn : jstl이 지원해주는 함수를 사용하고 싶은 경우 -->
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	//	String number= request.getParameter("number");
	%>
	
	<!-- param, request, response는 jstl의 내장객체임. -->
	<c:set var="number" value="${param.number}"/>
	숫자 : <c:out value="${number}"/>
	<hr>
	
	<!-- 다중조건-->
	<c:choose>
		<c:when test="${number % 2 == 0 }">
			<c:out value="${number}"/>은 짝수입니다.
		</c:when>
		<c:when test="${number % 2 == 1 }">
			<c:out value="${number}"/>은 홀수입니다.
		</c:when>
		<c:otherwise>
			숫자가 아닙니다. 
		</c:otherwise>
	</c:choose>
	
	<hr>
	
	<!-- c:if는 단독 조건문만 가능(else개념이 없음) -->
	<!-- 단일조건 -->
	<c:if test="${number % 2 == 0}">
		<c:out value="${number}"/>은 짝수 입니다. 
	</c:if>
	<c:if test="${number % 2 == 1}">
		<c:out value="${number}"/>은 홀수 입니다. 
	</c:if>
	<%-- <c:if test="${fn:length(number)}"> : 글자수
		숫자가 아닙니다.  
	</c:if> --%>
</body>
</html>