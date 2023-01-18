package com.beatphobia.mkroom.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.beatphobia.mkroom.common.paging.EventBoardPagingDTO;
import com.beatphobia.mkroom.common.paging.PagingDTO;
import com.beatphobia.mkroom.domain.noticeevent.NoticeEventDTO;

public interface EventBoardMapper {

	//게시물 목록 조회
	public List<NoticeEventDTO> selectEventBoardList(EventBoardPagingDTO eventBoardPagingDTO);
	
	//게시물 전체 갯수 조회
	public long selectRowAmountTotal(EventBoardPagingDTO eventBoardPagingDTO) ;
	
    //특정 게시물 조회 
    public NoticeEventDTO selectEventBoard(long bno);
    
	//게시물 정보가 저장된 테이블의 마지막 bno 얻기
	public long selectLastBno();
    
    //게시물 등록
    public int insertEventBoard(NoticeEventDTO noticeEventDTO);
    
    //특정 게시물 수정
    public int updateEventBoard(NoticeEventDTO noticeEventDTO);
    
    //특정 게시물 삭제 요청 - 해당 글의 bdelFlag을 1로 수정 
    public int updateBdelFlag(long bno);

    //특정 게시물 조회수 1 증가
    public void updateBviewsCnt(long bno);
    
    //특정 게시물 댓글/답글 수 변경: 삭제 시 -1, 추가 시 +1 
    public void updateBReplyCnt(@Param("bno") long bno, @Param("amount") int amount);

    //삭제할 게시물 조회
    public List<NoticeEventDTO> selectBdelFlagOn(PagingDTO pagingDTO);
    
    //삭제할 게시물 총 갯수 조회
    public long selectBdelFlagOnRowAmountTotal();
    
    
}//end
