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

	@Override
	public void onAuthenticationSuccess
			(		HttpServletRequest request,
					HttpServletResponse response,
					Authentication authentication) throws IOException, ServletException {
		
		System.out.println(">>> onAuthenticationSuccess");
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
