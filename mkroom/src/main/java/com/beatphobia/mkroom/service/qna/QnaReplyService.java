package com.beatphobia.mkroom.service.qna;

import com.beatphobia.mkroom.common.paging.QnaReplyPagingCreatorDTO;
import com.beatphobia.mkroom.common.paging.QnaReplyPagingDTO;
import com.beatphobia.mkroom.domain.qna.QnaReplyDTO;

public interface QnaReplyService {

	//특정 QnA 게시물에 대한 댓글 목록 조회-페이징 고려
	public QnaReplyPagingCreatorDTO getReplyList(QnaReplyPagingDTO qnaReplyPagingDTO) ;
	
	//특정 QnA 게시물의 댓글 총 개수확인
	public long getReplyTotalCnt(QnaReplyPagingDTO qnaReplyPagingDTO) ;
	
	//특정 QnA 게시물에 대한 댓글 등록: rno 반환
	public long registerReplyForBoard(QnaReplyDTO qnaReplyDTO) ;
	
	//QnA 게시물의 특정 댓글에 대한 답글 등록: rno 반환
	public long registerReplyForReply(QnaReplyDTO qnaReplyDTO) ;
	
	//특정 QnA 게시물에 대한 특정 댓글/답글 조회
	public QnaReplyDTO getReply(long bno, long rno);
	
	//특정 QnA 게시물에 대한 특정 댓글/답글 수정
	public int modifyReply(QnaReplyDTO qnaReplyDTO) ;
	
	//특정 QnA 게시물에 대한 특정 댓글/답글 삭제
	public int removeReply(long bno, long rno) ;

	
}
