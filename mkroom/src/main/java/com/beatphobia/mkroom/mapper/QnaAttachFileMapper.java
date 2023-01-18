
  package com.beatphobia.mkroom.mapper;
  
  import java.util.List;

import com.beatphobia.mkroom.common.fileupload.FileInfoDTO;
import com.beatphobia.mkroom.domain.qna.QnaDTO;
  
public interface QnaAttachFileMapper {
  
	//QnA게시물 조회 - 목록
	public List<FileInfoDTO> findByBno(Long bno);

	//QnA 테이블의 마지막 bno 조회
	public long selectLastBno();
	
	//fileInfoDTO에 저장된 파일 정보를 DB에 입력
	public void insertAttachFiletag(FileInfoDTO fileInfoDTO, QnaDTO qnaDTO) ;
	public void insertAttachFile(FileInfoDTO fileInfoDTO) ;  
	
	//DB에 저장된 파일 전부 조회
	public List<FileInfoDTO> selectQnaAttachFileList(long bno) ;
	
	//주어진 bno에 대한 DB에 저장된 파일 전부 조회 - qnaDTO로 받기
	public QnaDTO selectQnaAllFile(long bno);
	
	//DB에 저장된 파일 삭제
	public void deleteAttachFile(String uuid) ;
	
	//DB에 저장된 파일 전부 삭제
	public void deleteQnaAllAttachFiles(long bno) ;

	
	 	
	
	
  }
 