package com.beatphobia.mkroom.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.beatphobia.mkroom.common.paging.QnaReplyPagingDTO;
import com.beatphobia.mkroom.domain.qna.QnaReplyDTO;

public interface QnaReplyMapper {
	
	
	//QnA 게시물에 대한 댓글 목록 조회
	public List<QnaReplyDTO> selectQnaReplyList(QnaReplyPagingDTO qnaReplyPagingDTO);
	
	//특정QnA 게시물에 대한 댓글 등록
	public long insertQnaReplyForBoard(QnaReplyDTO qnaReplyDTO);
	
	//특정QnA 게시물에 대한 댓글에 대한 답글 등록
	public long insertQnaReplyForReply(QnaReplyDTO qnaReplyDTO);
	
	//특정QnA 게시물에 대한 특정 댓글/답글 조회
	public QnaReplyDTO selectQnaReply(@Param("bno") long bno, @Param("rno") long rno);
	
	//특정QnA 게시물에 대한 특정 댓글/답글 수정
	public int updateQnaReply(QnaReplyDTO qnaReply);
	
	//특정QnA 게시물에 대한 특정 댓글/답글 삭제
	public int deleteQnaReply(@Param("bno") long bno, @Param("rno") long rno);

	public long selectReplyTotalCnt(QnaReplyPagingDTO qnaReplyPagingDTO);

	//특정QnA 게시물 댓글/답글 수 변경: 삭제 시 -1, 추가 시 +1 
	public void updateBReplyCnt(@Param("bno") Long bno, @Param("amount") int amount);
	
	public long selectReplyTotalByBno(QnaReplyPagingDTO qnaReplyPaging);
	
}
