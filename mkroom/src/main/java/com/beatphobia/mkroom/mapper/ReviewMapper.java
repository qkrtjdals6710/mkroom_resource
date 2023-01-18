package com.beatphobia.mkroom.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.beatphobia.mkroom.common.paging.ReviewDTO;
import com.beatphobia.mkroom.domain.quest.QuestDTO;
import com.beatphobia.mkroom.domain.review.Review;

public interface ReviewMapper {
 public List<Review> selectReviewList(ReviewDTO reviewDTO);
 public long selectReviewTotalCnt(ReviewDTO reviewDTO);
 public Review avgstar(@Param("questName") String questName, @Param("branchLocation") String branchLocation);
 public long insertReview(Review review);
 public Review selectReviewSearch(@Param("questName") String questName, @Param("branchLocation") String branchLocation, @Param("rno") long rno);
 public int updateReview(Review review);
 public int deleteReview(@Param("rno") long rno);
 public int deleteDetailReview(QuestDTO questDTO);
}
