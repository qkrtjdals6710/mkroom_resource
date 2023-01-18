package com.beatphobia.mkroom.service.member;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.beatphobia.mkroom.common.paging.PagingDTO;
import com.beatphobia.mkroom.common.payment.PaymentData;
import com.beatphobia.mkroom.domain.member.Member;
import com.beatphobia.mkroom.domain.member.MemberAuthority;
import com.beatphobia.mkroom.mapper.MemberMapper;

@Service
public class MemberServiceImpl implements MemberService {
	
	private MemberMapper memberMapper;
	
	public MemberServiceImpl(MemberMapper memberMapper) {
		this.memberMapper = memberMapper;
	}
	
	@Override
	@Transactional
	public int insertMember(Member member) {
		int cnt = memberMapper.insertMember(member);
		member.getAuthorityList().forEach((auth) -> {
			memberMapper.insertAuthority(new MemberAuthority(auth.getUserId(), auth.getAuthority()));
		});
		return cnt;
	}
	

	@Override
	public int insertAuthority(MemberAuthority authority) {
		int cnt = memberMapper.insertAuthority(authority);
		return 0;
	}
	
	@Override
	public Member selectMember(String userId) {
		Member member = memberMapper.selectMember(userId);
		return member;
	}

	@Override
	public int updateMember(Member member) {
		int cnt = memberMapper.updateMember(member);
		return cnt;
	}

	@Override
	@Transactional
	public int deleteMember(String userId) {
		Member member = memberMapper.selectMember(userId);
		member.getAuthorityList().forEach((auth) -> {
			memberMapper.deleteAuthority(auth);
		});
		int cnt = memberMapper.deleteMember(userId);
		return cnt;
	}

	@Override
	public int deleteAuthority(MemberAuthority authority) {
		int cnt = memberMapper.deleteAuthority(authority);
		return cnt;
	}
	
	@Override
	public List<Member> selectMemberList() {
		List<Member> memberList = memberMapper.selectMemberList();
		return memberList;
	}

	@Override
	public List<Member> selectMemberListPaging(PagingDTO pagingDTO) {
		List<Member> memberList = memberMapper.selectMemberListPaging(pagingDTO);
		return memberList;
	}

	@Override
	public List<Member> selectMemberListPagingLocation(PagingDTO pagingDTO, String ManagerLocation){
		return memberMapper.selectMemberListPagingLocation(pagingDTO, ManagerLocation);
	}
	
	
	@Override
	public long selectRowAmountTotal(PagingDTO pagingDTO) {
		long cnt = memberMapper.selectRowAmountTotal(pagingDTO);
		return cnt;
	}

	
	@Override
	public List<Map<String, Object>> selectMemberEventReplyListPaging(Member member, PagingDTO pagingDTO) {
		
		List<Map<String, Object>> memberEventReplyList = memberMapper.selectMemberEventReplyListPaging(member, pagingDTO);
		
		return memberEventReplyList;
		
	}
	
	@Override
	public long selectMemberEventReplyRowAmountTotal(Member member, PagingDTO pagingDTO) {
		long cnt = memberMapper.selectMemberEventReplyRowAmountTotal(member, pagingDTO);
		
		return cnt;
	}

	
	@Override
	public List<Map<String, Object>> selectMemberQnaListPaging(@Param("member") Member member, @Param("pagingDTO") PagingDTO pagingDTO) {
		List<Map<String, Object>> memberQnaList = memberMapper.selectMemberQnaListPaging(member, pagingDTO);
		
		return memberQnaList;
	}
	
	@Override
	public long selectMemberQnaRowAmountTotal(@Param("member") Member member, @Param("pagingDTO") PagingDTO pagingDTO) {
		long cnt = memberMapper.selectMemberQnaRowAmountTotal(member, pagingDTO);
		return cnt;
	}

	@Override
	public List<Map<String, Object>> selectMemberBookingListPaging(Member member, PagingDTO pagingDTO) {
		List<Map<String, Object>> memberBookingList = memberMapper.selectMemberBookingListPaging(member, pagingDTO);
		return memberBookingList;
	}

	@Override
	public long selectMemberBookingRowAmountTotal(Member member, PagingDTO pagingDTO) {
		long cnt = memberMapper.selectMemberBookingRowAmountTotal(member, pagingDTO);
		return cnt;
	}

	@Override
	public List<Map<String, Object>> selectMemberPaymentDataListPaging(Member member, PagingDTO pagingDTO) {
		List<Map<String, Object>> memberPaymentDataList = memberMapper.selectMemberPaymentDataListPaging(member, pagingDTO);
		return memberPaymentDataList;
	}

	@Override
	public long selectMemberPaymentDataRowAmountTotal(Member member, PagingDTO pagingDTO) {
		long cnt = memberMapper.selectMemberPaymentDataRowAmountTotal(member, pagingDTO);
		return cnt;
	}

	@Override
	public Map<String, Object> selectMemberBookingAndPaymentData(Member member, PaymentData paymentData) {
		Map<String, Object> memberBookingAndPaymentData = memberMapper.selectMemberBookingAndPaymentData(member, paymentData);
		return memberBookingAndPaymentData;
	}

	@Override
	public List<Map<String, Object>> selectMemberReviewListPaging(Member member, PagingDTO pagingDTO) {
		List<Map<String, Object>> memberReviewList = memberMapper.selectMemberReviewListPaging(member, pagingDTO);
		return memberReviewList;
	}

	@Override
	public long selectMemberReviewRowAmountTotal(Member member, PagingDTO pagingDTO) {
		long cnt = memberMapper.selectMemberReviewRowAmountTotal(member, pagingDTO);
		return cnt;
	}

	



	


}
