package com.happy.member.model.service;

import com.happy.member.model.dto.MemberDto;

public interface MemberService {
	public boolean signUp(MemberDto dto);
	public boolean signIn(String id, String pw);
	public boolean deleteAccount(String id);
	public MemberDto getMember(String id);
	public boolean modifyMember(MemberDto dto);
}
