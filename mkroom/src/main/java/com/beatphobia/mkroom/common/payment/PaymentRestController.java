package com.beatphobia.mkroom.common.payment;

import java.io.IOException;
import java.math.BigDecimal;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.beatphobia.mkroom.domain.booking.QuestBookingData;
import com.beatphobia.mkroom.service.booking.BookingService;
import com.beatphobia.mkroom.service.paymentData.PaymentDataService;
import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.exception.IamportResponseException;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.Payment;

@RestController
public class PaymentRestController {
	private IamportClient iamportClient;
	
	private PaymentDataService paymentDataService;
	private BookingService bookingService;
	
	public PaymentRestController(PaymentDataService paymentDataService, BookingService bookingService) {
		iamportClient =  new IamportClient("7654554607003538",
				"7D1ZVmQizDM4rz9DODAWbY1KfIjtpZxOxIH3o0XSzEEy2xDMHZsEpWLivr2MWeInD2jkEj0rJYCiTZX6");
		
		this.paymentDataService = paymentDataService;
		this.bookingService = bookingService;
	}
	
	@GetMapping("/payment/verify/{imp_uid}/{paid_amount}")
	public ResponseEntity<Payment> verify(@PathVariable String imp_uid, @PathVariable String paid_amount) {
//		System.out.println(">>> " + imp_uid);
//		System.out.println(">>> " + paid_amount);
		IamportResponse<Payment> iamportResponse = null;
		try {
			iamportResponse = iamportClient.paymentByImpUid(imp_uid);
		} catch (IamportResponseException | IOException e) {
			e.printStackTrace();
		}
		
//		System.out.println(">>> ImpUid " + iamportResponse.getResponse().getImpUid());
//		System.out.println(">>> MerchantUid " + iamportResponse.getResponse().getMerchantUid());
		
		
		// 클라이언트단에서 위조했는지 확인하기 위해 서버에서 결제금액으로 검증하는 것을 권장
		BigDecimal amount = BigDecimal.valueOf(Long.parseLong(paid_amount));
		
		if (iamportResponse.getResponse().getAmount().equals(amount)) {
			System.out.println(">>> 검증된 결제입니다");
			return ResponseEntity.ok(iamportResponse.getResponse());
		} else {
			System.out.println(">>> 검증되지 않은 결제입니다");
			return new ResponseEntity(null, HttpStatus.BAD_REQUEST);
		}
		
		
		
	}
	
	@PostMapping("payment/insert")
	public ResponseEntity<String> insert(@RequestBody PaymentData paymentData) {
		
		
		paymentDataService.insertPaymentData(paymentData);
		
		QuestBookingData questBookingData = new QuestBookingData();
		questBookingData.setQuestName(paymentData.getProductName());
		questBookingData.setBranchLocation(paymentData.getBranchLoaction());
		questBookingData.setSelectTime(paymentData.getSelectTime());
		questBookingData.setImpUid(paymentData.getImpUid());
		
		System.out.println(">>>: " + questBookingData);
		bookingService.updateImpUid(questBookingData);
		
		return new ResponseEntity<String>("ok", HttpStatus.OK);
		
	}
	

	
}
