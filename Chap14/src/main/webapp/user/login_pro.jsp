<%@page import="shop.dto.User"%>
<%@page import="shop.dao.UserRepository"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	//디비에있는 아이디, 패스워드랑 일치하는지 여부
	UserRepository userDAO = new UserRepository();
	User loginUser = userDAO.login(id, pw);
	
	//로그인 실패
	if (loginUser == null){
		out.println("로그인에 실패했음다");
		response.sendRedirect("login.jsp?error=0");
		return;
	}
	
	//로그인 성공
	// -세션에 아이디 등록
	session.setAttribute("loginId", id);
	//로그인 성공 페이지로 이동
	response.sendRedirect("complete.jsp?msg=0");
	
%>