package com.college.admin.dao;

import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Base64;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Part;

import com.college.dataBaseConnection.DataBaseConnection;
import com.college.model.Admin;
import com.college.model.TeacherDetails;
import com.google.gson.Gson;

public class AdminLoginValidation {

	public Map<String, Object> validateDetails(String name, String mobileNumber, String emailId, String password) {
	Map<String,Object> adminLoginValidation=new HashMap<String,Object>();

		
		Connection con = new DataBaseConnection().getDatabaseConnection();
		try {

			String query = "SELECT pkAdminResgistrationId,name,mobileNumber,emailId,password FROM `admin_registration` where name=? and emailId=? and mobileNumber=? and password=? and isDeleted=? limit 1";
			PreparedStatement pstmt = con.prepareStatement(query);
			pstmt.setString(1, name.trim());
			pstmt.setString(2,emailId.trim());
			pstmt.setString(3, mobileNumber.trim());
			pstmt.setString(4, password.trim());
			pstmt.setInt(5, 0);
			ResultSet rs = pstmt.executeQuery();

			adminLoginValidation.put("status",false);	
			adminLoginValidation.put("error","No Account Found");
			
			while (rs.next()) { 
				 
				 if(!rs.getString("name").trim().contentEquals(name.trim())) {
					 adminLoginValidation.put("error","Wrong Name");
	
				}
				else if(!rs.getString("emailId").trim().contentEquals(emailId.trim())) {
					adminLoginValidation.put("error","Wrong Email Id");

				}
				else if(!rs.getString("password").trim().contentEquals(password.trim())) {
					adminLoginValidation.put("error","Invalid Password");	
				}
				
				else {
					adminLoginValidation.put("status",true);	
				Admin adminDetails =new Admin();

				adminDetails.setPkadminId(rs.getInt(1));
				adminDetails.setName(rs.getString(2));
				adminDetails.setMobileNo(rs.getString(3));
				adminDetails.setEmailId(rs.getString(4));
             
				adminLoginValidation.put("admin",adminDetails);

				}
			}
			con.close();

		} catch (Exception e) {
			e.printStackTrace();
		}

		return adminLoginValidation;
	}
	
	public String fetchAdminDetails(String adminId) {
		String result = null;
		Connection con = new DataBaseConnection().getDatabaseConnection();
		try {

			String query = "SELECT name,emailId,recoveryEmailId,mobileNumber,recoveryMobileNumber,DOB,gender,photo from admin_registration where pkAdminResgistrationId=? limit 1";
			PreparedStatement pstmt = con.prepareStatement(query);
			pstmt.setInt(1, Integer.parseInt(adminId));
			
			ResultSet rs = pstmt.executeQuery();
			List<TeacherDetails> teacherDetailsList = new ArrayList<TeacherDetails>();

			while (rs.next()) { 
				 
				TeacherDetails  teacherDetails =new TeacherDetails();

 
              teacherDetails.setTecherName(rs.getString(1));
              teacherDetails.setEmailId(rs.getString(2));
              teacherDetails.setRecoveryEmailId(rs.getString(3));
              teacherDetails.setMobileNo(rs.getString(4));
              teacherDetails.setRecoveryMobileNumber(rs.getString(5));
              teacherDetails.setDOB(String.valueOf(rs.getDate(6)));
              teacherDetails.setGender(rs.getString(7));
              Blob blob = rs.getBlob(8);
              
              if(blob!=null) {
            	// Preparing Image to send user
  				InputStream inputStream = blob.getBinaryStream();
  				
  				byte[] buffer = new byte[4096];
  				int bytesRead = -1;
  				ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
  				while ((bytesRead = inputStream.read(buffer)) != -1) {
  					outputStream.write(buffer, 0, bytesRead);
  				}
  				
  				byte[] imageBytes = outputStream.toByteArray();
  				String base64Image = Base64.getEncoder().encodeToString(imageBytes);

  				teacherDetails.setBase64Image(base64Image);
  				
  			
  				inputStream.close();
  				outputStream.close();
              }
           
              
              
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
	
	public String updateDetails(String teacherId,String recoveryEmail, String recoveryMobileNumber, String dob,Part photo) {
		String result=null;
		Connection con = new DataBaseConnection().getDatabaseConnection();
		try {
			
					String columns[]= {"recoveryEmailId","recoveryMobileNumber","DOB","photo"};
				
					
					StringBuffer sb=new StringBuffer("update admin_registration set ");
					
					int update=0;
					
					if(!recoveryEmail.trim().isEmpty()) {
						
						sb.append(columns[0]+"=?");
						update++;
					}
					if(!recoveryMobileNumber.trim().isEmpty()) {
                        if(update>0) {
                        	sb.append(","+columns[1]+"=?");
    						update++;
						}else {
							sb.append(columns[1]+"=?");
							update++;
						}
						
					}
					if(!dob.trim().isEmpty()) {
						 if(update>0) {
							 sb.append(","+columns[2]+"=?");
								update++;
							}else {
								sb.append(columns[2]+"=?");
								update++;
							}
						
					}
					if(photo.getSize()!=0) {
						 if(update>0) {
							 sb.append(","+columns[3]+"=?");
								update++;
							}else {
								sb.append(columns[3]+"=?");
								update++;
							}
					
					}
					sb.append(",updateDate=?");
					
					
					
					if(update>0) {
						sb.append(" where pkAdminResgistrationId="+Integer.parseInt(teacherId));
						
						
						
						PreparedStatement pstmt = con.prepareStatement(sb.toString());
					
						int count=1;
						if(!recoveryEmail.trim().isEmpty()) {
							pstmt.setString(count, recoveryEmail);
							count++;
						}
						if(!recoveryMobileNumber.trim().isEmpty()) {
							pstmt.setString(count, recoveryMobileNumber);
							count++;
						}
						if(!dob.trim().isEmpty()) {
							pstmt.setObject(count, dob);
							count++;
						}
						if(photo.getSize()!=0) {
							pstmt.setBlob(count, photo.getInputStream());
						count++;
						}
						pstmt.setObject(count, new Date());

						
						// Updating details
						int updateStatus = pstmt.executeUpdate();
						if (updateStatus > 0) {
							result = "Details Updated Successfully";
						} else {
							result = "Details Not Updated";
							
						
					}
		      		}
			     	
				else {
					result="Please Enter any new details to update";
				}
			 
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
			result = "Something went wrong.Please try again";
		}
		return result;
	}
	

}
