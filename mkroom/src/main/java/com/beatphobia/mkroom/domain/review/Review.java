package com.beatphobia.mkroom.domain.review;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@ToString
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class Review {
	private long rno;
	private String questName;
	private String branchLocation;
	private int ratingStar; 
    private String rcontent; 
    private String rwriter;
    private String rregDate; 
    private String rmodDate;
	private String reviewAvg;
}
