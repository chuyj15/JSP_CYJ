<!-- 로그인 처리 -->
<%@page import="java.util.UUID"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="shop.dto.User"%>
<%@page import="shop.dao.UserRepository"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String root = request.getContextPath();
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	UserRepository userDAO = new UserRepository();
	User loginUser = userDAO.login(id, pw);
	//out.print(loginUser);
	
	// 아이디 저장
	String reIdIsChecked = request.getParameter("remember-id")==null ? "" : request.getParameter("remember-id");
	if (reIdIsChecked.equals("on")){
		//쿠키에 아이디랑 rememberId 저장하기
		Cookie cRememberId = new Cookie("rememberId", "on");
		Cookie cLoginId = new Cookie("loginId", id);
		response.addCookie(cRememberId);
		response.addCookie(cLoginId);
	} else {
		Cookie cRememberId = new Cookie("rememberId", "");
		Cookie cLoginId = new Cookie("loginId", "");
		cRememberId.setMaxAge(0);
		cLoginId.setMaxAge(0);
		response.addCookie(cRememberId);
		response.addCookie(cLoginId);
	}
		
		
		
	
	// 로그인 실패
	//아이디나 비번이 틀렸을 경우에는 다시 로그인 페이지로 이동 시킬거임
	if (loginUser ==null) {
		response.sendRedirect(root+"/user/login.jsp?error=0");
	}
	
	// 로그인 성공
	// - 세션에 아이디 등록
	if (loginUser != null){
		session.setAttribute("loginId", id);
		
		// 자동 로그인
		String token = "";
		String reMeIsChecked = ( request.getParameter("remember-me")==null ? "" : request.getParameter("remember-me")) ;
		if (reMeIsChecked != null || reMeIsChecked.equals("on")){
			//db에 토큰 생성
			token = userDAO.refreshToken(id);
			//쿠키 생성
			
			Cookie cToken = new Cookie("token", token);
			Cookie cRememberMe = new Cookie("rememberMe", reMeIsChecked);
			cToken.setMaxAge(60*60*24*7); //일주일
			cToken.setPath(root);
			response.addCookie(cToken);
			cRememberMe.setMaxAge(60*60*24*7); //일주일
			cRememberMe.setPath(root);
			response.addCookie(cRememberMe);
			//out.println("쿠키를 생성했습니다");
			//세션 생성
			session.setAttribute("loginId", id);
			//창을 다 끄면 세션을 해제. 쿠키는 남아있음. 
			//다시 창을 들어갈 때, 쿠키에 있는 토큰을 디비에 있는 토큰 값과 비교해서, 일치하면 
			//세션을 생성
			//그럼 자동로그인이 구현된다!!
			
			// 로그인 성공 페이지로 이동
			response.sendRedirect("complete.jsp?msg=0");	
		}
	}
	
	
	

%>





