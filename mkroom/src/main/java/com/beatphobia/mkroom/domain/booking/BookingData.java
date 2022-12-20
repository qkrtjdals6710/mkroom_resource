package com.beatphobia.mkroom.domain.booking;

import java.util.Date;

import lombok.ToString;

@ToString
public class BookingData {

//	BOOKINGNUM NUMBER (10)
//	TODAYDATE DATE
//	BRANCH_LOCATION VARCHAR2 (200 BYTE)
//	QUESTNAME VARCHAR2 (100 BYTE)
//	SELECTTIME NUMBER (4)
//	TEAMMEMBER VARCHAR2 (1000 BYTE)
	
	private int bookingNum;
	private Date todayDate;
	private String branchLoation;
	private String questName;
	private int selectTime;
	private String teamMember;
	
	public BookingData() {
		
	}

	public BookingData(int bookingNum, Date todayDate, String branchLoation, String questName, int selectTime,
			String teamMember) {
		this.bookingNum = bookingNum;
		this.todayDate = todayDate;
		this.branchLoation = branchLoation;
		this.questName = questName;
		this.selectTime = selectTime;
		this.teamMember = teamMember;
	}

	public int getBookingNum() {
		return bookingNum;
	}

	public void setBookingNum(int bookingNum) {
		this.bookingNum = bookingNum;
	}

	public Date getTodayDate() {
		return todayDate;
	}

	public void setTodayDate(Date todayDate) {
		this.todayDate = todayDate;
	}

	public String getBranchLoation() {
		return branchLoation;
	}

	public void setBranchLoation(String branchLoation) {
		this.branchLoation = branchLoation;
	}

	public String getQuestName() {
		return questName;
	}

	public void setQuestName(String questName) {
		this.questName = questName;
	}

	public int getSelectTime() {
		return selectTime;
	}

	public void setSelectTime(int selectTime) {
		this.selectTime = selectTime;
	}

	public String getTeamMember() {
		return teamMember;
	}

	public void setTeamMember(String teamMember) {
		this.teamMember = teamMember;
	}
	
	
}
