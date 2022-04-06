package com.college.model;

public class MapTeacherSubject {
	private Integer pkTeacherSubjectMapId;
	private Integer fkTeacherPkId;
	private Integer fkDepartment;
	private String departmentShortName;
	private String departmentLongName;
	private Integer fkSemester;
	private Integer fkSubjectId;
	private String subjectCode;
	private String subjectName;
	private Integer totalSubject;
	private Integer totalLab;
	private Integer totalNotes;
	private Integer subjectType;
	private Integer section;
	private Integer  semester;
	private Integer year;
	public Integer getPkTeacherSubjectMapId() {
		return pkTeacherSubjectMapId;
	}
	public void setPkTeacherSubjectMapId(Integer pkTeacherSubjectMapId) {
		this.pkTeacherSubjectMapId = pkTeacherSubjectMapId;
	}
	public Integer getFkTeacherPkId() {
		return fkTeacherPkId;
	}
	public void setFkTeacherPkId(Integer fkTeacherPkId) {
		this.fkTeacherPkId = fkTeacherPkId;
	}
	public Integer getFkDepartment() {
		return fkDepartment;
	}
	public void setFkDepartment(Integer fkDepartment) {
		this.fkDepartment = fkDepartment;
	}
	public Integer getFkSemester() {
		return fkSemester;
	}
	public void setFkSemester(Integer fkSemester) {
		this.fkSemester = fkSemester;
	}
	public Integer getFkSubjectId() {
		return fkSubjectId;
	}
	public void setFkSubjectId(Integer fkSubjectId) {
		this.fkSubjectId = fkSubjectId;
	}
	public String getSubjectCode() {
		return subjectCode;
	}
	public void setSubjectCode(String subjectCode) {
		this.subjectCode = subjectCode;
	}
	public String getSubjectName() {
		return subjectName;
	}
	public void setSubjectName(String subjectName) {
		this.subjectName = subjectName;
	}
	public Integer getTotalSubject() {
		return totalSubject;
	}
	public void setTotalSubject(Integer totalSubject) {
		this.totalSubject = totalSubject;
	}
	public Integer getTotalLab() {
		return totalLab;
	}
	public void setTotalLab(Integer totalLab) {
		this.totalLab = totalLab;
	}
	public Integer getTotalNotes() {
		return totalNotes;
	}
	public void setTotalNotes(Integer totalNotes) {
		this.totalNotes = totalNotes;
	}
	public Integer getSubjectType() {
		return subjectType;
	}
	public void setSubjectType(Integer subjectType) {
		this.subjectType = subjectType;
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
	public Integer getYear() {
		return year;
	}
	public void setYear(Integer year) {
		this.year = year;
	}
	

}
