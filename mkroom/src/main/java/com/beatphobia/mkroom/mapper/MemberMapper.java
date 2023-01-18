package com.beatphobia.mkroom.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.beatphobia.mkroom.common.paging.PagingDTO;
import com.beatphobia.mkroom.common.payment.PaymentData;
import com.beatphobia.mkroom.domain.member.Member;
import com.beatphobia.mkroom.domain.member.MemberAuthority;

public interface MemberMapper {

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

	List<Map<String, Object>> selectMemberEventReplyListPaging(@Param("member") Member member, @Param("pagingDTO") PagingDTO pagingDTO);
	
	long selectMemberEventReplyRowAmountTotal(@Param("member") Member member, @Param("pagingDTO") PagingDTO pagingDTO);

	List<Map<String, Object>> selectMemberQnaListPaging(@Param("member") Member member, @Param("pagingDTO") PagingDTO pagingDTO);
	
	long selectMemberQnaRowAmountTotal(@Param("member") Member member, @Param("pagingDTO") PagingDTO pagingDTO);
	
	List<Map<String, Object>> selectMemberBookingListPaging(@Param("member") Member member, @Param("pagingDTO") PagingDTO pagingDTO);
	
	long selectMemberBookingRowAmountTotal(@Param("member") Member member, @Param("pagingDTO") PagingDTO pagingDTO);
	
	List<Map<String, Object>> selectMemberPaymentDataListPaging(@Param("member") Member member, @Param("pagingDTO") PagingDTO pagingDTO);
	
	long selectMemberPaymentDataRowAmountTotal(@Param("member") Member member, @Param("pagingDTO") PagingDTO pagingDTO);
	
	Map<String, Object> selectMemberBookingAndPaymentData(@Param("member") Member member, @Param("paymentData") PaymentData paymentData);
	
	List<Map<String, Object>> selectMemberReviewListPaging(@Param("member") Member member, @Param("pagingDTO") PagingDTO pagingDTO);
	
	long selectMemberReviewRowAmountTotal(@Param("member") Member member, @Param("pagingDTO") PagingDTO pagingDTO);
}
