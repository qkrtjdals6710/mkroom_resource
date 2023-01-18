package com.beatphobia.mkroom.domain.booking;

import java.util.Date;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@NoArgsConstructor
@ToString
public class BookingDataDTO {

//	BOOKINGNUM NUMBER (10)
//	TODAYDATE DATE
//	BRANCH_LOCATION VARCHAR2 (200 BYTE)
//	QUESTNAME VARCHAR2 (100 BYTE)
//	SELECTTIME NUMBER (4)
//	TEAMMEMBER VARCHAR2 (1000 BYTE)
	
	private long bookingNum;
	private Date todayDate;
	private String branchLoation;
	private String questName;
	private long selectTime;
	private String teamMember;
	private String username;
	
}
