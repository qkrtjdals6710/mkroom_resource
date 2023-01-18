package com.beatphobia.mkroom.service.paymentData;

import java.util.Map;

import org.springframework.stereotype.Service;

import com.beatphobia.mkroom.common.payment.PaymentData;
import com.beatphobia.mkroom.mapper.PaymentDataMapper;

@Service
public class PaymentDataServiceImpl implements PaymentDataService {

	private PaymentDataMapper paymentDataMapper;
	
	public PaymentDataServiceImpl(PaymentDataMapper paymentDataMapper) {
		this.paymentDataMapper = paymentDataMapper;
	}
	
	@Override
	public int insertPaymentData(PaymentData paymentData) {
		int cnt = paymentDataMapper.insert(paymentData);
		return cnt;
		
	}
	
	//예약 데이터 상세 조회
	@Override
	public Map<String, Object> selectBuyerIdAndImpUidMap(String branchLocation, String questName, String selectTime){
		
		return paymentDataMapper.selectBuyerIdAndImpUidMap(branchLocation, questName, selectTime);
	}
	
	
}
