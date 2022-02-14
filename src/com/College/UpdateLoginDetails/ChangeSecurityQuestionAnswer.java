package com.college.updateLoginDetails;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Date;

import com.college.dataBaseConnection.DataBaseConnection;

public class ChangeSecurityQuestionAnswer {
	public String changeSecurityQuestionAnswer(String existingPhoneNumber,String existingEmail,String existingSecurityPin,String idNumber,String existingSecurityQuestion,String existingSecurityQuestionAnswer,String newSecurityQuestionAnswer) {
		String result=null;
		Connection con = new DataBaseConnection().getDatabaseConnection();
		try {
		String checkDetailsQuery="Select * from registration where phoneNumber=? and email=? and securityPin=? and idNumber=? and securityQuestion=? and securityQuestionAnswer=?";
		PreparedStatement pstmt=con.prepareStatement(checkDetailsQuery);
				pstmt.setString(1,existingPhoneNumber.trim());   
				pstmt.setString(2,existingEmail.trim());
				pstmt.setString(3,existingSecurityPin.trim());   
				pstmt.setString(4,idNumber.trim());
				pstmt.setString(5,existingSecurityQuestion.trim());   
				pstmt.setString(6,existingSecurityQuestionAnswer.trim());
				ResultSet rst=pstmt.executeQuery();
				if(rst.next()) {
				String securityAnswerUpdateQuery="update registration set securityQuestionAnswer=?,updateDate=? where pkRegistrationId=? and email=? and idNumber=?";
				PreparedStatement pstmt1=con.prepareStatement(securityAnswerUpdateQuery);
				pstmt1.setString(1, newSecurityQuestionAnswer);
				pstmt1.setObject(2,new Date());
				pstmt1.setInt(3,rst.getInt("pkRegistrationId"));
				pstmt1.setString(4, existingEmail);
				pstmt1.setString(5, idNumber);
			    //Updating details	
				int updateStatus=pstmt1.executeUpdate();
			    if(updateStatus>0) {
			    	result="Updated";
			    }else {
			    	result="Not Updated";
			    }
				}
				else {
					result="Data not found with given details";
				}
				con.close();
		}catch(Exception e) {
			e.printStackTrace();
			result="Something went wrong.Please try again";
		}
	return result;	
	}
	/*public static void main(String[] args) {
	String a=new ChangeSecurityQuestionAnswer().changeSecurityQuestionAnswer("666666", "67singh.satwish@gmail.com", "123456", "GNIT/2018/0348","Your Home Town", "Siwan","Kolkata");
System.out.println(a);
}*/
	
}
