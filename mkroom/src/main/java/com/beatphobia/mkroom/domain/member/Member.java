package com.beatphobia.mkroom.domain.member;

import java.sql.Timestamp;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class Member {
	
	private String userId;
	private String userPw;
	private String userName;
	private String phoneNumber;
	private String email;
	private Timestamp regDate;
	private Timestamp modDate;
	private long discountCoupon;
	private long questPoint;
	private String branchLocation;
	private String enabled;
	
	private List<MemberAuthority> authorityList;
	
	
}
