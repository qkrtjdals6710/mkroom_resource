package com.beatphobia.mkroom.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.beatphobia.mkroom.common.paging.PagingDTO;
import com.beatphobia.mkroom.domain.quest.QuestDTO;

public interface AdminMapper {
	
	
	//삭제 요청 받은 NOTICE_EVENT 개별 선택 삭제
	public void deleteEventBoard(long bno);
	
	//특정 게시물의 모든 첨부파일 삭제
	public void deleteBoardAllAttachFiles(long bno) ;
	
	//삭제 요청 받은 qna 개별 선택 삭제
	public void deleteQnaBoard(long bno);
	
	
	//questPoint 추가
	public void updateQuestPoint(String userId, int questPointNum);
	
	
	
	
	List<Map<String, Object>> selectdailyMemberRegCntList();
	
	List<Map<String, Object>> selectBookingAndPaymentDataListPaging(@Param("pagingDTO") PagingDTO pagingDTO, @Param("fromDate") String fromDate, @Param("toDate") String toDate);
	
	
	List<Map<String, Object>> selectBookingAndPaymentDataListPagingLocation(@Param("pagingDTO") PagingDTO pagingDTO, @Param("fromDate") String fromDate, @Param("toDate") String toDate, @Param("ManagerLocation") String ManagerLocation);
	
	
	long selectBookingAndPaymentDataRowAmountTotal(@Param("pagingDTO") PagingDTO pagingDTO, @Param("fromDate") String fromDate, @Param("toDate") String toDate);
	
	List<Map<String, Object>> selectSalesByBranchLocationList(String branchLocation);
	
	//Qna게시물 차트
	List<Map<String, Object>> selectdailyQnAList();

	//Review 차트
	List<Map<String, Object>> selectdailyReviewList();
	
	//Quest차트
	List<Map<String, Object>> selectquestList();
	
	//
	
    
}
