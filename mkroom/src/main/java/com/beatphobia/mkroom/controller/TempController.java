package com.beatphobia.mkroom.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller("/")
public class TempController {
	
	@GetMapping("/onepage")
	public void showOnePage() {
		
	}
	
	@GetMapping("/niceadmin")
	public void showNiceAdmin() {
		
	}
}
