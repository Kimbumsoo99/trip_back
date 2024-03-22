package com.happy.member.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.happy.member.model.dto.MemberDto;
import com.happy.util.DBUtil;

public class MemberDaoImpl implements MemberDao {
	private static MemberDao instance = new MemberDaoImpl();
	private MemberDaoImpl() {}
	public static MemberDao getInstance() { return instance; }
	
	
	@Override
	public boolean signUp(MemberDto dto) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = DBUtil.getInstance().getConnection();
			pstmt = conn.prepareStatement("insert into member (userName, userId, userPw, emailId, emailDomain, sido, gugun) values(?, ?, ?, ?, ?, ?, ?);");
			
			pstmt.setString(1, dto.getUserName());
			pstmt.setString(2, dto.getUserId());
			pstmt.setString(3, dto.getUserPw());
			pstmt.setString(4, dto.getEmailId());
			pstmt.setString(5, dto.getEmailDomain());
			pstmt.setString(6, dto.getSido());
			pstmt.setString(7, dto.getGugun());
			
			if (pstmt.executeUpdate() == 1)
				return true;
		
		} catch (SQLException e) {
			e.printStackTrace();
			throw e;
		}	finally {
			DBUtil.getInstance().close(pstmt, conn);
		}
		return false;
	}

	@Override
	public MemberDto signIn(String id, String pw) throws SQLException {
		MemberDto dto = new MemberDto();
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = DBUtil.getInstance().getConnection();
			pstmt = conn.prepareStatement("select * from member where userId = ? and userPw = ?;");
			
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			
			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
				dto.setUserName(rs.getString(1));
				dto.setUserId(rs.getString(2));
				dto.setUserPw(rs.getString(3));
				dto.setEmailId(rs.getString(4));
				dto.setEmailDomain(rs.getString(5));
				dto.setSido(rs.getString(6));
				dto.setGugun(rs.getString(7));
				return dto;
			}		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			throw e;
		}	finally {
			DBUtil.getInstance().close(pstmt, conn);
		}
		
		return null;
	}

	@Override
	public void deleteAccount(MemberDto dto) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = DBUtil.getInstance().getConnection();
			pstmt = conn.prepareStatement("delete from member where userId = ?");
			pstmt.setString(1, dto.getUserId());
			
			pstmt.executeUpdate();		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			throw e;
		}	
	}
	
	@Override
	public MemberDto getMember(String id) throws SQLException {
		MemberDto dto = new MemberDto();
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = DBUtil.getInstance().getConnection();
			pstmt = conn.prepareStatement("select * from member where userId = ?");
			
			pstmt.setString(1, id);
			
			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
				dto.setUserName(rs.getString(1));
				dto.setUserId(rs.getString(2));
				dto.setUserPw(rs.getString(3));
				dto.setEmailId(rs.getString(4));
				dto.setEmailDomain(rs.getString(5));
				dto.setSido(rs.getString(6));
				dto.setGugun(rs.getString(7));
				return dto;
			}		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			throw e;
		}	finally {
			DBUtil.getInstance().close(pstmt, conn);
		}
		
		return null;
	}
	
	@Override
	public boolean modifyMember(MemberDto dto) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		System.out.println("수정 dto : " + dto);
		try {
			conn = DBUtil.getInstance().getConnection();
			pstmt = conn.prepareStatement("UPDATE member set userName = ?, emailId = ?, emailDomain = ? WHERE userId = ?;");
			pstmt.setString(1, dto.getUserName());
			pstmt.setString(2, dto.getEmailId());
			pstmt.setString(3, dto.getEmailDomain());
			pstmt.setString(4, dto.getUserId());
			
			if(pstmt.executeUpdate() == 1) return true;
			
			pstmt.executeUpdate();		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			throw e;
		}
		
		return false;
	}
	
	

}
