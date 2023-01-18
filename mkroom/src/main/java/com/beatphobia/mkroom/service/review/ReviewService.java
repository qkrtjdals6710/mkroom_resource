package com.beatphobia.mkroom.service.review;

import com.beatphobia.mkroom.common.paging.ReviewCreatorDTO;
import com.beatphobia.mkroom.common.paging.ReviewDTO;
import com.beatphobia.mkroom.domain.quest.QuestDTO;
import com.beatphobia.mkroom.domain.review.Review;

public interface ReviewService {
	public ReviewCreatorDTO getReviewList(ReviewDTO reviewDTO);
	public Review getReviewAvg(String questName, String branchLocation);
	public long registerReview(Review review);
	public Review getReview(String questName, String branchLocation, long rno);
	public int modifyReview(Review review);
	public int removeReview(long rno);
	public int removeDetialReview(QuestDTO qusetDTO);
}
