package com.college.model;

import java.util.Date;

public class StudentAssignment {
private Integer pkStudentAssignmentStatusId;
private String assignmentName;
private String status;
private Date createDate;
private Date dueDate;
private Integer dueDatePassed;
private Integer pkAssignmentId;
public Integer getPkStudentAssignmentStatusId() {
	return pkStudentAssignmentStatusId;
}
public void setPkStudentAssignmentStatusId(Integer pkStudentAssignmentStatusId) {
	this.pkStudentAssignmentStatusId = pkStudentAssignmentStatusId;
}
public String getAssignmentName() {
	return assignmentName;
}
public void setAssignmentName(String assignmentName) {
	this.assignmentName = assignmentName;
}
public String getStatus() {
	return status;
}
public void setStatus(String status) {
	this.status = status;
}
public Date getCreateDate() {
	return createDate;
}
public void setCreateDate(Date createDate) {
	this.createDate = createDate;
}
public Date getDueDate() {
	return dueDate;
}
public void setDueDate(Date dueDate) {
	this.dueDate = dueDate;
}
public Integer getDueDatePassed() {
	return dueDatePassed;
}
public void setDueDatePassed(Integer dueDatePassed) {
	this.dueDatePassed = dueDatePassed;
}
public Integer getPkAssignmentId() {
	return pkAssignmentId;
}
public void setPkAssignmentId(Integer pkAssignmentId) {
	this.pkAssignmentId = pkAssignmentId;
}

}
 