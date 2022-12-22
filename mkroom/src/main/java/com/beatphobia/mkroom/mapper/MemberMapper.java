package com.beatphobia.mkroom.mapper;

import java.util.List;

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




}
