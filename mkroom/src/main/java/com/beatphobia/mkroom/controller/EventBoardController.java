package com.beatphobia.mkroom.controller;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.beatphobia.mkroom.common.fileupload.BoardFileInfoDTO;
import com.beatphobia.mkroom.common.paging.EventBoardPagingCreatorDTO;
import com.beatphobia.mkroom.common.paging.EventBoardPagingDTO;
import com.beatphobia.mkroom.domain.noticeevent.NoticeEventDTO;
import com.beatphobia.mkroom.service.eventboard.EventBoardService;

import lombok.AllArgsConstructor;

@Controller
@AllArgsConstructor // myBoardService 필드에 서비스 객체를 주입하기 위해 사용됨
@RequestMapping(value="/eventboard/*")
public class EventBoardController {
	
	private EventBoardService eventBoardService;
	
	@GetMapping("/list")
	public void showEventBoardList(EventBoardPagingDTO eventBoardPagingDTO, Model model ) {
		
		long rowAmountTotal = eventBoardService.getRowAmountTotal(eventBoardPagingDTO) ; 
		EventBoardPagingCreatorDTO eventBoardPagingCreatorDTO = new EventBoardPagingCreatorDTO(rowAmountTotal, eventBoardPagingDTO) ;		
		model.addAttribute("pagingCreator", eventBoardPagingCreatorDTO) ;
		
		model.addAttribute("eventBoardList", eventBoardService.getBoardList(eventBoardPagingDTO)) ;	

	}//showEventBoardList
	
	//@PreAuthorize("isAuthenticated()")
	@GetMapping("/register")
	public String showEventBoardRegister() {
		return "/eventboard/register";
	}
	
	
	//@PreAuthorize("isAuthenticated()")
	@PostMapping("/register")
	@Transactional
	public String registerNewEventBoard(NoticeEventDTO noticeEventDTO, RedirectAttributes redirectAttr) {	

		long registerBno = eventBoardService.getFilnalBno() + 1;
		noticeEventDTO.setBno(registerBno);	
			
		eventBoardService.registerBoard(noticeEventDTO);
		
		List<BoardFileInfoDTO> fileInfos = noticeEventDTO.getFileInfos();

		if ((fileInfos != null) && (noticeEventDTO.getBno() != 0)) {
			
			fileInfos.forEach(fileInfo -> eventBoardService.registerFile(fileInfo, noticeEventDTO));
		}
		
		
		
		return "redirect:/eventboard/list" ; 
	
	}
	
	
	@GetMapping("/detail")
	public void showBoardDetail(Long bno, EventBoardPagingDTO eventBoardPagingDTO, Model model) {	
		
		model.addAttribute("eventboard", eventBoardService.getBoard(bno)) ;
		model.addAttribute("eventBoardPagingDTO", eventBoardPagingDTO) ;	
		model.addAttribute("eventImageInfo", eventBoardService.getAttachFiles(bno)) ;
		
	}
	
	
	@GetMapping(value="/getFiles" , produces = {"application/json;charset=utf-8"})
	@ResponseBody
	public ResponseEntity<List<BoardFileInfoDTO>> showAttachFiles(NoticeEventDTO noticeEventDTO){
		
			if(eventBoardService.getAttachFiles(noticeEventDTO.getBno()).getFileInfos() == null) {
				
				return null;
				
			} else {
	
			return new ResponseEntity<List<BoardFileInfoDTO>>(eventBoardService.getAttachFiles(noticeEventDTO.getBno()).getFileInfos(), HttpStatus.OK);
			
			}
		
	}
	
	//@PreAuthorize("isAuthenticated() && principal.username == #bwriter") //: detail.jsp의 수정버튼 클릭 이벤트 화면으로부터 bwriter 값을 받아서, 매개변수에 저장하도록 수정
	@GetMapping("/modify")
	public void showEventBoardModify(long bno, EventBoardPagingDTO eventBoardPagingDTO, Model model) {	
		
		model.addAttribute("eventBoardPagingDTO", eventBoardPagingDTO) ;
		model.addAttribute("eventboard", eventBoardService.getBoardDetailModify(bno)) ; //조회수 변동 x	
		
	}
	
	//@PreAuthorize("isAuthenticated() && principal.username == #eventboard.bwriter")
	@PostMapping("/modify")
	@Transactional
	public String modifyBoard(NoticeEventDTO noticeEventDTO, EventBoardPagingDTO eventBoardPagingDTO, Model model ) {
		
		
		eventBoardService.modifyBoard(noticeEventDTO);
		
		model.addAttribute("eventboard", eventBoardService.getBoard(noticeEventDTO.getBno())) ;
		model.addAttribute("eventBoardPagingDTO", eventBoardPagingDTO) ;	
		model.addAttribute("eventImageInfo", eventBoardService.getAttachFiles(noticeEventDTO.getBno())) ;
		
		return "/eventboard/detail" ;
	}
	
	
	@PostMapping("/modifyCancel")
	@Transactional
	public String modifyCancelBoard(NoticeEventDTO noticeEventDTO, EventBoardPagingDTO eventBoardPagingDTO, 
									RedirectAttributes redirectAttr, Model model ) {
		
		eventBoardService.modifyCancelBoard(noticeEventDTO);
		return "redirect:/eventboard/list" ;
	}
	
	
	@PostMapping("/delete")
	public String deleteEventBoard(Long bno, String bwriter, RedirectAttributes redirectAttr, EventBoardPagingDTO eventBoardPagingDTO) {
		
		if(eventBoardService.setBoardDeleted(bno)) {
			redirectAttr.addFlashAttribute("result", "successRemove") ;
		} else {
			redirectAttr.addFlashAttribute("result", "failRemove") ;
		}
		
		redirectAttr.addAttribute("pageNum", eventBoardPagingDTO.getPageNum());
		redirectAttr.addAttribute("rowAmountPerPage", eventBoardPagingDTO.getRowAmountPerPage()) ;
		redirectAttr.addAttribute("scope", eventBoardPagingDTO.getScope()) ;
		redirectAttr.addAttribute("keyword", eventBoardPagingDTO.getKeyword()) ;

		return "redirect:/eventboard/list" ;
	}
	
	

	
	
}//end
