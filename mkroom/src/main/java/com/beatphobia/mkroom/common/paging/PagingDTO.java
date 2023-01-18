package com.beatphobia.mkroom.common.paging;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class PagingDTO {
	private int pageNum;
	private int rowAmountPerPage;
	private String scope;
	private String keyword;
	
	
	public PagingDTO() {
		this.pageNum = 1;
		this.rowAmountPerPage = 10;
	}

	
	
	public void setPageNum(int pageNum) {
		if (pageNum < 1) {
			this.pageNum = 1;
		} else {
			this.pageNum = pageNum;
		}
	}

	public void setRowAmountPerPage(int rowAmountPerPage) {
		if (rowAmountPerPage < 10) {
			this.rowAmountPerPage = 10;
		} else {
			this.rowAmountPerPage = rowAmountPerPage;
		}
	}



	public void setScope(String scope) {
		this.scope = scope;
	}



	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}



	
}
