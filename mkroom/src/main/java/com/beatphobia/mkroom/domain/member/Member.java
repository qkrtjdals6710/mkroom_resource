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
//	 USERID VARCHAR2 (50 BYTE)
//	 USERPW VARCHAR2 (100 BYTE)
//	 USERNAME VARCHAR2 (100 BYTE)
//	 PHONENUMBER VARCHAR2 (15 BYTE)
//	 EMAIL VARCHAR2 (200 BYTE)
//	 REGDATE TIMESTAMP (0)
//	 MODDATE TIMESTAMP (0)
//	 DISCOUNTCOUPON NUMBER (10)
//	 QUESTPOINT NUMBER (10)
//	 DROPFLG CHAR (1 BYTE)
//	 ENABLED CHAR (1 BYTE)
	
	private String userId;
	private String userPw;
	private String userName;
	private String phoneNumber;
	private String email;
	private Timestamp regDate;
	private Timestamp modDate;
	private long discountCoupon;
	private long questPoint;
	private String dropFlg;
	private String enabled;
	
	private List<MemberAuthority> authorityList;
	
	
}
