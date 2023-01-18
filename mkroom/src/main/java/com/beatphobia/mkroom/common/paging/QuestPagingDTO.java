package com.beatphobia.mkroom.common.paging;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class QuestPagingDTO {

	private int pageNum;
	private int rowAmountPerPage;
	private String diffScope;
	private String locationScope;
	private String questTimeScope;
	private String dateScope;
	
	//인수 전달 없이 처음 페이지를 호출할 때 기본 값. 
	public QuestPagingDTO() {
		this.pageNum = 1;
		this.rowAmountPerPage = 4;
		
		LocalDate now = LocalDate.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy/MM/dd");
        String formatedNow = now.format(formatter);
		
		this.dateScope = formatedNow;
	}
	
	//페이지 번호 클릭 시
	public QuestPagingDTO(int pageNum) {
		
		if(pageNum <= 0) {
			this.pageNum = 1;
		} else {
			this.pageNum = pageNum;
		}
	
		this.rowAmountPerPage = 4;
	}
	
	//행 갯수 선택 시, 현재 페이지 번호와 갯수 전달. 
	public QuestPagingDTO(int pageNum, int rowAmountPerPage) {
		
		if(pageNum <= 0) {
			this.pageNum = 1;
		} else {
			this.pageNum = pageNum;
		}
	
		if(rowAmountPerPage <= 0) {
			this.rowAmountPerPage = 4;
		} else {
			this.rowAmountPerPage = rowAmountPerPage;
		}
		
	}
	
	
	
}
