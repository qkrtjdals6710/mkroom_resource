package com.beatphobia.mkroom.common.paging;

import java.util.List;

import com.beatphobia.mkroom.domain.review.Review;

import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
public class ReviewCreatorDTO {
	private ReviewDTO reviewDTO;
	private int startPagingNum ;
	private int endPagingNum ;
	private boolean prev ;
	private boolean next ;
	private long rowAmountTotal ;
	private int pagingNumCnt ; 
	private int lastPageNum ;
	
	private List<Review> reviewList;

	public ReviewCreatorDTO(ReviewDTO reviewDTO, long rowAmountTotal, List<Review> reviewList) {
		this.reviewDTO = reviewDTO;
		this.rowAmountTotal = rowAmountTotal;
		this.reviewList = reviewList;
		this.pagingNumCnt = 5;
		
		this.endPagingNum=(int)(Math.ceil(reviewDTO.getPageNum()/(this.pagingNumCnt*1.0)))*this.pagingNumCnt;
		this.startPagingNum=this.endPagingNum-(this.pagingNumCnt-1);
		this.lastPageNum=(int)(Math.ceil((rowAmountTotal*1.0)/reviewDTO.getRowAmountPerPage()));
		if(this.lastPageNum<this.endPagingNum) {
			this.endPagingNum=this.lastPageNum;
		}
		this.prev=this.startPagingNum>1;
		this.next=this.endPagingNum<this.lastPageNum;
	}
}
