package com.beatphobia.mkroom.common.security;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

public class LoginSuccessHandler implements AuthenticationSuccessHandler {

	
	
//	private final RequestCache requestCache = new HttpSessionRequestCache();
//	private final RedirectStrategy redirectStrategy = new DefaultRedirectStrategy();
//	//로그인 성공 시, 이전에 남아있는 로그인 실패 기록(에러 세션) 제거
//	protected void clearSession(HttpServletRequest request) {
//		HttpSession session = request.getSession(false);
//		if(session != null) {
//			session.removeAttribute(WebAttributes.AUTHENTICATION_EXCEPTION);
//		}
//	}
	
	
	
	@Override
	public void onAuthenticationSuccess
			(		HttpServletRequest request,
					HttpServletResponse response,
					Authentication authentication) throws IOException, ServletException {
		
		
		
//		clearSession(request);
		
		//이전 페이지의 uri를 세션에 저장하는 작업을 시큐리티가 수행하도록 한다. 
		//savedRequest에 이전 페이지의 uri를 저장하고 나서 login page로 redirect하여 이동. 
		//직접 로그인 페이지로 접근(로그인 버튼을 눌러)하면 null을 저장함. 
		//이 때는 세션에 저장한 uri를 사용하게 함. 
//		SavedRequest savedRequest = requestCache.getRequest(request, response);
//		
//		String prevPage = (String) request.getSession().getAttribute("prevPage");
//		if(prevPage != null) {
//			request.getSession().removeAttribute("prevPage");
//		}
//		
//		//직접 로그인 시 이동할 uri : 홈
//		String uri = "/";
//		
//		//이전 페이지가 존재할 때 사용할 uri 지정 
//		if(savedRequest != null) {
//			uri = savedRequest.getRedirectUrl();
//		} else if(prevPage != null && !prevPage.equals("")) {
//			
//			if(prevPage.contains("register") || prevPage.contains("login")) {
//				//회원가입 페이지 이후 곧바로 로그인 한 경우, 회원가입 페이지로 가지말고 홈으로. 
//				uri = "/";
//			} else {
//				uri = prevPage;
//			}
//			
//		}
//		
//		redirectStrategy.sendRedirect(request, response, uri);
		
		List<String> authList = new ArrayList<String>();
		authentication.getAuthorities()
				      .forEach(authority -> authList.add(authority.getAuthority()));
		
		if (authList.contains("ROLE_ADMIN")) {
			response.sendRedirect("/mkroom/");
		} else if (authList.contains("ROLE_MEMBER")) {
			response.sendRedirect("/mkroom/");
		}
	}

	
}
