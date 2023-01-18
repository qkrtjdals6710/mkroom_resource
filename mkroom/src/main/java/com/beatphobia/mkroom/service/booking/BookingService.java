package com.beatphobia.mkroom.service.booking;

import java.util.Date;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.beatphobia.mkroom.common.payment.PaymentData;
import com.beatphobia.mkroom.domain.booking.QuestBookingData;

public interface BookingService {

	QuestBookingData selectQuestBookingData(QuestBookingData questBookingData);

	int insertQuestBookingData(QuestBookingData questBookingData);

	int deleteQuestBookingData(QuestBookingData questBookingData);

	int updateImpUid(QuestBookingData questBookingData);

	int deleteNotPay();

	Map<String, Object> selectBookingAndPaymentData(PaymentData paymentData);
}
