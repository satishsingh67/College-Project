package com.college.model;

import java.util.Date;

public class StudentDoubtModel {

	private Integer doubtId;
	private String question;
	private String answer;
	private Date createDate;
	private Date updateDate;
	public Integer getDoubtId() {
		return doubtId;
	}
	public void setDoubtId(Integer doubtId) {
		this.doubtId = doubtId;
	}
	public String getQuestion() {
		return question;
	}
	public void setQuestion(String question) {
		this.question = question;
	}
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	public Date getUpdateDate() {
		return updateDate;
	}
	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}
	
	
}
