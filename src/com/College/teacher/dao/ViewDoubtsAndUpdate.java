package com.college.teacher.dao;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.college.dataBaseConnection.DataBaseConnection;
import com.college.model.StudentDoubtModel;
import com.google.gson.Gson;

public class ViewDoubtsAndUpdate {

	public String viewDoubt(String action, String teacherId, String fkDepartmentId, String fkSemesterId,
			String fkSectionId, String fkSubjectId,	String courseTypeId ) {
		Connection con = new DataBaseConnection().getDatabaseConnection();
		String result = null;
		try {
			String query = null;
			PreparedStatement pstmt = null;
			if (action != null && action.trim().equalsIgnoreCase("mentorDoubt")) {
				query = "SELECT doubt.pkviewDoubtsMentorId,doubt.question,doubt.answer,doubt.createDate,doubt.updateDate,stud.studentName,stud.universityRollNo FROM view_doubts_mentor AS doubt"
						+ " INNER JOIN registration AS stud ON doubt.fkStudentId=stud.pkRegistrationId "
						+ "WHERE  doubt.fkDepartmentId=? AND doubt.fkSemesterId=? AND doubt.fkSectionId=? AND doubt.fkCourseTypeId=?";

				pstmt = con.prepareStatement(query);
				pstmt.setInt(1, Integer.parseInt(fkDepartmentId));
				pstmt.setInt(2, Integer.parseInt(fkSemesterId));
				pstmt.setInt(3, Integer.parseInt(fkSectionId));
				pstmt.setInt(4, Integer.parseInt(courseTypeId));

			} else {
				query = "SELECT doubt.pkviewDoubtsId,doubt.question,doubt.answer,doubt.createDate,doubt.updateDate,stud.studentName,stud.universityRollNo FROM view_doubts AS doubt"
						+ " INNER JOIN registration AS stud ON doubt.fkStudentId=stud.pkRegistrationId "
						+ "WHERE doubt.fkCourseTypeId=? AND doubt.fkDepartmentId=? AND doubt.fkSemesterId=? AND doubt.fkSectionId=? AND doubt.fkSubjectId=?";
				pstmt = con.prepareStatement(query);
				pstmt.setInt(1, Integer.parseInt(courseTypeId));
				pstmt.setInt(2, Integer.parseInt(fkDepartmentId));
				pstmt.setInt(3, Integer.parseInt(fkSemesterId));
				pstmt.setInt(4, Integer.parseInt(fkSectionId));
				pstmt.setInt(5, Integer.parseInt(fkSubjectId));
			}

			ResultSet rs = pstmt.executeQuery();

			List<StudentDoubtModel> studentDoubtList = new ArrayList<StudentDoubtModel>();
		int count=0;
			while (rs.next()) {
				count++;
				StudentDoubtModel studentDoubtModelObj = new StudentDoubtModel();

				studentDoubtModelObj.setSlNo(count);
				studentDoubtModelObj.setDoubtId(rs.getInt(1));
				studentDoubtModelObj.setQuestion(rs.getString(2));
				studentDoubtModelObj.setAnswer(rs.getString(3));
				studentDoubtModelObj.setCreateDate(rs.getTimestamp(4));
				studentDoubtModelObj.setUpdateDate(rs.getTimestamp(5));
				studentDoubtModelObj.setStudentName(rs.getString(6));
				studentDoubtModelObj.setRollNo(rs.getString(7));

				studentDoubtList.add(studentDoubtModelObj);

			}

			Gson json = new Gson();

			result = json.toJson(studentDoubtList);

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (con != null) {
					con.close();
				}

			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		return result;
	}

	public String updateQuestion(String id,String message,String action){
			Connection con = new DataBaseConnection().getDatabaseConnection();
			String result = null;
			try {
				String query = null;
				
				
				if(action.trim().equalsIgnoreCase("updateDoubtStudent")) {
					query="Update view_doubts set answer=?,updateDate=? where pkviewDoubtsId=?";
					
				}else {
					query="Update view_doubts_mentor set answer=?,updateDate=? where pkviewDoubtsMentorId=?";	
				}
				
				PreparedStatement pstmt = con.prepareStatement(query);
				
				pstmt.setString(1,message);
				pstmt.setObject(2,new Date());
				pstmt.setInt(3,Integer.parseInt(id));

				int dbStatus=pstmt.executeUpdate();
				
				if(dbStatus>0) {
					result="Answer Submitted Successfully";
				}else {
					result="Something went wrong.Please try again.";
				}
				
			}catch(Exception e){
				e.printStackTrace();
				result="Something went wrong.Please try again.";
			}finally {
				try {
					if (con != null) {
						con.close();
					}

				} catch (Exception e) {
					e.printStackTrace();
					result="Something went wrong.Please try again.";
				}
			}
			return result;
	}
	
	public static void main(String[] args) {
		//System.out.println(new 	ViewDoubtsAndUpdate().viewDoubt("mentorDoubt", "", "1", "1", "1", ""));
	}
	
}
