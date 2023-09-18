<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>로그인에 성공했습니다. </h3>
	
	<%	
		//out.print(request.getContentType());
		request.setCharacterEncoding("UTF-8");
	//<%@ page language="java" contentType="text/html; charset=UTF-8" <-여기랑 같아야 됨.
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String name = request.getParameter("name");
		String age = request.getParameter("age");
		
		
	%>
	
	<p>아이디 : <%= id %></p>
	<p>비번 : <%= pw %></p>
	<p>이름 : <%= name %></p>
	<p>나이 : <%= age %></p>
</body>
</html>