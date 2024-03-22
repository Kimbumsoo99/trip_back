package com.happy.member.model.service;

import java.sql.SQLException;

import org.apache.catalina.tribes.membership.MemberImpl;

import com.happy.member.model.dao.MemberDao;
import com.happy.member.model.dao.MemberDaoImpl;
import com.happy.member.model.dto.MemberDto;

public class MemberServiceImpl implements MemberService {
	private static MemberServiceImpl instance = new MemberServiceImpl();
	
	private MemberServiceImpl() {}
	
	public static MemberServiceImpl getInstance() {
		return instance;
	}
	
	// 1. 회원가입
	public boolean signUp(MemberDto dto) {
		
		try {
			MemberDaoImpl.getInstance().signUp(dto);
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return false;
	}
	// 2. 로그인
	public boolean signIn(String id, String pw) {
		try {
			MemberDaoImpl.getInstance().signIn(id, pw);
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}
	// 3. 로그아웃
	
	
	// 4. 회원 탈퇴
	public boolean deleteAccount(String id) {
		try {
			MemberDto dto = MemberDaoImpl.getInstance().getMember(id);
			MemberDaoImpl.getInstance().deleteAccount(dto);
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
		
	}

	@Override
	public MemberDto getMember(String id) {
		try {
			MemberDto dto = MemberDaoImpl.getInstance().getMember(id);
			return dto;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return null;
	}

	@Override
	public boolean modifyMember(MemberDto dto) {
		
		try {
			MemberDaoImpl.getInstance().modifyMember(dto);
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return false;
	}
	
	
	
}
