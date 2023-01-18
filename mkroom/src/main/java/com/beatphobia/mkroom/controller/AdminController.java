package com.beatphobia.mkroom.controller;

import java.security.Principal;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.beatphobia.mkroom.common.paging.PagingCreatorDTO;
import com.beatphobia.mkroom.common.paging.PagingDTO;
import com.beatphobia.mkroom.common.paging.QuestPagingCreatorDTO;
import com.beatphobia.mkroom.common.paging.QuestPagingDTO;
import com.beatphobia.mkroom.common.payment.PaymentData;
import com.beatphobia.mkroom.domain.booking.QuestBookingData;
import com.beatphobia.mkroom.domain.member.Member;
import com.beatphobia.mkroom.domain.quest.QuestDTO;
import com.beatphobia.mkroom.service.admin.AdminService;
import com.beatphobia.mkroom.service.booking.BookingService;
import com.beatphobia.mkroom.service.eventboard.EventBoardService;
import com.beatphobia.mkroom.service.paymentData.PaymentDataService;
import com.beatphobia.mkroom.service.qna.QnaService;
import com.beatphobia.mkroom.service.quest.QuestBookingService;

import lombok.AllArgsConstructor;

@Controller
@AllArgsConstructor
@RequestMapping(value = "/admin/*")
public class AdminController {

	private AdminService adminService;
	private QuestBookingService questBookingService;
	private EventBoardService eventBoardService;
	private QnaService qnaService;
	private PaymentDataService paymentDataService;
	private BookingService bookingService;
	
	//삭제 페이지 - qna
	@PreAuthorize("hasAuthority('ROLE_ADMIN')")
	@GetMapping("/admin/deleteQna")
	public String showDeleteQna(Member member, PagingDTO pagingDTO, Model model ) {	
		
		model.addAttribute("delQnaList", qnaService.selectBdelFlagOn(pagingDTO));
		long delcnt = qnaService.selectBdelFlagOnRowAmountTotal();
		PagingCreatorDTO pagingCreatorDTO = new PagingCreatorDTO(delcnt, pagingDTO);
		model.addAttribute("pagingCreator", pagingCreatorDTO);
		
		
		return "/admin/deleteQna";
	}
	
	//삭제 페이지 - event
	@PreAuthorize("hasAuthority('ROLE_ADMIN')")
	@GetMapping("/admin/deleteEvent")
	@Transactional
	public String showDeleteEvent(Member member, PagingDTO pagingDTO, Model model ) {
		
		model.addAttribute("delEventList", eventBoardService.selectBdelFlagOn(pagingDTO));
		long delcnt = eventBoardService.selectBdelFlagOnRowAmountTotal();
		PagingCreatorDTO pagingCreatorDTO = new PagingCreatorDTO(delcnt, pagingDTO);
		model.addAttribute("pagingCreator", pagingCreatorDTO);
		
		return "/admin/deleteEvent";
	}
	
	
	//삭제 요청 받은 NOTICE_EVENT 개별 선택 삭제
	@PreAuthorize("hasAuthority('ROLE_ADMIN')")
	@GetMapping("/admin/deleteDetailEvent")
	public String deleteEventBoard(long bno) {
		adminService.deleteEventBoard(bno);
		return "redirect:/admin/deleteEvent";
	}
	
	//삭제 요청 받은 qna 개별 선택 삭제
	@PreAuthorize("hasAuthority('ROLE_ADMIN')")
	@GetMapping("/admin/deleteDetailQna")
	public String deleteqnaBoard(long bno) {
		adminService.deleteQnaBoard(bno);
		return "redirect:/admin/deleteQna";
	}
	
	
	
	//예약 확인 창으로 이동
	@PreAuthorize("hasAnyAuthority('ROLE_ADMIN', 'ROLE_BMANAGER')")
	@GetMapping("/bookingBoard")
	public String showBookingBoard(QuestPagingDTO questPagingDTO, Model model) {
		
		if(questPagingDTO.getLocationScope() == null) {
			questPagingDTO.setLocationScope("");
		} 
		if(questPagingDTO.getDiffScope() == null) {
			questPagingDTO.setDiffScope("");
		} 
		if(questPagingDTO.getQuestTimeScope() == null) {
			questPagingDTO.setQuestTimeScope("");
		} 
		if(questPagingDTO.getDateScope() == null) {
			questPagingDTO.setDateScope("");
		} 
		
		model.addAttribute("questInfoList", questBookingService.selectAllQuestBookingInfo(questPagingDTO));
		
		model.addAttribute("locationList", questBookingService.getBranchLocationList());
		
		long rowAmountTotal = questBookingService.getRowAmountTotal(questPagingDTO);
		QuestPagingCreatorDTO questPagingCreatorDTO = new QuestPagingCreatorDTO(rowAmountTotal, questPagingDTO);
		model.addAttribute("pagingCreator", questPagingCreatorDTO);
		
		return "/admin/bookingBoard";
	}
	
	
	
	//예약 확인 창으로 이동 - 각 지점별 예약 확인
	@PreAuthorize("hasAnyAuthority('ROLE_ADMIN', 'ROLE_BMANAGER')")
	@GetMapping("/bookingDetailBoard")
	public String showBookingDetailBoard(QuestPagingDTO questPagingDTO, Principal principal, Model model) {
		
		if(questPagingDTO.getLocationScope() == null) {
			questPagingDTO.setLocationScope("");
		} 
		if(questPagingDTO.getDiffScope() == null) {
			questPagingDTO.setDiffScope("");
		} 
		if(questPagingDTO.getQuestTimeScope() == null) {
			questPagingDTO.setQuestTimeScope("");
		} 
		if(questPagingDTO.getDateScope() == null) {
			questPagingDTO.setDateScope("");
		} 
		
		if(principal != null) {
			String userId = principal.getName();
			model.addAttribute("BmanagerLocation", questBookingService.selectBmanagerLocation(userId));
		}
		
		long rowAmountTotal = questBookingService.getRowAmountTotal(questPagingDTO);
		QuestPagingCreatorDTO questPagingCreatorDTO = new QuestPagingCreatorDTO(rowAmountTotal, questPagingDTO);
		model.addAttribute("pagingCreator", questPagingCreatorDTO);
		
		model.addAttribute("questInfoList", questBookingService.selectAllQuestBookingInfo(questPagingCreatorDTO.getQuestPagingDTO()));
		
		return "/admin/bookingDetailBoard";
	}
	
	
	
	//예약 확인 창으로 이동 - 각 지점별 예약 확인
	@PreAuthorize("hasAnyAuthority('ROLE_ADMIN', 'ROLE_BMANAGER')")
	@GetMapping("/bookingTimeDetailBoard")
	public String showBookingTimeDetailBoard(QuestDTO questDTO, Model model) {
		
        String dateStr = questDTO.getSelectTime().get(0);
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date selectdate;
		try {
			selectdate = formatter.parse(dateStr);
			
			QuestBookingData questBookingData = new QuestBookingData(0, questDTO.getQuestName(), questDTO.getBranchLocation(), selectdate, "", "", "");
			
			model.addAttribute("paymentInfo", paymentDataService.selectBuyerIdAndImpUidMap(questDTO.getBranchLocation(), questDTO.getQuestName(), questDTO.getSelectTime().get(0)));
			
			model.addAttribute("bookingInfo", bookingService.selectQuestBookingData(questBookingData));
			
			DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String getDate = dateFormat.format(bookingService.selectQuestBookingData(questBookingData).getSelectTime());
			
			model.addAttribute("getDate", getDate);
			
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		return "/admin/bookingTimeDetailBoard";
	}
	
	
	
	
	
	
	
	
	//포인트 증가
	@PreAuthorize("hasAnyAuthority('ROLE_ADMIN', 'ROLE_BMANAGER')")
	@GetMapping("/pointUp")
	@ResponseBody
	public void updateUserPoint(String questPoint, String userId, Model model) {
		if (questPoint == null || questPoint.equals("")) {
			return;
		}
		int questPointNum = Integer.valueOf(questPoint);
		adminService.updateQuestPoint(userId, questPointNum);
		
	}


	
	
	@PreAuthorize("hasAnyAuthority('ROLE_ADMIN', 'ROLE_BMANAGER')")
	@GetMapping("/charts")
	public String showAdminChartsPage() {
		
		return "admin/charts";
	}
	
	@PreAuthorize("hasAnyAuthority('ROLE_ADMIN', 'ROLE_BMANAGER')")
	@GetMapping("/charts/dailyMemberRegCntList")
	public ResponseEntity<List<Map<String, Object>>> getDailyMemberRegCntList() {
		List<Map<String, Object>> dailyMemberRegCntList = adminService.selectdailyMemberRegCntList();
		return new ResponseEntity<List<Map<String,Object>>>(dailyMemberRegCntList, HttpStatus.OK);
	}
	
	@PreAuthorize("hasAnyAuthority('ROLE_ADMIN', 'ROLE_BMANAGER')")
	@GetMapping("/bookingAndPaymentDataList")
	public String showBookingAndPaymentDataListPage(PagingDTO pagingDTO, String fromDate, String toDate, Model model) {
		List<Map<String, Object>> bookingAndPaymentDataList = adminService.selectBookingAndPaymentDataListPaging(pagingDTO, fromDate, toDate);
		model.addAttribute("bookingAndPaymentDataList", bookingAndPaymentDataList);
		
		long cnt = adminService.selectBookingAndPaymentDataRowAmountTotal(pagingDTO, fromDate, toDate);
		PagingCreatorDTO pagingCreator = new PagingCreatorDTO(cnt, pagingDTO);
		
		model.addAttribute("pagingCreator", pagingCreator);
		
		
		return "admin/bookingAndPaymentDataList";
		
	}
	
	
	@PreAuthorize("hasAnyAuthority('ROLE_ADMIN', 'ROLE_BMANAGER')")
	@GetMapping("/bookingAndPaymentDataListLocation")
	public String showBookingAndPaymentDataListPageLocation(PagingDTO pagingDTO, Principal principal, String fromDate, String toDate, Model model) {
		
		if(principal != null) {
			String userId = principal.getName();
			String ManagerLocation = questBookingService.selectBmanagerLocation(userId);
			
			model.addAttribute("bookingAndPaymentDataList", adminService.selectBookingAndPaymentDataListPagingLocation(pagingDTO, fromDate, toDate, ManagerLocation));
			
		}
		
		long cnt = adminService.selectBookingAndPaymentDataRowAmountTotal(pagingDTO, fromDate, toDate);
		PagingCreatorDTO pagingCreator = new PagingCreatorDTO(cnt, pagingDTO);
		
		model.addAttribute("pagingCreator", pagingCreator);
		
		
		return "admin/bookingAndPaymentDataList";
		
	}
	
	
	
	
	@PreAuthorize("hasAnyAuthority('ROLE_ADMIN', 'ROLE_BMANAGER')")
	@GetMapping("/sales")
	public String showAdminSalesPage() {
		
		return "admin/sales";
	}
	
	@PreAuthorize("hasAnyAuthority('ROLE_ADMIN', 'ROLE_BMANAGER')")
	@GetMapping("/sales/salesByBranchLocationList/{branchLocation}")
	public ResponseEntity<List<Map<String, Object>>> getSalesByBranchLocationList(@PathVariable String branchLocation) {
		List<Map<String, Object>> salesList = adminService.selectSalesByBranchLocationList(branchLocation);
		return new ResponseEntity<List<Map<String,Object>>>(salesList, HttpStatus.OK);
	}
	//
	
	//QnA차트	
	@PreAuthorize("hasAnyAuthority('ROLE_ADMIN', 'ROLE_BMANAGER')")
	@GetMapping("/charts/dailyQnAList")
	public ResponseEntity<List<Map<String, Object>>> getdailyQnAList() {
		List<Map<String, Object>> dailyQnAList = adminService.selectdailyQnAList();
		return new ResponseEntity<List<Map<String,Object>>>(dailyQnAList, HttpStatus.OK);
	}
	
	//review차트
	@PreAuthorize("hasAnyAuthority('ROLE_ADMIN', 'ROLE_BMANAGER')")
	@GetMapping("/charts/dailyReviewList")
	public ResponseEntity<List<Map<String, Object>>> getdailyReviewList() {
		List<Map<String, Object>> dailyReviewList = adminService.selectdailyReviewList();
		return new ResponseEntity<List<Map<String,Object>>>(dailyReviewList, HttpStatus.OK);
	}
	
	//quest차트
	@PreAuthorize("hasAnyAuthority('ROLE_ADMIN', 'ROLE_BMANAGER')")
	@GetMapping("/charts/questList")
	public ResponseEntity<List<Map<String, Object>>> getquestList() {
		List<Map<String, Object>> questList = adminService.selectquestList();
		return new ResponseEntity<List<Map<String,Object>>>(questList, HttpStatus.OK);
	}
	
	
	
	//각 지점 관리자의 예약 조회 상세 페이지
	@PreAuthorize("hasAnyAuthority('ROLE_ADMIN', 'ROLE_BMANAGER')")
	@GetMapping("/bookingMemberDetail")
	public String showMemberBookingDetailPage(Member member, PaymentData paymentData, Model model) {
		
		//questBookingService.get
		
		return "admin/bookingTimeDetailBoard";
	}
	
	
	
	
	
	
	
	
	
	
}
