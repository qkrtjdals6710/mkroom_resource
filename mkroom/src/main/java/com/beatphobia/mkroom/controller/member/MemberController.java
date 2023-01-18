package com.beatphobia.mkroom.controller.member;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.beatphobia.mkroom.common.paging.PagingCreatorDTO;
import com.beatphobia.mkroom.common.paging.PagingDTO;
import com.beatphobia.mkroom.common.payment.PaymentData;
import com.beatphobia.mkroom.domain.member.Member;
import com.beatphobia.mkroom.domain.member.MemberAuthority;
import com.beatphobia.mkroom.service.member.MemberService;
import com.beatphobia.mkroom.service.quest.QuestBookingService;

@Controller
@RequestMapping("/member")
public class MemberController {
	
	private MemberService memberService;
	private QuestBookingService questBookingService;
	
	@Autowired
	private BCryptPasswordEncoder encoder;
	
	public MemberController(MemberService memberService, QuestBookingService questBookingService) {
		this.memberService = memberService;
		this.questBookingService = questBookingService;
	}
	
	// 회원가입페이지
	// GET  /member/register
	@GetMapping("/register")
	public void showMemberRegisterPage() {
		
	}
	
	// POST /member/register
	@PostMapping("/register")
	public String insertMember(Member member, Model model) {
		List<MemberAuthority> authorities = new ArrayList<MemberAuthority>();
		authorities.add(new MemberAuthority(member.getUserId(), "ROLE_MEMBER"));
		member.setAuthorityList(authorities);
		member.setUserPw(encoder.encode(member.getUserPw()));
		memberService.insertMember(member);
		
		
		return "redirect:/member/detail";
	}
	
	
	
	// 회원정보 수정페이지 
	// GET /member/modify
	@PreAuthorize("(isAuthenticated() && principal.username == #member.userId) or hasAuthority('ROLE_ADMIN')")
	@GetMapping("/modify")
	public void showMemberModifyPage(Member member, Model model) {
		model.addAttribute("member", 
				memberService.selectMember( member.getUserId() ) );
	}
	
	// POST /member/update
	@PreAuthorize("(isAuthenticated() && principal.username == #member.userId) or hasAuthority('ROLE_ADMIN')")
	@PostMapping("/update")
	public String updateMember(Member member, RedirectAttributes redirectAttributes) {
		Member updatedMember = memberService.selectMember(member.getUserId());
		updatedMember.setUserName(member.getUserName());
		updatedMember.setPhoneNumber(member.getPhoneNumber());
		updatedMember.setEmail(member.getEmail());
		
		memberService.updateMember(updatedMember);
		redirectAttributes.addAttribute("userId", updatedMember.getUserId());
		return "redirect:/member/detail";
	}
	
	// POST /member/updatePw
	@PreAuthorize("(isAuthenticated() && principal.username == #member.userId) or hasAuthority('ROLE_ADMIN')")
	@PostMapping("/updatePw")
	public String updateMemberPw(Member member, String newPw, String reEnterPw, RedirectAttributes redirectAttributes) {
		Member updatedMember = memberService.selectMember(member.getUserId());
		
		
		redirectAttributes.addAttribute("userId", updatedMember.getUserId());
	
		
		if (newPw == null || reEnterPw == null || !newPw.equals(reEnterPw)) {
			redirectAttributes.addAttribute("updatePw", "reEnterError");
			return "redirect:/member/detail";
		}
		updatedMember.setUserPw(encoder.encode(newPw));
		redirectAttributes.addAttribute("updatePw", "Success");
		memberService.updateMember(updatedMember);
		return "redirect:/member/detail";
	}
	
	// POST /member/delete
	@PreAuthorize("(isAuthenticated() && principal.username == #member.userId) or hasAuthority('ROLE_ADMIN')")
	@PostMapping("/delete")
	public String deleteMember(Member member) {
		memberService.deleteMember(member.getUserId());	
		return "redirect:/member/register";
	}
	
	
	// 회원상세페이지
	// GET /member/detail
	@PreAuthorize("(isAuthenticated() && principal.username == #member.userId) or hasAuthority('ROLE_ADMIN')")
	@GetMapping("/detail") 
	public String showMemberDetail(Member member, Model model) {

		Member theMember = memberService.selectMember( member.getUserId() );
		if (theMember == null) {
			return "redirect:/accessForbiddenError";
		}
		model.addAttribute("member", theMember);
		return "/member/detail";
	}
	
	// 회원목록페이지
	// GET /member/list
	@PreAuthorize("hasAnyAuthority('ROLE_ADMIN', 'ROLE_BMANAGER')")
	@GetMapping("/list_admin")
	public String showMemberListPage(PagingDTO pagingDTO, Model model) {
		model.addAttribute("memberList",
				memberService.selectMemberListPaging(pagingDTO) );
		
		long cnt = memberService.selectRowAmountTotal(pagingDTO);
		PagingCreatorDTO pagingCreatorDTO = new PagingCreatorDTO(cnt, pagingDTO);
		
		model.addAttribute("pagingCreator", pagingCreatorDTO);
		return "member/list";
	}
	
	
	// 지점별 회원목록페이지
	// GET /member/list
//	@PreAuthorize("hasAnyAuthority('ROLE_ADMIN', 'ROLE_BMANAGER')")
//	@GetMapping("/list_manager")
//	public String showBMemberListPage(PagingDTO pagingDTO, Principal principal, Model model) {
//
//		if(principal != null) {
//			String userId = principal.getName();
//			String ManagerLocation = questBookingService.selectBmanagerLocation(userId);
//			model.addAttribute("memberList",
//					memberService.selectMemberListPagingLocation(pagingDTO, ManagerLocation));
//		}
//		
//		long cnt = memberService.selectRowAmountTotal(pagingDTO);
//		PagingCreatorDTO pagingCreatorDTO = new PagingCreatorDTO(cnt, pagingDTO);
//		
//		model.addAttribute("pagingCreator", pagingCreatorDTO);
//		return "member/list";
//	}
	
	
	
	
	// 회원 댓글(이벤트게시판의)목록페이지
	// GET /member/eventReplyList
	@PreAuthorize("(isAuthenticated() && principal.username == #member.userId) or hasAuthority('ROLE_ADMIN')")
	@GetMapping("/eventReplyList") 
	public String showMemberEventReplyListPage(Member member, PagingDTO pagingDTO, Model model) {
		
		model.addAttribute("memberEventReplyList", 
				memberService.selectMemberEventReplyListPaging(member, pagingDTO) );
		long cnt = memberService.selectMemberEventReplyRowAmountTotal(member, pagingDTO);
		PagingCreatorDTO pagingCreatorDTO = new PagingCreatorDTO(cnt, pagingDTO);
		
		model.addAttribute("pagingCreator", pagingCreatorDTO);
		return "member/eventReplyList";
	}
	
	// 회원 질문목록페이지
	// GET /member/qnaList
	@PreAuthorize("(isAuthenticated() && principal.username == #member.userId) or hasAuthority('ROLE_ADMIN')")
	@GetMapping("/qnaList")
	public String showMemberQnaListPage(Member member, PagingDTO pagingDTO, Model model) {
		model.addAttribute("memberQnaList", 
				memberService.selectMemberQnaListPaging(member, pagingDTO) );
		long cnt = memberService.selectMemberQnaRowAmountTotal(member, pagingDTO);
		PagingCreatorDTO pagingCreatorDTO = new PagingCreatorDTO(cnt, pagingDTO);
		
		model.addAttribute("pagingCreator", pagingCreatorDTO);
		return "member/qnaList";
	}
	
	
	// 회원 예약목록페이지
	// GET /member/bookingList
	@PreAuthorize("(isAuthenticated() && principal.username == #member.userId) or hasAuthority('ROLE_ADMIN')")
	@GetMapping("/bookingList")
	public String showMemberBookingListPage(Member member, PagingDTO pagingDTO, Model model) {
		model.addAttribute("memberBookingList", 
				memberService.selectMemberBookingListPaging(member, pagingDTO) );
		long cnt = memberService.selectMemberBookingRowAmountTotal(member, pagingDTO);
		PagingCreatorDTO pagingCreatorDTO = new PagingCreatorDTO(cnt, pagingDTO);
		
		model.addAttribute("pagingCreator", pagingCreatorDTO);
		return "member/bookingList";
	}
	
	
	// 회원 결제목록페이지
	// GET /member/paymentDataList
	@PreAuthorize("(isAuthenticated() && principal.username == #member.userId) or hasAuthority('ROLE_ADMIN')")
	@GetMapping("/paymentDataList")
	public String showMemberPaymentDataListPage(Member member, PagingDTO pagingDTO, Model model) {
		model.addAttribute("memberPaymentDataList", 
				memberService.selectMemberPaymentDataListPaging(member, pagingDTO) );
		long cnt = memberService.selectMemberPaymentDataRowAmountTotal(member, pagingDTO);
		PagingCreatorDTO pagingCreatorDTO = new PagingCreatorDTO(cnt, pagingDTO);
		
		model.addAttribute("pagingCreator", pagingCreatorDTO);
		return "member/paymentDataList";
	}
	
	// 회원 예약 및 결제 상세페이지
	// GET /member/bookingAndPaymentDataDetail
	@PreAuthorize("(isAuthenticated() && principal.username == #member.userId) or hasAuthority('ROLE_ADMIN')")
	@GetMapping("/bookingAndPaymentDataDetail")
	public String showMemberBookingAndPaymentDataDetailPage(Member member, PaymentData paymentData, Model model) {
		model.addAttribute("memberBookingAndPaymentData", 
				memberService.selectMemberBookingAndPaymentData(member, paymentData) );
		return "member/bookingAndPaymentDataDetail";
	}

	
	
	
	
	// 회원 리뷰목록페이지
	// GET /member/reviewList
	@PreAuthorize("(isAuthenticated() && principal.username == #member.userId) or hasAuthority('ROLE_ADMIN')")
	@GetMapping("/reviewList")
	public String showMemberReviewListPage(Member member, PagingDTO pagingDTO, Model model) {
		model.addAttribute("memberReviewList", 
				memberService.selectMemberReviewListPaging(member, pagingDTO) );
		long cnt = memberService.selectMemberReviewRowAmountTotal(member, pagingDTO);
		PagingCreatorDTO pagingCreatorDTO = new PagingCreatorDTO(cnt, pagingDTO);
		
		model.addAttribute("pagingCreator", pagingCreatorDTO);
		return "member/reviewList";
	}

}
