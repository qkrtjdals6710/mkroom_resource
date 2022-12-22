package com.beatphobia.mkroom.common.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.beatphobia.mkroom.domain.member.Member;
import com.beatphobia.mkroom.mapper.MemberMapper;

import lombok.Setter;

public class MemberUserDetailsService
			implements UserDetailsService {
	
	@Setter(onMethod_ = { @Autowired })
	private MemberMapper memberMapper;



	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		System.out.println(">>> loadUserByUsername:" + username);
		Member member = memberMapper.selectMember(username);
		System.out.println(">>> member:" + member);
		if (member == null) {
			System.out.println(">>> UsernameNotFoundException");
			throw new UsernameNotFoundException(username);
		}
		
		return new MemberUser(member);
	}
	
	
}
