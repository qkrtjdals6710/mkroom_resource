package com.beatphobia.mkroom.service.quest;

import java.util.List;

import com.beatphobia.mkroom.common.fileupload.FileInfoDTO;
import com.beatphobia.mkroom.common.paging.QuestPagingDTO;
import com.beatphobia.mkroom.domain.quest.QuestDTO;

public interface QuestBookingService {
	
	//DB에 저장된 테마정보 전부 조회(테마 소개페이지)
	public List<QuestDTO> getQuestInfoList(QuestPagingDTO questPagingDTO);
	
	//DB에 저장된 총 행수 얻어오기
	public long getRowAmountTotal(QuestPagingDTO questPagingDTO);
	
	////DB에 저장된 location을 중복 제거해서 가져오기
	public List<QuestDTO> getBranchLocationList();
	
	//DB에 저장된 difficulty를 중복 제거해서 가져오기
	public List<QuestDTO> getDifficultyList();
	
	//DB에 저장된 questTime을 중복 제거해서 가져오기
	public List<QuestDTO> getQuestTimeList();
	
	//퀘스트 전체 정보 조회(메인페이지)
	public List<QuestDTO> selectAllQuestInfo();
	
	//예약에서 테마 전체 정보 조회
	public List<QuestDTO> selectAllQuestBookingInfo(QuestPagingDTO questPagingDTO);
	
	//퀘스트 상세 정보 조회
	public QuestDTO getQuestDetail(QuestDTO questDTO);
	
	//상세 페이지 호출 시, DB에 저장된 이미지정보 하나 조회
	public FileInfoDTO getQuestImageDetail(QuestDTO questDTO);
	
	//file을 보내지 않았을 때, 디폴트 이미지를 넣어주면서 퀘스트 등록
	public void registerQuestNoFile(QuestDTO questDTO);
	
	//DB에 테마 정보를 저장하기(quest, fileInfo, attach)
	public void registerQuestInfo(QuestDTO questDTO, FileInfoDTO fileInfoDTO);
	
	//DB에 테막 관련 파일 저장하기(fileInfo, attach)
	public void registerQuestFile(QuestDTO questDTO, FileInfoDTO fileInfoDTO);
	
	//quest DB 수정
	public void modifyQuestInfo(QuestDTO beforeQuestDTO, QuestDTO questDTO);
	
	//상세 테마 파일 삭제
	public void delQuestDetail(QuestDTO questDTO);
	
	//quest DB 삭제
	public void delQuestInfo(QuestDTO questDTO);
	
	//시큐리티 - 지점관리자의 지점 이름 가져오기
	public String selectBmanagerLocation(String userId);
	
}
