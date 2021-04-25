package com.web.model;

import java.sql.Date;

public class Tuser {

	private String userId;
	private String userPwd;
	private String userName;
	private String email;
	private String useYn;
	private Date insertDate;
	private Date modifyDate;

	@Override
	public String toString() {
		return "Tuser [userId=" + userId + ", userPwd=" + userPwd + ", userName=" + userName + ", email=" + email + ", useYn=" + useYn + ", insertDate=" + insertDate + ", modifyDate=" + modifyDate + "]";
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userid) {
		this.userId = userid;
	}

	public String getUserPwd() {
		return userPwd;
	}

	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getUseYn() {
		return useYn;
	}

	public void setUseYn(String useYn) {
		this.useYn = useYn;
	}

	public Date getInsertDate() {
		return insertDate;
	}

	public void setInsertDate(Date insertDate) {
		this.insertDate = insertDate;
	}

	public Date getModifyDate() {
		return modifyDate;
	}

	public void setModifyDate(Date modifyDate) {
		this.modifyDate = modifyDate;
	}

}
