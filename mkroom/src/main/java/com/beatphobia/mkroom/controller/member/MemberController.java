package com.beatphobia.mkroom.controller.member;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.beatphobia.mkroom.domain.member.Member;
import com.beatphobia.mkroom.domain.member.MemberAuthority;
import com.beatphobia.mkroom.service.member.MemberService;

@Controller
@RequestMapping("/member")
public class MemberController {
	
	public MemberService memberService;
	
	@Autowired
	private BCryptPasswordEncoder encoder;
	
	public MemberController(MemberService memberService) {
		this.memberService = memberService;
	}
	
	// 회원가입페이지
	// GET  /member/register
	@GetMapping("/register")
	public void showMemberRegisterPage() {
		
	}
	
	// POST /member/register
	@PostMapping("/register")
	public String insertMember(Member member, Model model) {
		List<MemberAuthority> authorities = new ArrayList<MemberAuthority>();
		authorities.add(new MemberAuthority(member.getUserId(), "ROLE_MEMBER"));
		member.setAuthorityList(authorities);
		member.setUserPw(encoder.encode(member.getUserPw()));
		memberService.insertMember(member);
		
		
		return "redirect:/member/detail";
	}
	
	
	
	// 회원정보 수정페이지 
	// GET /member/modify
	@PreAuthorize("(isAuthenticated() && principal.username == #member.userId) or hasAuthority('ROLE_ADMIN')")
	@GetMapping("/modify")
	public void showMemberModifyPage(Member member, Model model) {
		model.addAttribute("member", 
				memberService.selectMember( member.getUserId() ) );
	}
	
	// POST /member/update
	@PreAuthorize("(isAuthenticated() && principal.username == #member.userId) or hasAuthority('ROLE_ADMIN')")
	@PostMapping("/update")
	public String updateMember(Member member, RedirectAttributes redirectAttributes) {
		Member updatedMember = memberService.selectMember(member.getUserId());
		updatedMember.setUserName(member.getUserName());
		updatedMember.setPhoneNumber(member.getPhoneNumber());
		updatedMember.setEmail(member.getEmail());
		
		memberService.updateMember(updatedMember);
		redirectAttributes.addAttribute("userId", updatedMember.getUserId());
		return "redirect:/member/detail";
	}
	
	// POST /member/updatePw
	@PreAuthorize("(isAuthenticated() && principal.username == #member.userId) or hasAuthority('ROLE_ADMIN')")
	@PostMapping("/updatePw")
	public String updateMemberPw(Member member, String newPw, String reEnterPw, RedirectAttributes redirectAttributes) {
		Member updatedMember = memberService.selectMember(member.getUserId());
		
		
		redirectAttributes.addAttribute("userId", updatedMember.getUserId());
	
		
		if (newPw == null || reEnterPw == null || !newPw.equals(reEnterPw)) {
			redirectAttributes.addAttribute("updatePw", "reEnterError");
			return "redirect:/member/detail";
		}
		updatedMember.setUserPw(encoder.encode(newPw));
		redirectAttributes.addAttribute("updatePw", "Success");
		memberService.updateMember(updatedMember);
		return "redirect:/member/detail";
	}
	
	// POST /member/delete
	@PreAuthorize("(isAuthenticated() && principal.username == #member.userId) or hasAuthority('ROLE_ADMIN')")
	@PostMapping("/delete")
	public String deleteMember(Member member) {
		memberService.deleteMember(member.getUserId());	
		return "redirect:/member/register";
	}
	
	
	// 회원상세페이지
	// GET /member/detail
	@PreAuthorize("(isAuthenticated() && principal.username == #member.userId) or hasAuthority('ROLE_ADMIN')")
	@GetMapping("/detail") 
	public void showMemberDetail(Member member, Model model) {

		Member theMember = memberService.selectMember( member.getUserId() );
		model.addAttribute("member", theMember);
	}
	
	// 회원목록페이지
	// GET /member/list
	@PreAuthorize("hasAuthority('ROLE_ADMIN')")
	@GetMapping("/list")
	public void showMemberListPage(Model model) {
		model.addAttribute("memberList",
				memberService.selectMemberList() );
	}
	
	


}
