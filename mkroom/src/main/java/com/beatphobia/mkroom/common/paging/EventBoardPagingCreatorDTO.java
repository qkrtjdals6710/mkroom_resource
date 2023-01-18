package com.beatphobia.mkroom.common.paging;

import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
public class EventBoardPagingCreatorDTO {

	private EventBoardPagingDTO eventBoardPagingDTO ;
	private int startPagingNum ;
	private int endPagingNum ;
	private boolean prev ;
	private boolean next ;
	private long rowAmountTotal ;
	private int pagingNumCnt ;  //특정 개수를 지정 
	private int lastPageNum ;
	
	public EventBoardPagingCreatorDTO(long rowAmounTotal, EventBoardPagingDTO eventBoardPagingDTO) {
		System.out.println("EventBoardPagingCreatorDTO 실행");
		
		this.eventBoardPagingDTO = eventBoardPagingDTO ;
		this.rowAmountTotal = rowAmounTotal ;
		this.pagingNumCnt = 10 ;
		
		//계산된 끝 페이징 번호:
		this.endPagingNum = (int)( Math.ceil(eventBoardPagingDTO.getPageNum() / (this.pagingNumCnt * 1.0)) ) * this.pagingNumCnt ;
	
		//계산된 시작 페이징 번호:
		this.startPagingNum = this.endPagingNum - (this.pagingNumCnt - 1) ;

		//(int) ( Math.ceil( ((double)전체 게시물 총수) / 페이지당 표시되는 행수  ) )
		//행 총수를 기준으로 한 실제 마지막 페이지 번호 저장
		this.lastPageNum = (int)( Math.ceil( (rowAmounTotal * 1.0) / eventBoardPagingDTO.getRowAmountPerPage() ) ) ;
		
		//계산된 끝 페이징 번호가 실제 마지막 페이지 번호보다 크면, endPagingNum 값을 lastPageNum 값으로 대체
		if (this.lastPageNum < this.endPagingNum ) {
			this.endPagingNum = this.lastPageNum ;
		}
		
		//이전 버튼 표시 여부
		this.prev = this.startPagingNum > 1 ;
		
		//다음 버튼 표시 여부
		this.next = this.endPagingNum < this.lastPageNum ;
		
		
	}
	

}
