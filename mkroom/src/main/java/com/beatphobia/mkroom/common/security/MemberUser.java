package com.beatphobia.mkroom.common.security;

import java.util.stream.Collectors;

import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.crypto.password.PasswordEncoder;

import com.beatphobia.mkroom.domain.member.Member;

public class MemberUser extends User {

	private static final long serialVersionUID = 1L;
	
	private Member member;
	
	
	
	public MemberUser(Member member) {
		super(member.getUserId(),
				member.getUserPw(),
				member.getAuthorityList()
				          .stream()  
				          .map(auth -> new SimpleGrantedAuthority(auth.getAuthority())) 
				          .collect(Collectors.toList())  
		);
		System.out.println(">>> MemberUser" + member);
		this.member = member;
	}
	
	
	
	
}
