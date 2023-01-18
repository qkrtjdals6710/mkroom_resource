package com.beatphobia.mkroom.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.beatphobia.mkroom.common.paging.ReviewCreatorDTO;
import com.beatphobia.mkroom.common.paging.ReviewDTO;
import com.beatphobia.mkroom.domain.review.Review;

import lombok.AllArgsConstructor;

@RequestMapping(value = {"/reviews/*"})
@RestController
@AllArgsConstructor
public class ReviewController {
	private com.beatphobia.mkroom.service.review.ReviewService reviewService;
	@GetMapping(value = "/{questName}/{branchLocation}/page/{page}", produces = "application/json; charset=utf-8")
	public ResponseEntity<ReviewCreatorDTO> getReviewList(@PathVariable("questName") String questName, 
														@PathVariable("branchLocation") String branchLocation, 
														@PathVariable("page") Integer pageNum){
		
		ReviewCreatorDTO reviewCreatorDTO=reviewService.getReviewList(new ReviewDTO(questName, branchLocation, pageNum));
		return new ResponseEntity<ReviewCreatorDTO>(reviewCreatorDTO,HttpStatus.OK);
	}
	@GetMapping(value = "/{questName}/{branchLocation}/avg", produces = "application/json; charset=utf-8")
	public ResponseEntity<String> getReviewAvg(@PathVariable("questName") String questName, 
											@PathVariable("branchLocation") String branchLocation){
		if (questName == null || questName.equals("")) {
			return new ResponseEntity<String>("" ,HttpStatus.BAD_REQUEST);
		}
		
		if (branchLocation == null || branchLocation.equals("")) {
			return new ResponseEntity<String>("" ,HttpStatus.BAD_REQUEST);
		}
		
		if(reviewService.getReviewAvg(questName, branchLocation) == null) {
			return new ResponseEntity<String>("" ,HttpStatus.BAD_REQUEST);
		}
		
		String reviewAvg=reviewService.getReviewAvg(questName, branchLocation).getReviewAvg();
		return new ResponseEntity<String>(reviewAvg,HttpStatus.OK);
	}
//	@PreAuthorize("isAuthenticated()")
	@PostMapping(value = "/{questName}/{branchLocation}/new", produces = "text/plain; charset=utf-8", consumes = "application/json; charset=utf-8")
	public ResponseEntity<String> registerReview(
												@PathVariable("questName") String questName, 
												@PathVariable("branchLocation") String branchLocation, 
												@RequestBody Review review){
		Long registeredRno=reviewService.registerReview(review);
		return registeredRno!=null?new ResponseEntity<String>("RegisterReply",HttpStatus.OK):new ResponseEntity<String>("RegisterReviewFail",HttpStatus.INTERNAL_SERVER_ERROR);
	}
	@GetMapping(value = "/{questName}/{branchLocation}/{rno}", produces = "application/json; charset=utf-8")
	public ResponseEntity<Review> getReview(@PathVariable("questName") String questName,
											@PathVariable("branchLocation") String branchLocation, 
											@PathVariable("rno") Long rno){
		Review review=reviewService.getReview(questName, branchLocation, rno);
		return new ResponseEntity<Review>(review,HttpStatus.OK);
	}
//	@PreAuthorize("isAuthenticated()&&principal.username==#review.rwriter")
	@RequestMapping(value = "/{questName}/{branchLocation}/{rno}", method = {RequestMethod.PATCH, RequestMethod.PUT}, consumes = "application/json; charset=utf-8", produces = "text/plain; charset=utf-8")
//	@PutMapping(value = "/{questName}/{branchLocation}/{rno}", consumes = "application/json; charset=utf-8", produces = "text/plain; charset=utf-8")
	public ResponseEntity<String> modifyReview(@PathVariable("questName") String questName,
												@PathVariable("branchLocation") String branchLocation, 
												@PathVariable("rno") Long rno, 
												@RequestBody Review review){
		int modCnt=reviewService.modifyReview(review);
		return modCnt==1?new ResponseEntity<String>("ModifyReply",HttpStatus.OK):new ResponseEntity<String>("ModifyFail",HttpStatus.INTERNAL_SERVER_ERROR);
	}
//	@PreAuthorize("isAuthenticated()&&principal.username==#review.rwriter")
//	@DeleteMapping(value = "/{rno}/del", produces = "text/plain; charset=UTF-8")
	@RequestMapping(value = "/{rno}/del", method = {RequestMethod.DELETE}, consumes = "application/json; charset=utf-8", produces = "text/plain; charset=utf-8")
	public ResponseEntity<String> removeReview( @PathVariable("rno") Long rno){
		int delCnt=reviewService.removeReview(rno);
		return delCnt==1?new ResponseEntity<>("DeleteReply",HttpStatus.OK):new ResponseEntity<>("DeleteFail",HttpStatus.INTERNAL_SERVER_ERROR);
	}
}
