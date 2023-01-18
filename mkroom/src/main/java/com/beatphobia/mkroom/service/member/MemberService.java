package com.beatphobia.mkroom.service.member;

import java.util.List;
import java.util.Map;

import com.beatphobia.mkroom.common.paging.PagingDTO;
import com.beatphobia.mkroom.common.payment.PaymentData;
import com.beatphobia.mkroom.domain.member.Member;
import com.beatphobia.mkroom.domain.member.MemberAuthority;

public interface MemberService {

	int insertMember(Member member);
	
	int insertAuthority(MemberAuthority authority);
	
	Member selectMember(String userId);

	int updateMember(Member member);
	
	int deleteMember(String userId);

	int deleteAuthority(MemberAuthority authority);
	
	List<Member> selectMemberList();

	List<Member> selectMemberListPaging(PagingDTO pagingDTO);
	
	List<Member> selectMemberListPagingLocation(PagingDTO pagingDTO, String ManagerLocation);
	
	long selectRowAmountTotal(PagingDTO pagingDTO);

	List<Map<String, Object>> selectMemberEventReplyListPaging(Member member, PagingDTO pagingDTO);

	long selectMemberEventReplyRowAmountTotal(Member member, PagingDTO pagingDTO);

	List<Map<String, Object>> selectMemberQnaListPaging(Member member, PagingDTO pagingDTO);

	long selectMemberQnaRowAmountTotal(Member member, PagingDTO pagingDTO);
	
	List<Map<String, Object>> selectMemberBookingListPaging(Member member, PagingDTO pagingDTO);
	
	long selectMemberBookingRowAmountTotal(Member member, PagingDTO pagingDTO);
	
	List<Map<String, Object>> selectMemberPaymentDataListPaging(Member member, PagingDTO pagingDTO);
	
	long selectMemberPaymentDataRowAmountTotal(Member member, PagingDTO pagingDTO);
	
	Map<String, Object> selectMemberBookingAndPaymentData(Member member, PaymentData paymentData);
	
	List<Map<String, Object>> selectMemberReviewListPaging(Member member, PagingDTO pagingDTO);
	
	long selectMemberReviewRowAmountTotal(Member member, PagingDTO pagingDTO);

}
