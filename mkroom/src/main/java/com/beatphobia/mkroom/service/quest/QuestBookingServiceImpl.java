package com.beatphobia.mkroom.service.quest;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.beatphobia.mkroom.common.fileupload.FileInfoDTO;
import com.beatphobia.mkroom.common.paging.QuestPagingDTO;
import com.beatphobia.mkroom.domain.quest.QuestDTO;
import com.beatphobia.mkroom.mapper.QuestBookingFileMapper;
import com.beatphobia.mkroom.mapper.QuestBookingMapper;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class QuestBookingServiceImpl implements QuestBookingService{

	private QuestBookingMapper questBookingMapper ;
	private QuestBookingFileMapper questBookingFileMapper;
	
	//DB에 저장된 테마정보 전부 조회(테마 소개페이지)
	public List<QuestDTO> getQuestInfoList(QuestPagingDTO questPagingDTO){
		return questBookingFileMapper.selectQuestInfoList(questPagingDTO);
	}
	
	//DB에 저장된 총 행수 얻어오기
	@Override
	public long getRowAmountTotal(QuestPagingDTO questPagingDTO) {
		return questBookingMapper.selectRowAmountTotal(questPagingDTO);
	}
	
	//DB에 저장된 location을 중복 제거해서 가져오기(갯수말고 무엇이 존재하는지 확인)
	@Override
	public List<QuestDTO> getBranchLocationList() {
		return questBookingMapper.selectBranchLocationList();
	}
	
	//DB에 저장된 difficulty를 중복 제거해서 가져오기
	@Override
	public List<QuestDTO> getDifficultyList() {
		return questBookingMapper.selectDifficultyList();
	}
	
	//DB에 저장된 questTime을 중복 제거해서 가져오기
	@Override
	public List<QuestDTO> getQuestTimeList() {
		return questBookingMapper.selectQuestTimeList();
	}
	
	//퀘스트 전체 정보 조회(메인페이지)
	@Override
	public List<QuestDTO> selectAllQuestInfo(){
		return questBookingMapper.selectAllQuestInfo();
	}
	
	//예약에서 테마 전체 정보 조회
	@Override
	public List<QuestDTO> selectAllQuestBookingInfo(QuestPagingDTO questPagingDTO){
		return questBookingMapper.selectAllQuestBookingInfo(questPagingDTO);
	}
	
	//퀘스트 상세 정보 조회
	@Override
	public QuestDTO getQuestDetail(QuestDTO questDTO) {
		return questBookingMapper.selectQuestInfoDetail(questDTO);
	}
	
	//상세 페이지 호출 시, DB에 저장된 이미지정보 하나 조회
	@Transactional
	@Override
	public FileInfoDTO getQuestImageDetail(QuestDTO questDTO) {
		return questBookingFileMapper.selectQuestImageDetail(questDTO);
	}

	//file을 보내지 않았을 때, 디폴트 이미지를 넣어주면서 퀘스트 등록
	@Transactional
	@Override
	public void registerQuestNoFile(QuestDTO questDTO) {
		
		questBookingMapper.insertQuestInfo(questDTO);
		FileInfoDTO defaultImagePath = new FileInfoDTO("기본", "이미지", "경로", "입니다."); //기본 이미지 경로 생성자로 적어주기
		questBookingFileMapper.insertQuestFile(defaultImagePath);
	}

	//DB에 테마 정보를 저장하기(quest 내용 + 파일 관련 테이블)
	@Transactional
	@Override
	public void registerQuestInfo(QuestDTO questDTO, FileInfoDTO fileInfoDTO) {
		//순서 중요. 부모 키가 있는 2개 테이블을 먼저 실행. 
		questBookingMapper.insertQuestInfo(questDTO); //quest에 저장
		questBookingFileMapper.insertQuestFile(fileInfoDTO); //fileInfo에 저장
		questBookingFileMapper.insertQuestAttach(questDTO, fileInfoDTO); //attach에 저장 
	}
	
	//DB에 테마 정보를 저장하기(quest 내용 + 파일 관련 테이블)
	@Transactional
	@Override
	public void registerQuestFile(QuestDTO questDTO, FileInfoDTO fileInfoDTO) {
		questBookingFileMapper.insertQuestFile(fileInfoDTO); //fileInfo에 저장
		questBookingFileMapper.insertQuestAttach(questDTO, fileInfoDTO); //attach에 저장 
	}
	
	
	//quest DB 수정
	@Override
	@Transactional
	public void modifyQuestInfo(QuestDTO beforeQuestDTO, QuestDTO questDTO) {
		questBookingMapper.updateQuestInfo(beforeQuestDTO, questDTO);
	};
	
	//상세 테마 파일 삭제
	@Override
	@Transactional
	public void delQuestDetail(QuestDTO questDTO) {
		questBookingFileMapper.deleteQuestDetailFile(questDTO);
	};
	
	
	//quest DB 삭제
	@Override
	@Transactional
	public void delQuestInfo(QuestDTO questDTO) {
		questBookingMapper.deleteQuestInfo(questDTO);

	}
	
	//시큐리티 - 지점관리자의 지점 이름 가져오기
	@Override
	public String selectBmanagerLocation(String userId) {
		return questBookingMapper.selectBmanagerLocation(userId);
	}
	
	

	
	
}
