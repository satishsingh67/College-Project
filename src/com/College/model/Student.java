package com.college.model;

public class Student {
     
	private Integer pkRegistrationId;
	private Integer fkdepartment;
	private Integer fkCurrentYearAndSem;
	private String idNumber;
	private String studentName;
	private String department;
	private String DOB;
	private String gender;
	private byte[] studentImage;
	private Integer year;
	private Integer semester;
	private String base64Image;
	private Integer section;
	
	public Integer getPkRegistrationId() {
		return pkRegistrationId;
	}
	public void setPkRegistrationId(Integer pkRegistrationId) {
		this.pkRegistrationId = pkRegistrationId;
	}
	public Integer getFkdepartment() {
		return fkdepartment;
	}
	public void setFkdepartment(Integer fkdepartment) {
		this.fkdepartment = fkdepartment;
	}
	public Integer getFkCurrentYearAndSem() {
		return fkCurrentYearAndSem;
	}
	public void setFkCurrentYearAndSem(Integer fkCurrentYearAndSem) {
		this.fkCurrentYearAndSem = fkCurrentYearAndSem;
	}
	public String getIdNumber() {
		return idNumber;
	}
	public void setIdNumber(String idNumber) {
		this.idNumber = idNumber;
	}
	public String getStudentName() {
		return studentName;
	}
	public void setStudentName(String studentName) {
		this.studentName = studentName;
	}
	public String getDepartment() {
		return department;
	}
	public void setDepartment(String department) {
		this.department = department;
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
	public byte[] getStudentImage() {
		return studentImage;
	}
	public void setStudentImage(byte[] studentImage) {
		this.studentImage = studentImage;
	}
	public String getBase64Image() {
		return base64Image;
	}
	public void setBase64Image(String base64Image) {
		this.base64Image = base64Image;
	}
	public Integer getYear() {
		return year;
	}
	public void setYear(Integer year) {
		this.year = year;
	}
	public Integer getSection() {
		return section;
	}
	public void setSection(Integer section) {
		this.section = section;
	}
	public Integer getSemester() {
		return semester;
	}
	public void setSemester(Integer semester) {
		this.semester = semester;
	}

	
}
