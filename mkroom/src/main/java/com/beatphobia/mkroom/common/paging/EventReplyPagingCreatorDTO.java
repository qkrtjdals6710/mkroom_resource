package com.beatphobia.mkroom.common.paging;

import java.util.List;

import com.beatphobia.mkroom.domain.noticeevent.NoticeEventReplyDTO;

import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
public class EventReplyPagingCreatorDTO {
	private EventReplyPagingDTO EventReplyPagingDTO;
	private int startPagingNum ;
	private int endPagingNum ;
	private boolean prev ;
	private boolean next ;
	private long rowAmountTotal ;
	private int pagingNumCnt ; 
	private int lastPageNum ;
	
	private List<NoticeEventReplyDTO> replyList;
	
	public EventReplyPagingCreatorDTO(long rowAmountTotal, EventReplyPagingDTO EventReplyPagingDTO, List<NoticeEventReplyDTO> replyList) {
		this.EventReplyPagingDTO=EventReplyPagingDTO;
		this.rowAmountTotal=rowAmountTotal;
		this.replyList=replyList;
		this.pagingNumCnt=10;
		
		this.endPagingNum=(int)(Math.ceil(EventReplyPagingDTO.getPageNum()/(this.pagingNumCnt*1.0)))*this.pagingNumCnt;
		this.startPagingNum=this.endPagingNum-(this.pagingNumCnt-1);
		this.lastPageNum=(int)(Math.ceil((rowAmountTotal*1.0)/EventReplyPagingDTO.getRowAmountPerPage()));
		if(this.lastPageNum<this.endPagingNum) {
			this.endPagingNum=this.lastPageNum;
		}
		this.prev=this.startPagingNum>1;
		this.next=this.endPagingNum<this.lastPageNum;
	}
}
