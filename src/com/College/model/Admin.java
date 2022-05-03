package com.college.model;

public class Admin {
	private Integer pkadminId;
	private String name;
	private String DOB;
	private String gender;
	private String emailId;
	private String recoveryEmailId;
	private String mobileNo;
	private String recoveryMobileNumber;
	public Integer getPkadminId() {
		return pkadminId;
	}
	public void setPkadminId(Integer pkadminId) {
		this.pkadminId = pkadminId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDOB() {
		return DOB;
	}
	public void setDOB(String dOB) {
		DOB = dOB;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getEmailId() {
		return emailId;
	}
	public void setEmailId(String emailId) {
		this.emailId = emailId;
	}
	public String getRecoveryEmailId() {
		return recoveryEmailId;
	}
	public void setRecoveryEmailId(String recoveryEmailId) {
		this.recoveryEmailId = recoveryEmailId;
	}
	public String getMobileNo() {
		return mobileNo;
	}
	public void setMobileNo(String mobileNo) {
		this.mobileNo = mobileNo;
	}
	public String getRecoveryMobileNumber() {
		return recoveryMobileNumber;
	}
	public void setRecoveryMobileNumber(String recoveryMobileNumber) {
		this.recoveryMobileNumber = recoveryMobileNumber;
	}
	
	
}
