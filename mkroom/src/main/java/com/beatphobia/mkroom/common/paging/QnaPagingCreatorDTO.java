package com.beatphobia.mkroom.common.paging;

import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
public class QnaPagingCreatorDTO {

	private QnaPagingDTO qnaPagingDTO;
	private int startPagingNum;
	private int endPagingNum;
	private boolean prev;
	private boolean next;
	private long rowAmountTotal;
	private int pagingNumCnt;
	private int lastPageNum;

	public QnaPagingCreatorDTO(long rowAmounTotal, QnaPagingDTO qnaPagingDTO) {
		this.qnaPagingDTO = qnaPagingDTO;
		this.rowAmountTotal = rowAmounTotal;
		this.pagingNumCnt = 10;

		this.endPagingNum = (int) (Math.ceil(qnaPagingDTO.getPageNum() / (this.pagingNumCnt * 1.0)))
				* this.pagingNumCnt;

		this.startPagingNum = this.endPagingNum - (this.pagingNumCnt - 1);

		this.lastPageNum = (int) (Math.ceil((rowAmounTotal * 1.0) / qnaPagingDTO.getRowAmountPerPage()));

		if (this.lastPageNum < this.endPagingNum) {
			this.endPagingNum = this.lastPageNum;
		}

		this.prev = this.startPagingNum > 1;

		this.next = this.endPagingNum < this.lastPageNum;

		System.out.println("전달된 페이징 기본데이터-qnaPagingDTO: " + qnaPagingDTO.toString());
		System.out.println("끝 페이징번호: " + this.endPagingNum);
		System.out.println("시작 페이징번호: " + this.startPagingNum);
		System.out.println("이전버튼 표시 여부: " + this.prev);
		System.out.println("다음버튼 표시 여부: " + this.next);
		System.out.println("마지막 페이지 번호: " + this.lastPageNum);

	}

}
