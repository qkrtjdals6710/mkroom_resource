package com.beatphobia.mkroom.service.admin;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.beatphobia.mkroom.common.fileupload.BoardFileInfoDTO;
import com.beatphobia.mkroom.common.fileupload.FileInfoDTO;
import com.beatphobia.mkroom.common.paging.PagingDTO;
import com.beatphobia.mkroom.mapper.AdminMapper;
import com.beatphobia.mkroom.mapper.EventBoardAttachMapper;
import com.beatphobia.mkroom.mapper.QnaAttachFileMapper;
import com.beatphobia.mkroom.service.eventboard.EventBoardService;
import com.beatphobia.mkroom.service.qna.QnaService;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class AdminServiceImpl implements AdminService{

	private AdminMapper adminMapper ;
	private EventBoardService eventBoardService;
	private EventBoardAttachMapper eventBoardAttachMapper;
	private QnaService qnaService;
	private QnaAttachFileMapper qnaAttachFileMapper;
	
	//삭제 요청 받은 NOTICE_EVENT 개별 선택 삭제
	@Override
	public void deleteEventBoard(long bno) {
		
		removeAttachFiles(eventBoardAttachMapper.selectBoardAttachFileList(bno).getFileInfos());
		
		eventBoardService.deleteBoardAllAttachFiles(bno);
		
		adminMapper.deleteEventBoard(bno);
		


	};

	//삭제 요청 받은 qna 개별 선택 삭제
	@Override
	@Transactional
	public void deleteQnaBoard(long bno) {
		
		if(qnaAttachFileMapper.selectQnaAllFile(bno) != null) {
			removeAttachFiles2(qnaAttachFileMapper.selectQnaAllFile(bno).getAttachFileList());
		}
		
		qnaService.deleteQnaAllAttachFiles(bno);
		
		adminMapper.deleteQnaBoard(bno);
		
	};
	
	//questPoint 추가
	@Override
	public void updateQuestPoint(String userId, int questPointNum) {
		adminMapper.updateQuestPoint(userId, questPointNum);
	}
	
	
	
	@Override
	public List<Map<String, Object>> selectdailyMemberRegCntList() {
		List<Map<String, Object>> dailyMemberRegCntList = adminMapper.selectdailyMemberRegCntList();
		return dailyMemberRegCntList;
	}

	@Override
	public List<Map<String, Object>> selectBookingAndPaymentDataListPaging(PagingDTO pagingDTO, String fromDate, String toDate) {
		List<Map<String, Object>> bookingAndPaymentDataList = adminMapper.selectBookingAndPaymentDataListPaging(pagingDTO, fromDate, toDate);
		return bookingAndPaymentDataList;
	};

	
	@Override
	public List<Map<String, Object>> selectBookingAndPaymentDataListPagingLocation(PagingDTO pagingDTO, String fromDate, String toDate, String ManagerLocation) {
		
		return adminMapper.selectBookingAndPaymentDataListPagingLocation(pagingDTO, fromDate, toDate, ManagerLocation);
	};
	
	
	@Override
	public long selectBookingAndPaymentDataRowAmountTotal(PagingDTO pagingDTO, String fromDate, String toDate) {
		long cnt = adminMapper.selectBookingAndPaymentDataRowAmountTotal(pagingDTO, fromDate, toDate);
		return cnt;
	}

	@Override
	public List<Map<String, Object>> selectSalesByBranchLocationList(String branchLocation) {
		List<Map<String, Object>> salesByBrachLocationList = adminMapper.selectSalesByBranchLocationList(branchLocation);
		return salesByBrachLocationList;
	}


	
	//Qna게시물 차트
	@Override
	public List<Map<String, Object>> selectdailyQnAList() {
		List<Map<String, Object>> dailyQnaList = adminMapper.selectdailyQnAList();
		return dailyQnaList;

	}
	//review 차트
	@Override
	public List<Map<String, Object>> selectdailyReviewList() {
		List<Map<String, Object>> dailyReviewList = adminMapper.selectdailyReviewList();
		return dailyReviewList;
		
	}

	//quest 차트
	@Override
	public List<Map<String, Object>> selectquestList() {
		List<Map<String, Object>> questList = adminMapper.selectquestList();
		return questList;
		
	}
	

	
	
	
	
	   //업로드 파일 List 삭제 내부 메서드 
	   private void removeAttachFiles(List<BoardFileInfoDTO> FileInfoDTOList) {
		   
	      if (FileInfoDTOList == null) {
	         return;
	      }
	      
	      FileInfoDTOList.forEach(fileInfo -> {
	    	  
			      Path file =  Paths.get("C:/myupload/" + fileInfo.getUploadPath() + "/" + fileInfo.getUuid()+ "_" + fileInfo.getFileName());
			      try {
			         Files.deleteIfExists(file); 

			         if (Files.probeContentType(file).startsWith("image")) {
			            Path thumbnail = Paths.get("C:/myupload/" + fileInfo.getUploadPath() + "/s_" + fileInfo.getUuid()+ "_" + fileInfo.getFileName());
			            Files.delete(thumbnail);
			         }

			      } catch (Exception e) {
			         System.out.println("오류: " + e.getMessage());
			      }

	    	  });
	   }
	
	
	   //업로드 파일 List 삭제 내부 메서드 
	   private void removeAttachFiles2(List<FileInfoDTO> FileInfoDTOList) {
		   
	      if (FileInfoDTOList == null) {
	         return;
	      }
	      
	      FileInfoDTOList.forEach(fileInfo -> {
	    	  
			      Path file =  Paths.get("C:/myupload/" + fileInfo.getUploadPath() + "/" + fileInfo.getUuid()+ "_" + fileInfo.getFileName());
			      try {
			         Files.deleteIfExists(file); 

			         if (Files.probeContentType(file).startsWith("image")) {
			            Path thumbnail = Paths.get("C:/myupload/" + fileInfo.getUploadPath() + "/s_" + fileInfo.getUuid()+ "_" + fileInfo.getFileName());
			            Files.delete(thumbnail);
			         }

			      } catch (Exception e) {
			         System.out.println("오류: " + e.getMessage());
			      }

	    	  });
	   }
	   
	   
	   
	   


	
	
}
