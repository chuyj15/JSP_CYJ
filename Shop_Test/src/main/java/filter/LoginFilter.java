package filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import shop.dao.UserRepository;
import shop.dto.PersistentLogin;

/**
 * Servlet Filter implementation class LoginFilter
 */
@WebFilter("/LoginFilter")
public class LoginFilter extends HttpFilter implements Filter {
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		System.out.println("LoginFilter init메서드 호출");
	} 
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		System.out.println("LoginFilter doFilter메서드 호출");
		Cookie[] cookies = ((HttpServletRequest) request).getCookies();
		//질문. 여기서쿠키가 안가져와짐. 
		System.out.println("LoginFilter cookie 가져오기");
		String cToken = "";
		String cRememberMe = "";
		if (cookies != null) {
			for (int i=0; i<cookies.length; i++) {
				Cookie cookie = cookies[i];
				System.out.println("LoginFilter cookie for문");
				if (cookie.getName().equals("token") ) {
					cToken = cookie.getValue();
				}
				if (cookie.getName().equals("rememberMe") ) {
					cRememberMe = cookie.getValue();
				}
			}
			//디비에서 토큰으로 토큰정보 조회
			HttpSession session = ((HttpServletRequest) request).getSession();
			UserRepository userDAO = new UserRepository();
			System.out.println("로그인필터 : 디비에서 토큰정보 조회 ");
			PersistentLogin persistLogin = userDAO.selectTokenByToken(cToken) == null ? null : userDAO.selectTokenByToken(cToken)  ;
			System.out.println("로그인필터 : persistLogin객체 생성 ");
			if (persistLogin != null) {
				System.out.println("로그인필터 : " + persistLogin.toString());
				String tokenn = persistLogin.getToken();
				System.out.println("로그인필터의 토큰 : "+tokenn);
				System.out.println("로그인필터의 토큰 : "+cToken);
				String idd = persistLogin.getUserId();
				if (tokenn != null && !tokenn.isEmpty() ) {
					if (tokenn.equals(cToken) && cRememberMe.equals("on") ) {
						String userId = persistLogin.getUserId();
						session.setAttribute("loginId", userId);
						System.out.println("로그인필터 : 로그인세션 생성 ");
					}
				}
			}
		}
		chain.doFilter(request, response);
	}

	@Override
	public void destroy() {
		System.out.println("LoginFilter destroy메서드 호출");
	}
	
}
