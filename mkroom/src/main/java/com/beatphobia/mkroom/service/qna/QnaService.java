package com.beatphobia.mkroom.service.qna;
  
import java.util.List;

import com.beatphobia.mkroom.common.fileupload.FileInfoDTO;
import com.beatphobia.mkroom.common.paging.PagingDTO;
import com.beatphobia.mkroom.common.paging.QnaPagingDTO;
import com.beatphobia.mkroom.domain.qna.QnaDTO;
  
public interface QnaService {
    
	//QnA게시물 조회 - 목록
	public List<QnaDTO> getQnaList(QnaPagingDTO qnaPagingDTO);
    
	//QnA게시물 총 개수 조회 서비스 - 페이징 시 필요
	public long getRowAmountTotal(QnaPagingDTO qnaPagingDTO) ;
  
	//QnA게시물 등록 
	public long registerQna(QnaDTO qnaDTO);
  
	//QnA게시물 첨부파일 DB에 등록
	public void registerAttachFile(FileInfoDTO fileInfoDTO, QnaDTO qnaDTO) ;
	//public void registerAttachFile(FileInfoDTO fileInfoDTO) ; 
  
	//특정 게시물의 모든 첨부파일 삭제
	public void deleteQnaAllAttachFiles(long bno) ;
  
	//DB에 저장된 파일정보 전부 조회
	public List<FileInfoDTO> getQnaAttachFileList(long bno);
	//public List<AttachFileDTO> getQnaAttachFileList();
  
	//QnA특정 게시물 조회(조회수 증가 고려) 
	public QnaDTO getQna(long bno);
  
	//Qna특정 게시물 조회 시, 게시물의 첨부파일 정보를 조회
	public List<FileInfoDTO> getAttachFiles(long bno) ;
  
	//qna 테이블의 마지막 bno 조회
	public long getLastBno();
  
   
	//QnA특정 게시물 조회 페이지 -> 게시물 수정 페이지 호출
	public QnaDTO getQnaDetailModify(long bno);
       
	//QnA특정 게시물 수정 
	public boolean modifyQna(QnaDTO qnaDTO);
  
	//QnA특정 게시물 삭제 - 실제 삭제 
  	public boolean removeQna(long bno);
  
	//QnA특정 게시물 삭제 요청 - 해당 글의 bdelFlag을 1로 수정 
	public boolean setQnaDeleted(long bno);

    //삭제할 게시물 조회
    public List<QnaDTO> selectBdelFlagOn(PagingDTO pagingDTO);

    //삭제할 게시물 총 갯수 조회
    public long selectBdelFlagOnRowAmountTotal();
    
	//DB에 저장된 파일 전부 조회 - qnaDTO로 받기
	public QnaDTO selectQnaAllFile(long bno);
    
    
    
  }
 