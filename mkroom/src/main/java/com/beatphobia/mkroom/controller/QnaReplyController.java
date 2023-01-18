package com.beatphobia.mkroom.controller;

//import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.log;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.beatphobia.mkroom.common.paging.QnaReplyPagingCreatorDTO;
import com.beatphobia.mkroom.common.paging.QnaReplyPagingDTO;
import com.beatphobia.mkroom.domain.qna.QnaReplyDTO;
import com.beatphobia.mkroom.service.qna.QnaReplyService;

import lombok.AllArgsConstructor;

@RequestMapping(value = { "/qnareplies/*" })
@RestController
@AllArgsConstructor
public class QnaReplyController {

	private QnaReplyService qnaReplyService;

	// 게시물에 대한 댓글 목록 조회
	@GetMapping(value = "/{bno}/page/{page}", produces = { "application/json; charset=utf-8" })
	public ResponseEntity<QnaReplyPagingCreatorDTO> showReplyList(@PathVariable("bno") long bno,
			@PathVariable("page") Integer pageNum) {
		
		
		
		QnaReplyPagingCreatorDTO replyPagingCreator = qnaReplyService.getReplyList(new QnaReplyPagingDTO(bno, pageNum));



		return new ResponseEntity<QnaReplyPagingCreatorDTO>(replyPagingCreator, HttpStatus.OK);
	}

	// 게시물에 대한 댓글 등록(rno 반환)
	@PostMapping(value = "/{bno}/new", produces = "text/plain; charset=utf-8", consumes = "application/json; charset=utf-8")
	@ResponseBody
	public ResponseEntity<String> registerReplyForBoard(@PathVariable("bno") Long bno,
			@RequestBody QnaReplyDTO qnaReply) {

		System.out.println(">>> bno" + bno);
		System.out.println(">>> qnaReply" + qnaReply);
		Long registeredRno = qnaReplyService.registerReplyForBoard(qnaReply);
		return registeredRno != null ? new ResponseEntity<String>("RegisterSuccess", HttpStatus.OK)
				: new ResponseEntity<String>("RegisterFail", HttpStatus.INTERNAL_SERVER_ERROR);
	}

	// 댓글에 대한 답글 등록(rno 반환)
	@PostMapping(value = "/{bno}/{prno}/new", produces = "text/plain; charset=utf-8", consumes = "application/json; charset=utf-8")
	public ResponseEntity<String> registerReplyForReply(@PathVariable("bno") Long bno, 
														@PathVariable("prno") Long prno,
														@RequestBody QnaReplyDTO qnaReply) {

		Long registeredRno = qnaReplyService.registerReplyForReply(qnaReply);

		return registeredRno != null ? new ResponseEntity<String>("RegisterSuccess", HttpStatus.OK)
				: new ResponseEntity<String>("RegisterFail", HttpStatus.INTERNAL_SERVER_ERROR);
	}

	// 게시물에 대한 특정 댓글 조회: 

	@GetMapping(value = "/{bno}/{rno}", produces = "application/json;charset=utf-8")
	public ResponseEntity<QnaReplyDTO> showReply(@PathVariable("bno") Long bno, 
												@PathVariable("rno") Long rno) {

		QnaReplyDTO qnaReply = qnaReplyService.getReply(bno, rno);

		return new ResponseEntity<QnaReplyDTO>(qnaReply, HttpStatus.OK);
	}

	// 게시물에 대한 특정 댓글 수정
	@RequestMapping(value = "/{bno}/{rno}", method = { RequestMethod.PATCH,
			RequestMethod.PUT }, consumes = "application/json;charset=utf-8", produces = "text/plain; charset=utf-8")
	public ResponseEntity<String> modifyReply(@PathVariable("bno") Long bno, 
											  @PathVariable("rno") Long rno,
											  @RequestBody QnaReplyDTO qnaReply) {
				
		int modCnt = qnaReplyService.modifyReply(qnaReply);

		return modCnt == 1 ? new ResponseEntity<String>("ModifySuccess", HttpStatus.OK)
				: new ResponseEntity<String>("ModifyFail", HttpStatus.INTERNAL_SERVER_ERROR);
	}

	// 게시물에 대한 특정 댓글 삭제
	@DeleteMapping(value = "/{bno}/{rno}", produces = { "text/plain; charset=UTF-8" })
	public ResponseEntity<String> removeReply(@PathVariable("bno") Long bno, 
											  @PathVariable("rno") Long rno,
											  @RequestBody QnaReplyDTO qnaReply) { 
		

		int delCnt = qnaReplyService.removeReply(bno, rno);

		return delCnt == 1 ? new ResponseEntity<>("DeleteSuccess", HttpStatus.OK)
				: new ResponseEntity<>("DeleteFail", HttpStatus.INTERNAL_SERVER_ERROR);
	}

}
