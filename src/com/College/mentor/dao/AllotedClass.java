package com.college.mentor.dao;

import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Base64;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.college.dataBaseConnection.DataBaseConnection;
import com.college.model.Mentor;

public class AllotedClass {

	public List<Mentor> getAllotedClass(Integer mentorId) {
		List<Mentor> mentorAllotedClass=new ArrayList<Mentor>();

			
			Connection con = new DataBaseConnection().getDatabaseConnection();
			try {

				String query = "SELECT asMentor.fkCourseTypeId,asMentor.fkSectionId,asMentor.fkDepartmentId,year.Year,csType.shortName,csType.longName,dept.shortName,dept.longName,year.Semester FROM `assigned_mentor` as asMentor"
						+ " inner join course_type as csType on asMentor.fkCourseTypeId=csType.pkCourseTypeId"
						+ " inner join department as dept on asMentor.fkDepartmentId=dept.pkDepartmentId"
						+ " inner join year_semester as year on asMentor.fkCourseYearId=year.pkYearSemesterId"
						+ " where asMentor.fkMentorId=?";
				
		
				
				PreparedStatement pstmt = con.prepareStatement(query);
				pstmt.setInt(1, mentorId);
				
				ResultSet rs = pstmt.executeQuery();
				while (rs.next()) { 
					Mentor mentor=new Mentor();
					mentor.setFkCourseTypeId(rs.getInt(1));
					mentor.setFkSectionId(rs.getInt(2));
					mentor.setFkDepartmentId(rs.getInt(3));
					mentor.setYear(String.valueOf(rs.getInt(4)));
					mentor.setCourseShortName(rs.getString(5));
					mentor.setCourseLongName(rs.getString(6));
					mentor.setDepartmentShortName(rs.getString(7));
					mentor.setDepartmentLongName(rs.getString(8));
					mentor.setSemester(rs.getInt(9));
					mentorAllotedClass.add(mentor);
				}
				con.close();

			} catch (Exception e) {
				e.printStackTrace();
			}

			return mentorAllotedClass;
		}
	
	public String fetchMentorPhoto(Integer mentorId) {
		String result = null;
		Connection con = new DataBaseConnection().getDatabaseConnection();
		try {

			String query = "SELECT photo FROM `mentor_registration` where pkMentorResgistrationId=? limit 1";
			PreparedStatement pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1,mentorId);
			
			ResultSet rs = pstmt.executeQuery();
			
			if(rs.next()) {
			Blob blob=rs.getBlob(1);
			
			if(blob!=null) {
			InputStream inputStream = blob.getBinaryStream();
			ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
			byte[] buffer = new byte[4096];
			int bytesRead = -1;

			while ((bytesRead = inputStream.read(buffer)) != -1) {
				outputStream.write(buffer, 0, bytesRead);
			}

			byte[] imageBytes = outputStream.toByteArray();
			result  = Base64.getEncoder().encodeToString(imageBytes);

			inputStream.close();
			outputStream.close();
			
			
			}else {
				result=null;
          
			}
			}else {
				result=null;
          
			}
			con.close();

		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}
	
	
}
