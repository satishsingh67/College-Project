package com.college.model;

public class MapStudentSubject {
private Integer pkstudentSubjectMapId;
private Integer fkStudentPkId;
private Integer fkDepartment;
private Integer fkSemester;
private Integer fkSubjectId;
private String subjectCode;
private String subjectName;
private Integer totalSubject;
private Integer totalLab;
private Integer totalNotes;
private Integer subjectType;
public Integer getPkstudentSubjectMapId() {
	return pkstudentSubjectMapId;
}
public void setPkstudentSubjectMapId(Integer pkstudentSubjectMapId) {
	this.pkstudentSubjectMapId = pkstudentSubjectMapId;
}
public Integer getFkStudentPkId() {
	return fkStudentPkId;
}
public void setFkStudentPkId(Integer fkStudentPkId) {
	this.fkStudentPkId = fkStudentPkId;
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
	
}
