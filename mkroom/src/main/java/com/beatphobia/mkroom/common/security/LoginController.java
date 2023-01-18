package com.beatphobia.mkroom.common.security;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class LoginController {

	@GetMapping("/login")
	public String showLoginPage(HttpServletRequest request, String error, String logout, Model model) {
	
		if (error != null) { 
			model.addAttribute("error", "로그인 오류. 계정이나 암호를 확인하세요");
		}
		
		if (logout != null) {
			model.addAttribute("logout", "로그아웃 후에 호출된 로그인 페이지 입니다");
		}
		
		//권한이 없는 페이지에 대해서 login form 페이지로 redirect됨. 
//		이전 페이지에 대한 url을 Referer 헤더로 request에 가지고 있으니 이를 활용. 
//		String beforeUri = request.getHeader("Referer");
		
		//null이면 이전 페이지가 없음 + /login 이 붙었다면 로그인을 한 번 실패한 상태로,
		//다시 로그인 창으로 돌아갈 필요는 없음. 
//		if(beforeUri != null && !beforeUri.contains("/login")) {
//			request.getSession().setAttribute("prevPage", beforeUri);
//		}
		
		return "common/login";
		
	}
	

}
