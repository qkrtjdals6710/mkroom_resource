package com.beatphobia.mkroom.mapper;

import java.util.Date;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.beatphobia.mkroom.common.payment.PaymentData;
import com.beatphobia.mkroom.domain.booking.QuestBookingData;
import com.beatphobia.mkroom.domain.member.Member;

public interface BookingMapper {

	QuestBookingData selectQuestBookingData(QuestBookingData questBookingData);
	
	int insertQuestBookingData(QuestBookingData questBookingData);

	int deleteQuestBookingData(QuestBookingData questBookingData);

	int updateImpUid(QuestBookingData questBookingData);
	
	int deleteNotPay();

	Map<String, Object> selectBookingAndPaymentData(@Param("paymentData") PaymentData paymentData);
	
	
	
}
