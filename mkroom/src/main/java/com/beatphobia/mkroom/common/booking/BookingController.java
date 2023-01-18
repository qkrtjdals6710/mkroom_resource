package com.beatphobia.mkroom.common.booking;

import java.util.Map;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.beatphobia.mkroom.common.payment.PaymentData;
import com.beatphobia.mkroom.service.booking.BookingService;

@Controller
public class BookingController {
	
	
	private BookingService bookingService;
	
	public BookingController(BookingService bookingService) {
		this.bookingService = bookingService;
	}
	
	@PreAuthorize("isAuthenticated()")
	@GetMapping("/booking")
	public String showBookingPage() {
		return "common/booking";
	}
	
	@PreAuthorize("isAuthenticated()")
	@GetMapping("/bookingcompl")
	public String showBookingComplPage(PaymentData paymentData, Model model) {
		Map<String, Object> bookingAndPaymentData = bookingService.selectBookingAndPaymentData(paymentData);
		System.out.println(">>> bookingAndPaymentData" + bookingAndPaymentData);
		model.addAttribute("bookingAndPaymentData", bookingAndPaymentData);
		return "common/bookingcompl";
	}
}
