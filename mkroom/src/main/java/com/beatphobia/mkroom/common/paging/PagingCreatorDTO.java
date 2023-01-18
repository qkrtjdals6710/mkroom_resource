package com.beatphobia.mkroom.common.paging;

import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
public class PagingCreatorDTO {
	private PagingDTO pagingDTO; // 페이지당 레코드 개수와 현재 페이지 넘버가 저장됨
	private int startPagingNum; // 1, 11, 21 ...
	private int endPagingNum; // 10, 20, 30 ...
	private boolean prev;
	private boolean next;
	
	private long rowAmountTotal; // 레코드 총 개수
	private int pagingNumCnt = 10; // 1~10, 11~20 디폴트 10
	private int lastPageNum; // ceil(레코드총개수/페이지당 레코드개수)
	
	public PagingCreatorDTO(long rowAmountTotal, PagingDTO pagingDTO) {
		this.rowAmountTotal = rowAmountTotal;
		this.pagingDTO = pagingDTO;
		
		endPagingNum = ((int) Math.ceil( pagingDTO.getPageNum() / (pagingNumCnt*1.0)) ) * pagingNumCnt;
		startPagingNum = endPagingNum - pagingNumCnt + 1;
		
		
		lastPageNum = (int) Math.ceil(rowAmountTotal / (pagingDTO.getRowAmountPerPage()*1.0));
		prev = (startPagingNum > 1);
		next =  (lastPageNum > endPagingNum);
		
		if (!next) {
			endPagingNum = lastPageNum;
		}
	}
}
