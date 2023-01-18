package com.beatphobia.mkroom.mapper;

import java.util.List;

import com.beatphobia.mkroom.common.paging.QuestPagingDTO;
import com.beatphobia.mkroom.domain.quest.QuestDTO;

public interface QuestBookingMapper {
	
	//테마 정보 조회
	public List<QuestDTO> selectQuestInfo(QuestPagingDTO questPagingDTO);
	
	//DB에 저장된 총 행수 얻어오기
	public long selectRowAmountTotal(QuestPagingDTO questPagingDTO);
	
	//DB에 저장된 location을 중복 제거해서 가져오기(갯수말고 무엇이 존재하는지 확인)
	public List<QuestDTO> selectBranchLocationList();
	
	//DB에 저장된 difficulty를 중복 제거해서 가져오기
	public List<QuestDTO> selectDifficultyList();
	
	//DB에 저장된 questTime을 중복 제거해서 가져오기
	public List<QuestDTO> selectQuestTimeList();
	
	//테마 전체 정보 조회
	public List<QuestDTO> selectAllQuestInfo();
	
	//예약에서 테마 전체 정보 조회
	public List<QuestDTO> selectAllQuestBookingInfo(QuestPagingDTO questPagingDTO);
	
	//테마 상세 정보 조회
	public QuestDTO selectQuestInfoDetail(QuestDTO questDTO);
	
	//DB에 테마 정보를 저장하기 
	public long insertQuestInfo(QuestDTO questDTO);
	
	//questDB 수정
	public void updateQuestInfo(QuestDTO beforeQuestDTO, QuestDTO questDTO);
	
	//시큐리티 - 지점관리자의 지점 이름 가져오기
	public String selectBmanagerLocation(String userId);
	
	//quest DB 삭제
	public void deleteQuestInfo(QuestDTO questDTO);
	
	
	
	
	
}
