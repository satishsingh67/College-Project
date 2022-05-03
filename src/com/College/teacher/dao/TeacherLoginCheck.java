package com.college.teacher.dao;

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
import com.college.model.Student;
import com.college.model.StudentDoubtModel;
import com.college.model.TeacherDetails;
import com.google.gson.Gson;

public class TeacherLoginCheck {
	public Map<String,Object> validateDetails(String teacherName,String departmentId,String emailId,String password) {
	
		Map<String,Object> teacherLoginValidation=new HashMap<String,Object>();

		
		Connection con = new DataBaseConnection().getDatabaseConnection();
		try {

			String query = "SELECT * FROM `teacher_registration` INNER JOIN department ON teacher_registration.fkDepartmentId=department.pkDepartmentId"
					+" INNER JOIN teacher_designation ON teacher_registration.fkTeacherDesignation=teacher_designation.pkTeacherDesignationId"
					+ " where teacherName=? and fkDepartmentId=? and emailId=? and password=? limit 1";
			PreparedStatement pstmt = con.prepareStatement(query);
			pstmt.setString(1, teacherName);
			pstmt.setInt(2, Integer.parseInt(departmentId));
			pstmt.setString(3, emailId.trim());
			pstmt.setString(4, password.trim());
	
			ResultSet rs = pstmt.executeQuery();

			teacherLoginValidation.put("status",false);	
			teacherLoginValidation.put("error","Invalid Details");
			
			while (rs.next()) { 
				 
				 if(!rs.getString("teacherName").trim().contentEquals(teacherName.trim())) {
					 teacherLoginValidation.put("error","Wrong Name");
	
				}
				else if(!rs.getString("emailId").trim().contentEquals(emailId.trim())) {
					teacherLoginValidation.put("error","Wrong Email Id");

				}
				else if(!rs.getString("password").trim().contentEquals(password.trim())) {
					teacherLoginValidation.put("error","Invalid Password");	
				}
				
				else {
					teacherLoginValidation.put("status",true);	
				TeacherDetails teacherDetails =new TeacherDetails();

              teacherDetails.setPkTeacherId(rs.getInt("pkTeacherId"));
              teacherDetails.setTecherName(rs.getString("teacherName"));
              teacherDetails.setDesignation(rs.getString("teacher_designation.designation"));
              teacherDetails.setFkdepartment(rs.getInt("fkDepartmentId"));	
              teacherDetails.setDepartmentName(rs.getString("department.longName"));
              teacherDetails.setDOB(String.valueOf(rs.getDate("DOB")));
              teacherDetails.setGender(rs.getString("gender"));
              Blob blob=rs.getBlob("photo");
              // Preparing Image to send user
				InputStream inputStream = blob.getBinaryStream();
				ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
				byte[] buffer = new byte[4096];
				int bytesRead = -1;

				while ((bytesRead = inputStream.read(buffer)) != -1) {
					outputStream.write(buffer, 0, bytesRead);
				}

				byte[] imageBytes = outputStream.toByteArray();
				String base64Image = Base64.getEncoder().encodeToString(imageBytes);

				inputStream.close();
				outputStream.close();
				teacherDetails.setBase64Image(base64Image);
				
				teacherLoginValidation.put("teacher",teacherDetails);

				}
			}
			con.close();

		} catch (Exception e) {
			e.printStackTrace();
		}

		return teacherLoginValidation;
	}
	
	public String fetchTeacherDetails(String teacherId) {
		String result = null;
		Connection con = new DataBaseConnection().getDatabaseConnection();
		try {

			String query = "SELECT teacher.pkTeacherId,teacher.teacherName,teacher.emailId,teacher.recoveryEmailId,teacher.mobileNumber,teacher.recoveryMobileNo,teacher.DOB,teacher.gender,teacher.joiningDate,desg.designation,dept.longName FROM `teacher_registration` as teacher INNER JOIN department as dept ON teacher.fkDepartmentId=dept.pkDepartmentId"
					+" INNER JOIN teacher_designation as desg ON teacher.fkTeacherDesignation=desg.pkTeacherDesignationId"
					+ " where teacher.pkTeacherId=? limit 1";
			PreparedStatement pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1, Integer.parseInt(teacherId));
			
			ResultSet rs = pstmt.executeQuery();
			List<TeacherDetails> teacherDetailsList = new ArrayList<TeacherDetails>();

			while (rs.next()) { 
				 
				TeacherDetails  teacherDetails =new TeacherDetails();

              teacherDetails.setPkTeacherId(rs.getInt(1));
              teacherDetails.setTecherName(rs.getString(2));
              teacherDetails.setEmailId(rs.getString(3));
              teacherDetails.setRecoveryEmailId(rs.getString(4));
              teacherDetails.setMobileNo(rs.getString(5));
              teacherDetails.setRecoveryMobileNumber(rs.getString(6));
              teacherDetails.setDOB(String.valueOf(rs.getDate(7)));
              teacherDetails.setGender(rs.getString(8));
              teacherDetails.setJoiningDate(String.valueOf(rs.getDate(9)));
              teacherDetails.setDesignation(rs.getString(10));
              teacherDetails.setDepartmentName(rs.getString(11));
              
              teacherDetailsList.add(teacherDetails);
              
              Gson json = new Gson();

  			result = json.toJson(teacherDetailsList);
          
			}
			con.close();

		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}
	
	public String fetchTeacherPhoto(Integer teacherId) {
		String result = null;
		Connection con = new DataBaseConnection().getDatabaseConnection();
		try {

			String query = "SELECT photo FROM `teacher_registration` where pkTeacherId=? limit 1";
			PreparedStatement pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1,teacherId);
			
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
