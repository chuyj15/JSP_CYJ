<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	
	String root = request.getContextPath();
	// 자동 로그인, 토큰 쿠키 삭제
	Cookie[] cookies = request.getCookies();
	for (int i=0; i<cookies.length; i++){
		Cookie cookie = cookies[i];
		if (cookie.getName().equals("token")){
		cookie.setMaxAge(0);
		cookie.setPath(root);
		response.addCookie(cookie);
		}
		if (cookie.getName().equals("rememberMe")){
			cookie.setMaxAge(0);
			cookie.setPath(root);
			response.addCookie(cookie);
		}
	}
	
	// 세션 무효화
	session.removeAttribute("loginId");
	//session.invalidate();
	
	response.sendRedirect(root);
%>