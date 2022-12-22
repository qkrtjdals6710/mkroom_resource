package com.beatphobia.mkroom.common.security;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ErrMsgController {

	@GetMapping("/accessForbiddenError")
	public String showAccessForbiddenPage(Authentication authentication, Model model) {
		
		model.addAttribute("msg", "접근이 금지됨");
		
		return "common/err_msg/accessForbiddenMsg";
	}
}
