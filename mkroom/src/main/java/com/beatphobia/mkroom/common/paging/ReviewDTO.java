package com.beatphobia.mkroom.common.paging;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class ReviewDTO {
	private String questName;
	private String branchLocation;
	private Integer	pageNum;
	private int rowAmountPerPage;
	
	public ReviewDTO(String questName, String branchLocation, Integer pageNum) {
		this.questName = questName;
		this.branchLocation=branchLocation;
		if(pageNum == null) {
			this.pageNum = 1 ;
		} else {
			this.pageNum = pageNum;
		}
		this.rowAmountPerPage = 5 ;
	}
}
