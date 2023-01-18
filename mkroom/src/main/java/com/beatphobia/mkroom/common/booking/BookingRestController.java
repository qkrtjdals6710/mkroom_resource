package com.beatphobia.mkroom.common.booking;

import java.util.Date;
import java.util.Map;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.beatphobia.mkroom.domain.booking.QuestBookingData;
import com.beatphobia.mkroom.service.booking.BookingService;

@RestController
public class BookingRestController {
	
	private BookingService bookingService;
	
	
	public BookingRestController(BookingService bookingService) {
		this.bookingService = bookingService;
	}
	
	@PostMapping("/validateBooking")
	public ResponseEntity<String> validateBooking(@RequestBody QuestBookingData questBookingData) {
		
		System.out.println(">>> " + questBookingData);
		QuestBookingData theQuestBookingData =  bookingService.selectQuestBookingData(questBookingData);
		
		if (theQuestBookingData != null) {
			return new ResponseEntity<String>("fail", HttpStatus.BAD_REQUEST);
		}
		
		
		bookingService.insertQuestBookingData(questBookingData);
		
		return new ResponseEntity<String>("ok" , HttpStatus.OK);
	}
	
	@DeleteMapping("/deleteBooking")
	public ResponseEntity<String> deleteBooking(@RequestBody QuestBookingData questBookingData) {
		
		System.out.println(">>> deleteBooking " + questBookingData);
		
		
		bookingService.deleteQuestBookingData(questBookingData);
		
		return new ResponseEntity<String>("ok" , HttpStatus.OK);
	}
	
}
