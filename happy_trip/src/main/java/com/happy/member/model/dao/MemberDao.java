package com.happy.member.model.dao;

import java.sql.SQLException;

import com.happy.member.model.dto.MemberDto;

public interface MemberDao {
	public boolean signUp(MemberDto dto) throws SQLException;
	public MemberDto signIn(String id, String pw) throws SQLException;
	public void deleteAccount(MemberDto dto) throws SQLException;
	public MemberDto getMember(String id) throws SQLException;

}
