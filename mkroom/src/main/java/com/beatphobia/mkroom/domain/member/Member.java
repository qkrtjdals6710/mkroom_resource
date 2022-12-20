package com.beatphobia.mkroom.domain.member;

import java.sql.Timestamp;

import lombok.ToString;

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
	private int discountCoupon;
	private int questPoint;
	private String dropFlg;
	private String enabled;
	
	public Member() {
		
	}

	public Member(String userId, String userPw, String userName, String phoneNumber, String email,
			Timestamp regDate, Timestamp modDate, int discountCoupon, int questPoint, String dropFlg, String enabled) {
		this.userId = userId;
		this.userPw = userPw;
		this.userName = userName;
		this.phoneNumber = phoneNumber;
		this.email = email;
		this.regDate = regDate;
		this.modDate = modDate;
		this.discountCoupon = discountCoupon;
		this.questPoint = questPoint;
		this.dropFlg = dropFlg;
		this.enabled = enabled;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserPw() {
		return userPw;
	}

	public void setUserPw(String userPw) {
		this.userPw = userPw;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Timestamp getRegDate() {
		return regDate;
	}

	public void setRegDate(Timestamp regDate) {
		this.regDate = regDate;
	}

	public Timestamp getModDate() {
		return modDate;
	}

	public void setModDate(Timestamp modDate) {
		this.modDate = modDate;
	}

	public int getDiscountCoupon() {
		return discountCoupon;
	}

	public void setDiscountCoupon(int discountCoupon) {
		this.discountCoupon = discountCoupon;
	}

	public int getQuestPoint() {
		return questPoint;
	}

	public void setQuestPoint(int questPoint) {
		this.questPoint = questPoint;
	}

	public String getDropFlg() {
		return dropFlg;
	}

	public void setDropFlg(String dropFlg) {
		this.dropFlg = dropFlg;
	}

	public String getEnabled() {
		return enabled;
	}

	public void setEnabled(String enabled) {
		this.enabled = enabled;
	}
	
	
	
}
