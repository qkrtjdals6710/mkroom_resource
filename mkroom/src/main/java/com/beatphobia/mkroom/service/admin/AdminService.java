package com.beatphobia.mkroom.service.admin;

import java.util.List;
import java.util.Map;

import com.beatphobia.mkroom.common.paging.PagingDTO;
import com.beatphobia.mkroom.domain.quest.QuestDTO;

public interface AdminService {
	
	//삭제 요청 받은 NOTICE_EVENT 개별 선택 삭제
	public void deleteEventBoard(long bno);
	
	//삭제 요청 받은 qna 개별 선택 삭제
	public void deleteQnaBoard(long bno);
	
	//questPoint 추가
	public void updateQuestPoint(String userId, int questPointNum);
	
	List<Map<String, Object>> selectdailyMemberRegCntList();
	
	List<Map<String, Object>> selectBookingAndPaymentDataListPaging(PagingDTO pagingDTO, String fromDate, String toDate);
	
	
	List<Map<String, Object>> selectBookingAndPaymentDataListPagingLocation(PagingDTO pagingDTO, String fromDate, String toDate, String ManagerLocation);

	
	long selectBookingAndPaymentDataRowAmountTotal(PagingDTO pagingDTO, String fromDate, String toDate);
	
	List<Map<String, Object>> selectSalesByBranchLocationList(String branchLocation);
	//
	//QnA차트
	List<Map<String, Object>> selectdailyQnAList();
	
	//Review차트
	List<Map<String, Object>> selectdailyReviewList();

	//quest차트
	List<Map<String, Object>> selectquestList();

}
