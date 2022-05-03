package com.college.mentor.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.college.dataBaseConnection.DataBaseConnection;
import com.college.model.Admin;
import com.college.model.Mentor;
import com.college.model.TeacherDetails;
import com.google.gson.Gson;

public class MentorLoginValidation {
	public Map<String, Object> validateDetails(String name, String emailId, String password) {
		Map<String,Object> mentorLoginValidation=new HashMap<String,Object>();

			
			Connection con = new DataBaseConnection().getDatabaseConnection();
			try {

				String query = "SELECT pkMentorResgistrationId,name,emailId,password FROM `mentor_registration` where name=? and emailId=? and password=? and isDeleted=? limit 1";
				PreparedStatement pstmt = con.prepareStatement(query);
				pstmt.setString(1, name.trim());
				pstmt.setString(2,emailId.trim());
				pstmt.setString(3, password.trim());
				pstmt.setInt(4, 0);
				ResultSet rs = pstmt.executeQuery();

				mentorLoginValidation.put("status",false);	
				mentorLoginValidation.put("error","No Account Found");
				
				while (rs.next()) { 
					 
					 if(!rs.getString("name").trim().contentEquals(name.trim())) {
						 mentorLoginValidation.put("error","Wrong Name");
		
					}
					else if(!rs.getString("emailId").trim().contentEquals(emailId.trim())) {
						mentorLoginValidation.put("error","Wrong Email Id");

					}
					else if(!rs.getString("password").trim().contentEquals(password.trim())) {
						mentorLoginValidation.put("error","Invalid Password");	
					}
					
					else {
						mentorLoginValidation.put("status",true);	
						Mentor mentorDetails =new Mentor();

						mentorDetails.setPkMentorId(rs.getInt(1));
						mentorDetails.setName(rs.getString(2));
						mentorDetails.setEmailId(rs.getString(4));
	             
					mentorLoginValidation.put("mentor",mentorDetails);

					}
				}
				con.close();

			} catch (Exception e) {
				e.printStackTrace();
			}

			return mentorLoginValidation;
		}

	public String fetchMentorDetails(String mentorId) {
		
		String result = null;
		Connection con = new DataBaseConnection().getDatabaseConnection();
		try {

			String query = "SELECT mentor.pkMentorResgistrationId,mentor.name,mentor.emailId,mentor.recoveryEmailId,mentor.mobileNumber,mentor.recoveryMobileNumber,mentor.DOB,mentor.gender FROM `mentor_registration` AS mentor " + 
					"WHERE mentor.pkMentorResgistrationId=? LIMIT 1";
			PreparedStatement pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1, Integer.parseInt(mentorId));
			
			ResultSet rs = pstmt.executeQuery();
			List<Mentor> mentorDetailsList = new ArrayList<Mentor>();

			while (rs.next()) { 
				 
				Mentor  mentor =new Mentor();

				mentor.setPkMentorId(rs.getInt(1));
				mentor.setName(rs.getString(2));
				mentor.setEmailId(rs.getString(3));
				mentor.setRecoveryEmailId(rs.getString(4));
				mentor.setMobileNo(rs.getString(5));
              mentor.setRecoveryMobileNumber(rs.getString(6));
              mentor.setDOB(String.valueOf(rs.getDate(7)));
              mentor.setGender(rs.getString(8));
             
              
              mentorDetailsList.add(mentor);
              
              Gson json = new Gson();

  			result = json.toJson(mentorDetailsList);
          
			}
			con.close();

		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
		
		
		
	}
}
