<%-- 라이브러리를 포함해주는 태그입니당--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%-- WEB-INF >lib : jstl-xxx-impl.jar 라이브러리 추가 --%>
<%
	for ( int k=1; k<=10; k++){
		out.print(k+" ");
	}
%>
<hr>
	<c:forEach var="k" begin="1" end="10" step="1">
	<span style></span>
		<c:out value="${k}" />
	</c:forEach>
</body>
</html>