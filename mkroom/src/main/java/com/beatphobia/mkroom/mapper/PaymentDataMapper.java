package com.beatphobia.mkroom.mapper;

import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.beatphobia.mkroom.common.payment.PaymentData;

public interface PaymentDataMapper {

	int insert(PaymentData paymentData);
	
	Map<String, Object> selectBuyerIdAndImpUidMap(@Param("branchLocation") String branchLocation, @Param("questName") String questName, @Param("selectTime") String selectTime);
	
	
}
