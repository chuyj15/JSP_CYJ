<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>데이터 목록</h1>
	<table border="1">
		<c:forEach var="i" begin="1" end="10">
			<tr>
				<c:forEach var="j" begin="1" end="3">
					<td>데이터 ${j}</td>
				</c:forEach>
			</tr>
		</c:forEach>
	</table>
	
	<hr>
	
	<h1>리스트 목록</h1>
	
	<%
		ArrayList<String> list = new ArrayList<>();
		list.add("아메리카노");
		list.add("카페라떼");
		list.add("바닐라라떼");
		/*  
		pageContext : 페이지 스코프안에있는 내장객체 
		JAVA -> JSTL
		*/
		pageContext.setAttribute("list", list);
	%>
	
	<%-- 
	<c:set var="list" value="<%= new ArrayList() %>" scope="page"/>
	<c:set target="${list}" property="add" value="아이템1"/>
	<c:set target="${list}" property="add" value="아이템2"/>
	<c:set target="${list}" property="add" value="아이템3"/>
	 --%>
	 
	<c:forEach items="${list}" var="item">
		${item}
	</c:forEach>
	
</body>
</html>