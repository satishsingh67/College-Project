package com.college.teacher.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Date;

import javax.servlet.http.Part;

import com.college.dataBaseConnection.DataBaseConnection;

public class ChangePassword {
	public String changeTeacherPassword(String teacherId,String existingEmail, String currentPassword, String newPassword,
			String reNewPassword) {
		String result=null;
		Connection con = new DataBaseConnection().getDatabaseConnection();
		try {
			String checkDetailsQuery = "Select emailId,password from teacher_registration where pkTeacherId=? LIMIT 1";
			PreparedStatement pstmt = con.prepareStatement(checkDetailsQuery);
			pstmt.setInt(1, Integer.parseInt(teacherId));
			ResultSet rst = pstmt.executeQuery();
			if (rst.next()) {
				
				String status=(!(rst.getString(1).trim().equalsIgnoreCase(existingEmail))?"Wrong Email":!(rst.getString(2).trim().equalsIgnoreCase(currentPassword))?"Wrong Current Password":"True");
				
				if(status.trim().equalsIgnoreCase("true")) {
					String passwordUpdateQuery = "update teacher_registration set password=?,updateDate=? where pkTeacherId=?";
					PreparedStatement pstmt1 = con.prepareStatement(passwordUpdateQuery);
					pstmt1.setString(1, newPassword);
					pstmt1.setObject(2, new Date());
					pstmt1.setInt(3, Integer.parseInt(teacherId));
					// Updating details
					int updateStatus = pstmt1.executeUpdate();
					if (updateStatus > 0) {
						result = "Password Updated Successfully";
					} else {
						result = "Password Not Updated";
					}
				}
				else {
					result=status;
				}
			} else {
				result = "Data not found with given details";
			}
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
			result = "Something went wrong.Please try again";
		}
		return result;
	}
	
	public String updateDetails(String teacherId,String recoveryEmail, String recoveryMobileNumber, String dob,Part photo) {
		String result=null;
		Connection con = new DataBaseConnection().getDatabaseConnection();
		try {
			
					String columns[]= {"recoveryEmailId","recoveryMobileNo","DOB","photo"};
				
					
					StringBuffer sb=new StringBuffer("update teacher_registration set ");
					
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
						sb.append(" where pkTeacherId="+Integer.parseInt(teacherId));
						
						
						
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

	public String changeMentorPassword(String mentorId, String existingEmail, String currentPassword,
			String newPassword, String reNewPassword) {
		String result=null;
		Connection con = new DataBaseConnection().getDatabaseConnection();
		try {
			String checkDetailsQuery = "Select emailId,password from mentor_registration where pkMentorResgistrationId=? LIMIT 1";
			PreparedStatement pstmt = con.prepareStatement(checkDetailsQuery);
			pstmt.setInt(1, Integer.parseInt(mentorId));
			ResultSet rst = pstmt.executeQuery();
			if (rst.next()) {
				
				String status=(!(rst.getString(1).trim().equalsIgnoreCase(existingEmail))?"Wrong Email":!(rst.getString(2).trim().equalsIgnoreCase(currentPassword))?"Wrong Current Password":"True");
				
				if(status.trim().equalsIgnoreCase("true")) {
					String passwordUpdateQuery = "update mentor_registration set password=?,updateDate=? where pkMentorResgistrationId=?";
					PreparedStatement pstmt1 = con.prepareStatement(passwordUpdateQuery);
					pstmt1.setString(1, newPassword);
					pstmt1.setObject(2, new Date());
					pstmt1.setInt(3, Integer.parseInt(mentorId));
					// Updating details
					int updateStatus = pstmt1.executeUpdate();
					if (updateStatus > 0) {
						result = "Password Updated Successfully";
					} else {
						result = "Password Not Updated";
					}
				}
				else {
					result=status;
				}
			} else {
				result = "Data not found with given details";
			}
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
			result = "Something went wrong.Please try again";
		}
		return result;
	}
	
	public String updateDetailsMentor(String mentorId,String existingPhoneNumber,String recoveryEmail, String recoveryMobileNumber, String dob,Part photo) {
		String result=null;
		Connection con = new DataBaseConnection().getDatabaseConnection();
		try {
			
					String columns[]= {"recoveryEmailId","recoveryMobileNumber","DOB","photo","mobileNumber"};
				
					
					StringBuffer sb=new StringBuffer("update mentor_registration set ");
					
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
					if(!existingPhoneNumber.trim().isEmpty()) {
						 if(update>0) {
	                        	sb.append(","+columns[4]+"=?");
	    						update++;
							}else {
								sb.append(columns[4]+"=?");
								update++;
							}
					
					}
					sb.append(",updateDate=? ");
					
					
					if(update>0) {
						sb.append(" where pkMentorResgistrationId="+Integer.parseInt(mentorId));
						
						
						
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
						if(!existingPhoneNumber.trim().isEmpty()) {
							pstmt.setString(count, existingPhoneNumber);
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
	
	public String changeCanvasPassword(String canvasId, String existingEmail, String currentPassword,
			String newPassword, String reNewPassword) {
		String result=null;
		Connection con = new DataBaseConnection().getDatabaseConnection();
		try {
			String checkDetailsQuery = "Select emailId,password from canvas_account where pkCanvasAccountId=? LIMIT 1";
			PreparedStatement pstmt = con.prepareStatement(checkDetailsQuery);
			pstmt.setInt(1, Integer.parseInt(canvasId));
			ResultSet rst = pstmt.executeQuery();
			if (rst.next()) {
				
				String status=(!(rst.getString(1).trim().equalsIgnoreCase(existingEmail))?"Wrong Email":!(rst.getString(2).trim().equalsIgnoreCase(currentPassword))?"Wrong Current Password":"True");
				
				if(status.trim().equalsIgnoreCase("true")) {
					String passwordUpdateQuery = "update canvas_account set password=?,updateDate=? where pkCanvasAccountId=?";
					PreparedStatement pstmt1 = con.prepareStatement(passwordUpdateQuery);
					pstmt1.setString(1, newPassword);
					pstmt1.setObject(2, new Date());
					pstmt1.setInt(3, Integer.parseInt(canvasId));
					// Updating details
					int updateStatus = pstmt1.executeUpdate();
					if (updateStatus > 0) {
						result = "Password Updated Successfully";
					} else {
						result = "Password Not Updated";
					}
				}
				else {
					result=status;
				}
			} else {
				result = "Data not found with given details";
			}
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
			result = "Something went wrong.Please try again";
		}
		return result;
	}
	
	
}
