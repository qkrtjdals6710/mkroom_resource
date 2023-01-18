package com.beatphobia.mkroom.common.mail;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ContactUsController {

	@GetMapping("/contact")
	public String showContactPage() {
		return "/common/contact";
	}
}
