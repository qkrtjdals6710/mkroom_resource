package com.beatphobia.mkroom.domain.booking;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@ToString
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class QuestBookingData {
	
	private long bookingNum;
	private String questName;
	private String branchLocation;
	private Date selectTime;
	private String teamMember;
	private String userId;
	private String impUid;
	
}
