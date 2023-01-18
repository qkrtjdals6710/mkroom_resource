package com.beatphobia.mkroom.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.beatphobia.mkroom.common.paging.PagingDTO;
import com.beatphobia.mkroom.common.paging.QnaPagingDTO;
import com.beatphobia.mkroom.domain.qna.QnaDTO;

public interface QnaMapper {

	//QnA 게시물 조회 - 목록
    public List<QnaDTO> selectQnaList(QnaPagingDTO qnaPagingDTO);

	//QnA게시물 총 개수 조회(페이징)
	public long selectRowAmountTotal(QnaPagingDTO qnaPagingDTO) ;
	    	
    //QnA게시물 등록
    public int insertQna(QnaDTO qna);
	
    //특정 QnA게시물 조회 
    public QnaDTO selectQna(long bno);
    
    //특정 QnA게시물 수정
    public int updateQna(QnaDTO qna);
    
    //특정 QnA게시물 삭제 - 실제 삭제 
    public int deleteQna(long bno);
    
    //특정 QnA게시물 삭제 요청 - 해당 글의 bdelFlag을 1로 수정 
    public int updateBdelFlag(long bno);
	
    //삭제할 게시물 조회
    public List<QnaDTO> selectBdelFlagOn(PagingDTO pagingDTO);
    
    //삭제할 게시물 총 갯수 조회
    public long selectBdelFlagOnRowAmountTotal();
    
    //특정 QnA게시물 조회수 증가
    public void updateBviewsCnt(long bno);
        
    //특정 QnA게시물 댓글/답글 수 변경: 삭제 시 -1, 추가 시 +1 
    public void updateBReplyCnt(@Param("bno") long bno, @Param("amount") int amount);

    //관리자 QnA게시물 전체삭제
	public String deleteAllBoardSetDeleted();

	

	
}
