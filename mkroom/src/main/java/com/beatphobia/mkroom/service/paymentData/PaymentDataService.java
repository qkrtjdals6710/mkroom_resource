package com.beatphobia.mkroom.service.paymentData;

import java.util.Map;

import com.beatphobia.mkroom.common.payment.PaymentData;

public interface PaymentDataService {

	int insertPaymentData(PaymentData paymentData);

	Map<String, Object> selectBuyerIdAndImpUidMap(String branchLocation, String questName, String selectTime);
	

}
