package com.beatphobia.mkroom.service.review;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.beatphobia.mkroom.common.paging.ReviewCreatorDTO;
import com.beatphobia.mkroom.common.paging.ReviewDTO;
import com.beatphobia.mkroom.domain.quest.QuestDTO;
import com.beatphobia.mkroom.domain.review.Review;
import com.beatphobia.mkroom.mapper.ReviewMapper;

@Service
public class ReviewServiceImpl implements ReviewService{
	private ReviewMapper reviewMapper;
//	private QuestBookingMapper questBookingMapper;	//상단에 주석 친 3줄은 리뷰수를 구현하게 되면 사용 할 것이다. 알았느냐.
	
	public ReviewServiceImpl(ReviewMapper reviewMapper
//							,QuestBookingMapper questBookingMapper
							) {
		this.reviewMapper=reviewMapper;
//		this.questBookingMapper=questBookingMapper;
	}
	@Override
	public ReviewCreatorDTO getReviewList(ReviewDTO reviewDTO) {
		long replyTotalCnt=reviewMapper.selectReviewTotalCnt(reviewDTO);
		int pageNum=reviewDTO.getPageNum();
		
		ReviewCreatorDTO reviewCreatorDTO=null;
		if(replyTotalCnt==0) {
			reviewDTO.setPageNum(1);
			reviewCreatorDTO=new ReviewCreatorDTO(reviewDTO, 0, reviewMapper.selectReviewList(reviewDTO));
		}else {
			if(pageNum==-10) {
				pageNum=(int)Math.ceil(replyTotalCnt/(reviewDTO.getRowAmountPerPage()*1.0));
				reviewDTO.setPageNum(pageNum);
			}
			reviewCreatorDTO=new ReviewCreatorDTO(reviewDTO, reviewMapper.selectReviewTotalCnt(reviewDTO), reviewMapper.selectReviewList(reviewDTO));
		}
		return reviewCreatorDTO;
	}
	@Override
	public Review getReviewAvg(String questName, String branchLocation) {
		return reviewMapper.avgstar(questName, branchLocation);
	}
	@Override
	@Transactional
	public long registerReview(Review review) {
		reviewMapper.insertReview(review);
		return review.getRno();
	}
	@Override
	public Review getReview(String questName, String branchLocation, long rno) {
		return reviewMapper.selectReviewSearch(questName, branchLocation, rno);
	}
	@Override
	public int modifyReview(Review review) {
		return reviewMapper.updateReview(review);
	}
	@Override
	@Transactional
	public int removeReview(long rno) {
		int delRowCnt=reviewMapper.deleteReview(rno);
		return delRowCnt;
	}
	
	@Override
	@Transactional
	public int removeDetialReview(QuestDTO qusetDTO) {
		int delRowCnt=reviewMapper.deleteDetailReview(qusetDTO);
		return delRowCnt;
	}
	
}
