package com.beatphobia.mkroom.common.payment;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.beatphobia.mkroom.domain.member.Member;
import com.beatphobia.mkroom.service.member.MemberService;

import lombok.AllArgsConstructor;


@Controller
@AllArgsConstructor
public class PaymentController {
	
	private MemberService memberService;
	
	@PreAuthorize("(isAuthenticated() && principal.username == #member.userId)")
	@GetMapping("/payment")
	public String showPaymentPage(Member member, Model model) {
		Member theMember =  memberService.selectMember(member.getUserId());
		model.addAttribute("member", theMember);
		return "common/payment";
	}
	

}
