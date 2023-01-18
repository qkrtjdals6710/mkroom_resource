package com.beatphobia.mkroom.common.payment;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class PaymentData {
	
	private String impUid; 
	private String merchantUid; 
	private String productName;	
	private String branchLoaction;	
	private Date selectTime;
	private long amount;	// 결제금액
	private Date paidAt;	// 시간
	
	private String buyerId; 

		
}
