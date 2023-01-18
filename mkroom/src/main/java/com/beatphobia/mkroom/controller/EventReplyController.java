package com.beatphobia.mkroom.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.beatphobia.mkroom.common.paging.EventReplyPagingCreatorDTO;
import com.beatphobia.mkroom.common.paging.EventReplyPagingDTO;
import com.beatphobia.mkroom.domain.noticeevent.NoticeEventReplyDTO;
import com.beatphobia.mkroom.service.eventboard.EventReplyService;

import lombok.AllArgsConstructor;

@RequestMapping(value = {"/replies/*"})
@RestController
@AllArgsConstructor
public class EventReplyController {
	private EventReplyService eventReplyService;
	@GetMapping(value = "/{bno}/page/{page}", produces = "application/json; charset=utf-8")
	public ResponseEntity<EventReplyPagingCreatorDTO> getEventReplyList(@PathVariable("bno") long bno, @PathVariable("page") Integer pageNum){
		EventReplyPagingCreatorDTO eventReplyPagingCreatorDTO=eventReplyService.getEventReplyList(new EventReplyPagingDTO(bno, pageNum));
		return new ResponseEntity<EventReplyPagingCreatorDTO>(eventReplyPagingCreatorDTO,HttpStatus.OK);
	}
//	@PreAuthorize("isAuthenticated()")
	@PostMapping(value = "/{bno}/new", produces = "text/plain; charset=utf-8", consumes = "application/json; charset=utf-8")
	public ResponseEntity<String> registerEventReplyForBoard(@PathVariable("bno") Long bno,@RequestBody NoticeEventReplyDTO noticeEventReplyDTO){
		Long registeredRno=eventReplyService.registerEventReplyForBoard(noticeEventReplyDTO);
		return registeredRno!=null?new ResponseEntity<String>("RegisterReply",HttpStatus.OK):new ResponseEntity<String>("RegisterReplyFail",HttpStatus.INTERNAL_SERVER_ERROR);
	}
//	@PreAuthorize("isAuthenticated()")
	@PostMapping(value = "/{bno}/{prno}/new", produces = "text/plain; charset=utf-8",consumes = "application/json; charset=utf-8")
	public ResponseEntity<String> registerEventReplyForReply (@PathVariable("bno") Long bno, @PathVariable("prno") Long prno, @RequestBody NoticeEventReplyDTO noticeEventReplyDTO){
		Long registeredRno=eventReplyService.registerEventReplyForReply(noticeEventReplyDTO); 
		return registeredRno!=null?new ResponseEntity<String>("RegisterReply",HttpStatus.OK):new ResponseEntity<String>("RegisterReplyFail",HttpStatus.INTERNAL_SERVER_ERROR);
	}
	@GetMapping(value = "/{bno}/{rno}", produces = "application/json; charset=utf-8")
	public ResponseEntity<NoticeEventReplyDTO> getEventReply(@PathVariable("bno") Long bno, @PathVariable("rno") Long rno){
		NoticeEventReplyDTO noticeEventReplyDTO=eventReplyService.getEventReply(bno, rno);
		return new ResponseEntity<NoticeEventReplyDTO>(noticeEventReplyDTO,HttpStatus.OK);
	}
//	@PreAuthorize("isAuthenticated()&&principal.username==#eventReply.rwriter")
	@RequestMapping(value = "/{bno}/{rno}", method = {RequestMethod.PATCH, RequestMethod.PUT}, consumes = "application/json; charset=utf-8", produces = "tex/plain; charset=utf-8")
	public ResponseEntity<String> modifyEventReply(@PathVariable("bno") Long bno, @PathVariable("rno") Long rno, @RequestBody NoticeEventReplyDTO noticeEventReplyDTO){
		int modCnt=eventReplyService.modifyEventReply(noticeEventReplyDTO);
		return modCnt==1?new ResponseEntity<String>("ModifyReply",HttpStatus.OK):new ResponseEntity<String>("ModifyFail",HttpStatus.INTERNAL_SERVER_ERROR);
	}
//	@PreAuthorize("isAuthenticated()&&principal.username==#eventReply.rwriter")
	@DeleteMapping(value = "/{bno}/{rno}", produces = "text/plain; charset=UTF-8")
	public ResponseEntity<String> removeEventReply(@PathVariable("bno") Long bno, @PathVariable("rno") Long rno, @RequestBody NoticeEventReplyDTO noticeEventReplyDTO){
		int delCnt=eventReplyService.removeEventReply(bno, rno);
		return delCnt==1?new ResponseEntity<>("DeleteReply",HttpStatus.OK):new ResponseEntity<>("DeleteFail",HttpStatus.INTERNAL_SERVER_ERROR);
	}
}
