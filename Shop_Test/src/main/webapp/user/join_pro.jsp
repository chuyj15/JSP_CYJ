<!-- 
	회원 가입 처리
 -->
<%@page import="shop.dao.UserRepository"%>
<%@page import="shop.dto.User"%>
<jsp:useBean id="userDAO" class="shop.dao.UserRepository"></jsp:useBean>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String root = request.getContextPath();
	User user = new User();
	userDAO.toString();	
	
	String id = request.getParameter("id");
	String password = request.getParameter("pw");
	String name = request.getParameter("name");
	String gender = request.getParameter("gender");
	String year = request.getParameter("year");
	String month = request.getParameter("month");
	String day = request.getParameter("day");
	// 1996/03/04
	String birth = year+"/"+month+"/"+day;
	String email1 = request.getParameter("email1");
	String email2 = request.getParameter("email2");
	String mail = email1+"@"+email2;
	//01034716517
	String phone = request.getParameter("phone");
	String address = request.getParameter("address");
	
	user.setId(id);
	user.setPassword(password);
	user.setName(name);
	user.setGender(gender);
	user.setBirth(birth);
	user.setMail(mail);
	user.setPhone(phone);
	user.setAddress(address);
	
	int result = userDAO.insert(user);
	out.print(result);
	
	response.sendRedirect(root + "/user/complete.jsp?msg=1");
%>
    
    

    
    
    
    
    
    