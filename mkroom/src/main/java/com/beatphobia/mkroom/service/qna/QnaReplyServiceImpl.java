package com.beatphobia.mkroom.service.qna;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.beatphobia.mkroom.common.paging.QnaReplyPagingCreatorDTO;
import com.beatphobia.mkroom.common.paging.QnaReplyPagingDTO;
import com.beatphobia.mkroom.domain.qna.QnaReplyDTO;
import com.beatphobia.mkroom.mapper.QnaMapper;
import com.beatphobia.mkroom.mapper.QnaReplyMapper;


@Service
public class QnaReplyServiceImpl implements QnaReplyService {
	
	private QnaReplyMapper qnaReplyMapper ;
	private QnaMapper qnaMapper ;
		
	public QnaReplyServiceImpl(QnaReplyMapper qnaReplyMapper, QnaMapper qnaMapper) {
			this.qnaReplyMapper = qnaReplyMapper ;
			this.qnaMapper = qnaMapper ;
	}

	//특정 QnA 게시물에 대한 댓글 목록 조회-페이징-전체댓글 수 고려
	@Override
	public QnaReplyPagingCreatorDTO getReplyList(QnaReplyPagingDTO qnaReplyPagingDTO) {
		
		long replyTotalCnt = qnaReplyMapper.selectReplyTotalCnt(qnaReplyPagingDTO);
		
		int pageNum = qnaReplyPagingDTO.getPageNum() ;
		
		QnaReplyPagingCreatorDTO qnaReplyPagingCreator = null ;
		
			if (replyTotalCnt == 0) {
				qnaReplyPagingDTO.setPageNum(1);
				System.out.println("댓글-서비스- 댓글이 없는 경우, pageNum은 1: 수정된 myReplyPaging: " + qnaReplyPagingDTO);
				
				qnaReplyPagingCreator =
						new QnaReplyPagingCreatorDTO(
								0,
								qnaReplyPagingDTO, 
								qnaReplyMapper.selectQnaReplyList(qnaReplyPagingDTO)) ;
				
			} else {
				
				if (pageNum == -10) {
					pageNum = (int) Math.ceil(replyTotalCnt/(qnaReplyPagingDTO.getRowAmountPerPage()*1.0)) ;
					
					qnaReplyPagingDTO.setPageNum(pageNum) ;
				}
				
				qnaReplyPagingCreator =
						new QnaReplyPagingCreatorDTO(
								qnaReplyMapper.selectReplyTotalCnt(qnaReplyPagingDTO),
								qnaReplyPagingDTO, 
								qnaReplyMapper.selectQnaReplyList(qnaReplyPagingDTO)) ;
				
			}
		
		System.out.println("컨트롤러로 전달할 myReplyPagingCreator: " + qnaReplyPagingCreator);
		
		return qnaReplyPagingCreator ;
	}

//		@Override
//		public long getReplyTotalCnt(QnaReplyPagingDTO QnaReplyPagingDTO) {
//			
//			return QnaReplyMapper.selectReplyTotalCnt(QnaReplyPagingDTO);
//		}

	//특정 QnA 게시물에 대한 댓글 등록
	//@Transactional(propagation = Propagation.REQUIRED , isolation = Isolation.DEFAULT)
	@Transactional
	@Override
	public long registerReplyForBoard(QnaReplyDTO qnaReply) {
		
		qnaReplyMapper.insertQnaReplyForBoard(qnaReply) ;
		
		//QnA 게시물 댓글 수 증가
		qnaMapper.updateBReplyCnt(qnaReply.getBno(), 1);
		
		
		return qnaReply.getRno();
	}

	//특정 댓글에 대한 답글 등록
	@Transactional
	@Override
	public long registerReplyForReply(QnaReplyDTO qnaReply) {
		
		qnaReplyMapper.insertQnaReplyForReply(qnaReply) ;
		
		qnaMapper.updateBReplyCnt(qnaReply.getBno(), 1);
		
		return qnaReply.getRno();
	}

	//특정 댓글 조회
	@Override
	public QnaReplyDTO getReply(long bno, long rno) {

		return qnaReplyMapper.selectQnaReply(bno, rno);
	}
	
	//특정 QnA 게시물에 대한 특정 댓글/답글 수정
	@Override
	public int modifyReply(QnaReplyDTO QnaReply) {
 
		return qnaReplyMapper.updateQnaReply(QnaReply);
	}

	//특정 댓글/답글 삭제: 삭제된 행수인 1 반환
	@Transactional
	@Override
	public int removeReply(long bno, long rno) {
		
		int delRowCnt = qnaReplyMapper.deleteQnaReply(bno, rno) ;
		
		qnaMapper.updateBReplyCnt(bno, -1);
		
		return delRowCnt;
	}
	//특정 QnA 게시물의 댓글 총 개수확인
	@Override
	public long getReplyTotalCnt(QnaReplyPagingDTO qnaReplyPagingDTO) {
		
		return 0;
	}

}
	
