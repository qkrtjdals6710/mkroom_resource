package com.beatphobia.mkroom.controller.member;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import com.beatphobia.mkroom.domain.member.Member;
import com.beatphobia.mkroom.service.member.MemberService;

@RestController
public class MemberRestController {
	
	private MemberService memberService;
	
	public MemberRestController(MemberService memberService) {
		this.memberService = memberService;
	}
	
	
	@GetMapping("/validateUserId/{userId}")
	public ResponseEntity<String> validateUserId(@PathVariable String userId) {
		
		Member member = memberService.selectMember(userId);
		System.out.println(">>> " + member);	
		HttpHeaders httpHeaders = new HttpHeaders();
		httpHeaders.add("Content-Type", "text/plain;charset=UTF-8");
		if (member != null) {
			return new ResponseEntity<String>("이미 존재하는 아이디입니다", httpHeaders, HttpStatus.BAD_REQUEST);
		} 
		return new ResponseEntity<String>("유효한 아이디입니다", httpHeaders, HttpStatus.OK);
	}
	
	@GetMapping("/checkUserId/{userId}")
	public ResponseEntity<String> checkUserId(@PathVariable String userId) {
		Member member = memberService.selectMember(userId);
		
		HttpHeaders httpHeaders = new HttpHeaders();
		httpHeaders.add("Content-Type", "text/plain;charset=UTF-8");
		
		if (member == null) {
			return new ResponseEntity<String>("존재하지 않는 아이디입니다", httpHeaders, HttpStatus.BAD_REQUEST);
		}
		return new ResponseEntity<String>("유효한 아이디입니다", httpHeaders, HttpStatus.OK);
	}
}
