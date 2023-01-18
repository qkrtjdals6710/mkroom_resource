package com.beatphobia.mkroom.service.booking;

import java.util.Date;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.beatphobia.mkroom.common.payment.PaymentData;
import com.beatphobia.mkroom.domain.booking.QuestBookingData;
import com.beatphobia.mkroom.mapper.BookingMapper;

@Service
public class BookingServiceImpl implements BookingService {

	private BookingMapper bookingMapper;
	
	public BookingServiceImpl(BookingMapper bookingMapper) {
		this.bookingMapper = bookingMapper;
	}
	
	@Override
	public QuestBookingData selectQuestBookingData(QuestBookingData questBookingData) {
		QuestBookingData theQuestBookingData =
				bookingMapper.selectQuestBookingData(questBookingData);
		return theQuestBookingData;
	}

	@Override
	public int insertQuestBookingData(QuestBookingData questBookingData) {
		int cnt = bookingMapper.insertQuestBookingData(questBookingData);
		return cnt;
	}

	@Override
	public int deleteQuestBookingData(QuestBookingData questBookingData) {
		int cnt = bookingMapper.deleteQuestBookingData(questBookingData);
		return cnt;
	}

	@Override
	public int updateImpUid(QuestBookingData questBookingData) {
		int cnt = bookingMapper.updateImpUid(questBookingData);
		return cnt;
	}

	@Override
	public int deleteNotPay() {
		int cnt = bookingMapper.deleteNotPay();
		return cnt;
	}

	@Override
	public Map<String, Object> selectBookingAndPaymentData(PaymentData paymentData) {
		Map<String, Object> bookingAndPaymentData = bookingMapper.selectBookingAndPaymentData(paymentData);
		return bookingAndPaymentData;
	}
	

	
}
