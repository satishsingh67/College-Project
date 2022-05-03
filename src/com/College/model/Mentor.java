package com.college.model;

public class Mentor {
	private Integer pkMentorId;
	private String name;
	private String DOB;
	private String gender;
	private String emailId;
	private String recoveryEmailId;
	private String mobileNo;
	private String recoveryMobileNumber;
	private Integer fkDepartmentId;
	private Integer fkSectionId;
	private Integer fkCourseTypeId;
	private String year;
	private int semester;
    private String courseShortName;
    private String courseLongName;
    private String departmentShortName;
    private String departmentLongName;
	
	
	public Integer getPkMentorId() {
		return pkMentorId;
	}
	public void setPkMentorId(Integer pkMentorId) {
		this.pkMentorId = pkMentorId;
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
	public Integer getFkDepartmentId() {
		return fkDepartmentId;
	}
	public void setFkDepartmentId(Integer fkDepartmentId) {
		this.fkDepartmentId = fkDepartmentId;
	}
	public Integer getFkSectionId() {
		return fkSectionId;
	}
	public void setFkSectionId(Integer fkSectionId) {
		this.fkSectionId = fkSectionId;
	}
	public Integer getFkCourseTypeId() {
		return fkCourseTypeId;
	}
	public void setFkCourseTypeId(Integer fkCourseTypeId) {
		this.fkCourseTypeId = fkCourseTypeId;
	}
	public String getYear() {
		return year;
	}
	public void setYear(String year) {
		this.year = year;
	}
	public String getCourseShortName() {
		return courseShortName;
	}
	public void setCourseShortName(String courseShortName) {
		this.courseShortName = courseShortName;
	}
	public String getCourseLongName() {
		return courseLongName;
	}
	public void setCourseLongName(String courseLongName) {
		this.courseLongName = courseLongName;
	}
	public String getDepartmentShortName() {
		return departmentShortName;
	}
	public void setDepartmentShortName(String departmentShortName) {
		this.departmentShortName = departmentShortName;
	}
	public String getDepartmentLongName() {
		return departmentLongName;
	}
	public void setDepartmentLongName(String departmentLongName) {
		this.departmentLongName = departmentLongName;
	}
	public int getSemester() {
		return semester;
	}
	public void setSemester(int semester) {
		this.semester = semester;
	}
	
	
	
}
