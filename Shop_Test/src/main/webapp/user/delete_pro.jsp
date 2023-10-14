<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="userDAO" class="shop.dao.UserRepository" />

<%
    String root = request.getContextPath();
	String id = request.getParameter("id");
	userDAO.delete(id);
	
	//세션 해제
	session.invalidate();
	//쿠키 해제
	Cookie[] cookies = request.getCookies();
	for (int i=0; i<cookies.length; i++){
		Cookie cookie = cookies[i];
		//아이디저장쿠키삭제
		if (cookie.getName().equals("rememberId")){
			cookie.setMaxAge(0);
		}
		if (cookie.getName().equals("loginId")){
			cookie.setMaxAge(0);
		}
		if (cookie.getName().equals("token")){
			cookie.setMaxAge(0);
		}
		if (cookie.getName().equals("rememberMe")){
			cookie.setMaxAge(0);
		}
		response.addCookie(cookie);
	}
	
	
	response.sendRedirect(root + "/user/complete.jsp?msg=3");
%>
