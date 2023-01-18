package com.beatphobia.mkroom.mapper;

import java.util.List;

import com.beatphobia.mkroom.common.fileupload.BoardFileInfoDTO;
import com.beatphobia.mkroom.domain.noticeevent.NoticeEventDTO;

public interface EventBoardAttachMapper {
	
	//첨부파일 추가(연결 테이블 + 파일정보 테이블)
	public void insertAttachtag(NoticeEventDTO noticeEvent, BoardFileInfoDTO boardFileInfoDTO);
	public void insertAttachFile(BoardFileInfoDTO boardFileInfoDTO);
	
	//전체 게시물의 모든 이미지 조회
	public List<NoticeEventDTO> selectBoardAllAttachFileList();	
	
	//특정 게시물의 모든 첨부파일 조회
	public NoticeEventDTO selectBoardAttachFileList(long bno);
	
	//특정 첨부파일 삭제
	public void deleteAttachFile(BoardFileInfoDTO boardFileInfoDTO) ;
	
	//특정 게시물의 모든 첨부파일 삭제
	public void deleteBoardAllAttachFiles(long bno) ;
	
	
	
    
}
