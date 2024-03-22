package com.happy.member.model.dto;

public class MemberDto {
	private String userName;
	private String userId;
	private String userPw;
	private String emailId;
	private String emailDomain;
	private String sido;
	private String gugun;
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserPw() {
		return userPw;
	}
	public void setUserPw(String userPw) {
		this.userPw = userPw;
	}
	public String getEmailId() {
		return emailId;
	}
	public void setEmailId(String emailId) {
		this.emailId = emailId;
	}
	public String getEmailDomain() {
		return emailDomain;
	}
	public void setEmailDomain(String emailDomain) {
		this.emailDomain = emailDomain;
	}
	public String getSido() {
		return sido;
	}
	public void setSido(String sido) {
		this.sido = sido;
	}
	public String getGugun() {
		return gugun;
	}
	public void setGugun(String gugun) {
		this.gugun = gugun;
	}
	@Override
	public String toString() {
		return "MemberDto [userName=" + userName + ", userId=" + userId + ", userPw=" + userPw + ", emailId=" + emailId
				+ ", emailDomain=" + emailDomain + ", sido=" + sido + ", gugun=" + gugun + "]";
	}
	
	
}
