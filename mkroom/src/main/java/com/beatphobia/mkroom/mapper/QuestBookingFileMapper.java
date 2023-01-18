package com.beatphobia.mkroom.mapper;

import java.util.List;

import com.beatphobia.mkroom.common.fileupload.FileInfoDTO;
import com.beatphobia.mkroom.common.paging.QuestPagingDTO;
import com.beatphobia.mkroom.domain.quest.QuestDTO;

public interface QuestBookingFileMapper {
	

	//DB에 저장된 테마정보 전부 조회
	public List<QuestDTO> selectQuestInfoList(QuestPagingDTO questPagingDTO);
	
	//상세 페이지 호출 시, DB에 저장된 이미지정보 하나 조회
	public FileInfoDTO selectQuestImageDetail(QuestDTO questDTO);
	
	//fileInfoDTO에 저장된 파일 정보를 DB에 입력
	public long insertQuestFile(FileInfoDTO fileInfoDTO);

	//questAttach에 uuid와 quest 키 값 입력
	public long insertQuestAttach(QuestDTO questDTO, FileInfoDTO fileInfoDTO);
	
	//상세 테마 파일 삭제
	public void deleteQuestDetailFile(QuestDTO questDTO);
	
	
}
