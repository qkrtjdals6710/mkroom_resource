package com.beatphobia.mkroom.service.member;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
			System.out.println(">>>1  " + auth);
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

	





	


}
