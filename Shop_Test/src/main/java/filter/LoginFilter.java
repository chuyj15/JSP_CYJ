package filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import shop.dao.UserRepository;
import shop.dto.PersistentLogin;

/**
 * Servlet Filter implementation class LoginFilter
 */
@WebFilter("/LoginFilter")
public class LoginFilter extends HttpFilter implements Filter {

	@Override
	protected void doFilter(HttpServletRequest req, HttpServletResponse res, FilterChain chain)
			throws IOException, ServletException {
		
		
		Cookie[] cookie = req.getCookies();
		String userId = "";
		String token = "";
		for (int i=0; i<cookie.length; i++) {
			if ( cookie[i].getName().equals("rememberMe") ) {
				userId = cookie[i].getValue();
			}
			if ( cookie[i].getName().equals("token")) {
				token = cookie[i].getValue();
			}
			//테이블 조회
			UserRepository userRepository = new UserRepository();
			PersistentLogin persistentLogin = userRepository.selectTokenByToken(token);
			if ( persistentLogin.getUserId().equals(userId) ) {
				//자동로그인을 해줘야 함. 
				// ((HttpServletRequest) request).getSession(false);
				// ()안이 비어있으면 가져올 세션이 없을 시 새로 생성해버립니다. false를 주면 세션이 없을 시 null을 반환합니다.
				//세션에 등록
				HttpSession session = req.getSession(); 
				session.setAttribute("token", token);
			} else {
				//자동로그인 할 수 없음. 
			}
		}
		
	}
	
	
	
}
