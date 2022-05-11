package com.college.teacher.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Date;

import com.college.dataBaseConnection.DataBaseConnection;

public class LinkManagement {

	public String uploadDailyClassLink(String teacherId, String departmentId, String semseter, String section,
			String subjectId, String meetLink,String courseTypeId) {
		String result = null;
		Connection con = new DataBaseConnection().getDatabaseConnection();
		try {
			String query = "INSERT INTO `daily_class_link` (`fkTeacherId`, `fkDepartmentId`, `fkSemesterId`, `fkSectionId`, `fkSubjectId`, `meetingLink`, `createDate`, `updatedate`,`fkCourseTypeId`)"
					+ " VALUES (?,?,?,?,?,?,?,?,?)";
			PreparedStatement pstmt = con.prepareStatement(query);
			pstmt.setInt(1, Integer.parseInt(teacherId));
			pstmt.setInt(2, Integer.parseInt(departmentId));
			pstmt.setInt(3, Integer.parseInt(semseter));
			pstmt.setInt(4, Integer.parseInt(section));
			pstmt.setInt(5, Integer.parseInt(subjectId));
			pstmt.setString(6, meetLink);
			pstmt.setObject(7, new Date());
			pstmt.setObject(8, new Date());
			pstmt.setInt(9, Integer.parseInt(courseTypeId));
			
			int dbStatus = pstmt.executeUpdate();

			if (dbStatus > 0) {

				result = "Class Link Uploaded Successfully";
			} else {

				result = "Something went wrong.Please Try again.";
			}
		} catch (Exception e) {
			result = "Something went wrong.Please Try again.";
			e.printStackTrace();
		}

		return result;
	}

	public String uploadApplicationLink(String teacherId, String departmentId, String semseter, String section,
			String subjectId, String meetLink,String courseTypeId) {
		String result = null;
		Connection con = new DataBaseConnection().getDatabaseConnection();
		try {
			String query = "INSERT INTO `lab_application_link` (`fkTeacherId`, `fkDepartmentId`, `fkSemesterId`, `fkSectionId`, `fkSubjectId`, `link`, `createDate`, `updatedate`,`fkCourseTypeId`)"
					+ " VALUES (?,?,?,?,?,?,?,?,?)";
			PreparedStatement pstmt = con.prepareStatement(query);
			pstmt.setInt(1, Integer.parseInt(teacherId));
			pstmt.setInt(2, Integer.parseInt(departmentId));
			pstmt.setInt(3, Integer.parseInt(semseter));
			pstmt.setInt(4, Integer.parseInt(section));
			pstmt.setInt(5, Integer.parseInt(subjectId));
			pstmt.setString(6, meetLink);
			pstmt.setObject(7, new Date());
			pstmt.setObject(8, new Date());
			pstmt.setInt(9, Integer.parseInt(courseTypeId));

			int dbStatus = pstmt.executeUpdate();

			if (dbStatus > 0) {

				result = "Application Link Uploaded Successfully";
			} else {

				result = "Something went wrong.Please Try again.";
			}
		} catch (Exception e) {
			result = "Something went wrong.Please Try again.";
			e.printStackTrace();
		}

		return result;
	}
	
	public String getDailyClassLink(String teacherId,String fkDepartmentId, String fkSemesterId, String fkSectionId,
			String fkSubjectId,String courseId) {
		String result = null;
		Connection con = new DataBaseConnection().getDatabaseConnection();
		try {
			String query = "Select `meetingLink` from `daily_class_link` where `fkDepartmentId`=? and `fkSemesterId`=? and `fkSectionId`=? and `fkSubjectId`=? and fkTeacherId=? and fkCourseTypeId=? ORDER BY `updatedate` DESC LIMIT 1";

			PreparedStatement pstmt = con.prepareStatement(query);
			pstmt.setInt(1, Integer.parseInt(fkDepartmentId));
			pstmt.setInt(2, Integer.parseInt(fkSemesterId));
			pstmt.setInt(3, Integer.parseInt(fkSectionId));
			pstmt.setInt(4, Integer.parseInt(fkSubjectId));
			pstmt.setInt(5, Integer.parseInt(teacherId));
			pstmt.setInt(6, Integer.parseInt(courseId));
			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
				result = rs.getString("meetingLink");
			}
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
	
	public String getExamMeetingLink(Integer fkExamType,String fkDepartmentId, String fkSemesterId, String fkSectionId, String fkSubjectId,String teacherId,String courseTypeId ) {
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
			pstmt.setInt(6, Integer.parseInt(courseTypeId));

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
	
	public String uploadExamMeetingLink(String fkExamType,String fkTeacherId,String fkDepartmentId, String fkSemesterId, String fkSectionId, String fkSubjectId,String examLink,String courseTypeId ) {
		String result=null;
		Connection con=new DataBaseConnection().getDatabaseConnection();
		try {
			String query="Insert INTO `exam_link` (`fkExamType`,`fkTeacherId`, `fkDepartmentId`, `fkSemesterId`, `fkSectionId`, `fkSubjectId`, `examMeetingLink`, `createDate`, `updatedate`,`fkCourseTypeId`)"
					+ " VALUES (?,?,?,?,?,?,?,?,?,?)";
			
			PreparedStatement pstmt=con.prepareStatement(query);
			pstmt.setInt(1,Integer.parseInt(fkExamType));
			pstmt.setInt(2, Integer.parseInt(fkTeacherId));
			pstmt.setInt(3, Integer.parseInt(fkDepartmentId));
			pstmt.setInt(4, Integer.parseInt(fkSemesterId));
			pstmt.setInt(5, Integer.parseInt(fkSectionId));
			pstmt.setInt(6, Integer.parseInt(fkSubjectId));
			pstmt.setString(7,examLink);
			pstmt.setObject(8,new Date());
            pstmt.setObject(9,new Date());
			pstmt.setInt(10, Integer.parseInt(courseTypeId));

			int dbStatus=pstmt.executeUpdate();
			
			if(dbStatus>0){
			result="Exam Link is Uploaded Successfully";
			}
			else{
			result="Unable to upload Exam Link";

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
	
	
	
	public String getApplicationLink(String teacherId,String fkDepartmentId, String fkSemesterId, String fkSectionId,
			String fkSubjectId,String courseTypeId) {
	String result=null;
	Connection con=new DataBaseConnection().getDatabaseConnection();
		try {
        String query="Select `link` from lab_application_link where fkDepartmentId=? and fkSemesterId=? and fkSectionId=? and fkSubjectId=? and fkTeacherId=? and fkCourseTypeId=? order by `updatedate` DESC LIMIT 1";				
			
		    PreparedStatement pstmt = con.prepareStatement(query);
			pstmt.setInt(1, Integer.parseInt(fkDepartmentId));
			pstmt.setInt(2, Integer.parseInt(fkSemesterId));
			pstmt.setInt(3, Integer.parseInt(fkSectionId));
			pstmt.setInt(4, Integer.parseInt(fkSubjectId));
			pstmt.setInt(5, Integer.parseInt(teacherId));
			pstmt.setInt(6, Integer.parseInt(courseTypeId));

			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				result=rs.getString(1);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	public String uploadSemExamMeetingLink(String fkExamType,String fkDepartmentId, String fkSemesterId, String fkSectionId, String examLink ,String courseTypeId) {
		String result=null;
		Connection con=new DataBaseConnection().getDatabaseConnection();
		try {
			String query="Insert INTO `exam_link` (`fkExamType`,`fkTeacherId`, `fkDepartmentId`, `fkSemesterId`, `fkSectionId`, `fkSubjectId`, `examMeetingLink`, `createDate`, `updatedate`,`fkCourseTypeId`)"
					+ " VALUES (?,?,?,?,?,?,?,?,?,?)";
			
			PreparedStatement pstmt=con.prepareStatement(query);
			pstmt.setInt(1,Integer.parseInt(fkExamType));
			pstmt.setObject(2,null);
			pstmt.setInt(3, Integer.parseInt(fkDepartmentId));
			pstmt.setInt(4, Integer.parseInt(fkSemesterId));
			pstmt.setInt(5, Integer.parseInt(fkSectionId));
			pstmt.setObject(6, null);
			pstmt.setString(7,examLink);
			pstmt.setObject(8,new Date());
            pstmt.setObject(9,new Date());
			pstmt.setInt(10, Integer.parseInt(courseTypeId));

			int dbStatus=pstmt.executeUpdate();
			
			if(dbStatus>0){
			result="Exam Link is Updated Successfully";
			}
			else{
			result="Unable to upload Exam Link";

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
	
	public String getSemExamMeetingLink(Integer fkExamType,String fkDepartmentId, String fkSemesterId, String fkSectionId,String courseTypeId) {
		String result=null;
		Connection con=new DataBaseConnection().getDatabaseConnection();
		try {
			String query="Select `examMeetingLink` from `exam_link` where `fkExamType`=? and `fkDepartmentId`=? and `fkSemesterId`=? and `fkSectionId`=? and `fkCourseTypeId`=? ORDER BY `updatedate` DESC LIMIT 1";
			
			PreparedStatement pstmt=con.prepareStatement(query);
			pstmt.setInt(1,fkExamType);
			pstmt.setInt(2, Integer.parseInt(fkDepartmentId));
			pstmt.setInt(3, Integer.parseInt(fkSemesterId));
			pstmt.setInt(4, Integer.parseInt(fkSectionId));
			pstmt.setInt(5, Integer.parseInt(courseTypeId));

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
