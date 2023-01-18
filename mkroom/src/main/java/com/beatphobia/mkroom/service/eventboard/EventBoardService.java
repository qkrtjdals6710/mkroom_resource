package com.beatphobia.mkroom.service.eventboard;

import java.util.List;

import com.beatphobia.mkroom.common.fileupload.BoardFileInfoDTO;
import com.beatphobia.mkroom.common.paging.EventBoardPagingDTO;
import com.beatphobia.mkroom.common.paging.PagingDTO;
import com.beatphobia.mkroom.domain.noticeevent.NoticeEventDTO;

public interface EventBoardService {

	//게시물 목록 조회
	public List<NoticeEventDTO> getBoardList(EventBoardPagingDTO eventBoardPagingDTO);
	
	//게시물 총 갯수 구하기 
    public long getRowAmountTotal(EventBoardPagingDTO eventBoardPagingDTO) ;

    //특정 게시물 조회(조회수 증가 고려)
    public NoticeEventDTO getBoard(long bno);

	//전체 게시물의 첨부파일 조회 
	public List<NoticeEventDTO> getAllBoardFile();
    
    //특정 게시물 조회 시, 게시물의 첨부파일 정보를 조회
    public NoticeEventDTO getAttachFiles(long bno) ;
    
    //게시물 마지막 bno 얻기 
    public long getFilnalBno();
    
    //게시물 등록
    public long registerBoard(NoticeEventDTO noticeEventDTO);

    //게시물 첨부파일 등록
    public long registerFile(BoardFileInfoDTO fileInfo, NoticeEventDTO noticeEventDTO);
    
    //특정 게시물 수정
    public boolean modifyBoard(NoticeEventDTO noticeEventDTO);
    
    //특정 게시물 취소
	public void modifyCancelBoard(NoticeEventDTO noticeEventDTO);
    
    //특정 게시물 삭제 요청 - 해당 글의 bdelFlag을 1로 수정 
    public boolean setBoardDeleted(long bno);  
    
    //삭제할 게시물 조회
    public List<NoticeEventDTO> selectBdelFlagOn(PagingDTO pagingDTO);
    
    //삭제할 게시물 총 갯수 조회
    public long selectBdelFlagOnRowAmountTotal();
    
    //게시물 조회: 게시물 조회 페이지 -> 게시물 수정 페이지 호출(by bno), 조회수 변화 없음
    //게시물 조회: 게시물 수정 후 -> 게시물 조회 페이지 호출(by bno), 조회수 증가 없음
    public NoticeEventDTO getBoardDetailModify(long bno) ;

	public NoticeEventDTO getBoardFile(long bno);

	
    
    
    //관리자 기능
//  //게시물 삭제(관리자) – 사용자 삭제 요청된 게시물(bdelFlag = 1) 전체 삭제
//  public int removeAllDeletedBoard();
//    
//  //특정 게시물 삭제 - 실제 삭제 
//  public boolean removeBoard(long bno);
//    
  //특정 게시물의 모든 첨부파일 삭제
  public void deleteBoardAllAttachFiles(long bno) ;
	
	
	
}//end
