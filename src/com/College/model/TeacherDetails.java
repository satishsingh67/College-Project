package com.college.model;

public class TeacherDetails {
	private Integer pkTeacherId;
	private Integer fkdepartment;
	private String techerName;
	private String departmentName;
	private String designation;
	private String DOB;
	private String gender;
	private byte[] teacherImage;
	private Integer semester;
	private String base64Image;
	private String emailId;
	private String recoveryEmailId;
	private String mobileNo;
	private String recoveryMobileNumber;
	private String joiningDate;
	
	
	public Integer getPkTeacherId() {
		return pkTeacherId;
	}
	public void setPkTeacherId(Integer pkTeacherId) {
		this.pkTeacherId = pkTeacherId;
	}
	public Integer getFkdepartment() {
		return fkdepartment;
	}
	public void setFkdepartment(Integer fkdepartment) {
		this.fkdepartment = fkdepartment;
	}
	public String getTecherName() {
		return techerName;
	}
	public void setTecherName(String techerName) {
		this.techerName = techerName;
	}
	public String getDepartmentName() {
		return departmentName;
	}
	public void setDepartmentName(String departmentName) {
		this.departmentName = departmentName;
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
	public byte[] getTeacherImage() {
		return teacherImage;
	}
	public void setTeacherImage(byte[] teacherImage) {
		this.teacherImage = teacherImage;
	}
	public Integer getSemester() {
		return semester;
	}
	public void setSemester(Integer semester) {
		this.semester = semester;
	}
	public String getBase64Image() {
		return base64Image;
	}
	public void setBase64Image(String base64Image) {
		this.base64Image = base64Image;
	}
	public String getDesignation() {
		return designation;
	}
	public void setDesignation(String designation) {
		this.designation = designation;
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
	public String getJoiningDate() {
		return joiningDate;
	}
	public void setJoiningDate(String joiningDate) {
		this.joiningDate = joiningDate;
	}
	
	
}
