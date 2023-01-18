package com.beatphobia.mkroom.domain.member;

import lombok.ToString;

@ToString
public class MemberAuthorities {

	
	private String userId;
	private String authority;
	
	public MemberAuthorities() {
		
	}

	public MemberAuthorities(String userId, String authority) {
		super();
		this.userId = userId;
		this.authority = authority;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getAuthority() {
		return authority;
	}

	public void setAuthority(String authority) {
		this.authority = authority;
	}
	
	
	

}
