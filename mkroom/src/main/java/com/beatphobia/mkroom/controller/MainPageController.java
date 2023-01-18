package com.beatphobia.mkroom.controller;

import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;

import com.beatphobia.mkroom.service.quest.QuestBookingService;
import com.beatphobia.mkroom.service.review.ReviewService;

import lombok.AllArgsConstructor;

	
@Controller
@AllArgsConstructor
@RequestMapping("/*" )
@EnableWebMvc
public class MainPageController {
	
	private QuestBookingService questBookingService ;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String main(Locale locale, Model model) {
		
		model.addAttribute("questList", questBookingService.selectAllQuestInfo());
		
		return "main";
	}
	
	
	
	
}//end
