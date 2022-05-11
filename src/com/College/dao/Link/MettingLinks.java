package com.college.dao.Link;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.college.dataBaseConnection.DataBaseConnection;

public class MettingLinks {

	public String getDailyClassLink(String fkDepartmentId, String fkSemesterId, String fkSectionId, String fkSubjectId ,Integer courseTypeId) {
		String result=null;
		Connection con=new DataBaseConnection().getDatabaseConnection();
		try {
			String query="Select `meetingLink` from `daily_class_link` where `fkDepartmentId`=? and `fkSemesterId`=? and `fkSectionId`=? and `fkSubjectId`=? and `fkCourseTypeId`=? ORDER BY `updatedate` DESC LIMIT 1";
			
			PreparedStatement pstmt=con.prepareStatement(query);
			pstmt.setInt(1, Integer.parseInt(fkDepartmentId));
			pstmt.setInt(2, Integer.parseInt(fkSemesterId));
			pstmt.setInt(3, Integer.parseInt(fkSectionId));
			pstmt.setInt(4, Integer.parseInt(fkSubjectId));
			pstmt.setInt(5, courseTypeId);

			
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				result=rs.getString("meetingLink");	
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(con!=null) {
					con.close();
				}
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		return result;
	}
	
	public String getExamMeetingLink(Integer fkExamType,String fkDepartmentId, String fkSemesterId, String fkSectionId, String fkSubjectId ,Integer courseTypeId) {
		String result=null;
		Connection con=new DataBaseConnection().getDatabaseConnection();
		try {
			String query="Select `examMeetingLink` from `exam_link` where `fkExamType`=? and `fkDepartmentId`=? and `fkSemesterId`=? and `fkSectionId`=? and `fkSubjectId`=? and `fkCourseTypeId`=? ORDER BY `updatedate` DESC LIMIT 1";
			
			PreparedStatement pstmt=con.prepareStatement(query);
			pstmt.setInt(1,fkExamType);
			pstmt.setInt(2, Integer.parseInt(fkDepartmentId));
			pstmt.setInt(2, Integer.parseInt(fkDepartmentId));
			pstmt.setInt(3, Integer.parseInt(fkSemesterId));
			pstmt.setInt(4, Integer.parseInt(fkSectionId));
			pstmt.setInt(5, Integer.parseInt(fkSubjectId));
			pstmt.setInt(6, courseTypeId);

			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				result=rs.getString("examMeetingLink");
	
			}
			
		}catch(Exception e) {
			
			e.printStackTrace();
			
		}finally {
			try {
				if(con!=null) {
					con.close();
				}
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		return result;
	}
	
	
}
